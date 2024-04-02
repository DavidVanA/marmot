----------------------------------------------------------------------------------
-- Engineer: David Van Acken
-- 
-- Create Date: 03/2/2024
-- Design Name: 
-- Module Name: Controller - Behavioral
-- Project Name: The Marmot
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Marmot_Config.all;


entity Controller is

  port (    

    -------------- Controller --------------

    Reset_Execute_Port     : IN  std_logic;
    Reset_Load_Port        : IN  std_logic;
                           
    IF_ID_instr            : IN  std_logic_vector(instr_width);
    ID_EX_instr            : IN  std_logic_vector(instr_width);
    EX_MEM_instr           : IN  std_logic_vector(instr_width);
    MEM_WB_instr           : IN  std_logic_vector(instr_width);
                           
    -------------- PC             --------------
    Reset_PC               : OUT std_logic;
    PCSrc_Select           : OUT std_logic;
                           
    -------------- IF/ID          --------------
    Reset_IF_ID            : OUT std_logic;
                           
    -- Registers           
    Reset_Reg              : OUT std_logic;
    Reg_Idx_1_Select       : OUT std_logic_vector(reg_idx_width);
    Reg_Idx_2_Select       : OUT std_logic_vector(reg_idx_width);
    -------------- ID/EX          --------------
    Reset_ID_EX            : OUT std_logic;
                           
    -- ALU Ports           
    ALU_A_Select           : OUT std_logic_vector(alu_src_width);
    ALU_B_Select           : OUT std_logic_vector(alu_src_width);
                           
    ALU_N                  : IN std_logic;
    ALU_Z                  : IN std_logic;
    ALU_Ov                 : IN std_logic;
                           
    -- Source for EX sta   ge result
    Result_Select          : OUT std_logic_vector(ex_res_src_width);
                           
                           
    -- Branch Calculator   
    Disp_Select_Port       : OUT std_logic_vector(instr_type_width);
    Branch_Relative        : OUT std_logic;
                           
    -------------- EX/ME   M      --------------
    Reset_EX_MEM           : OUT std_logic;

     -- Memory control signals
    Mem_Write_Not_Read     : OUT std_logic_vector(byte_addressable);
    Mem_Data_Addr_Select   : OUT std_logic_vector(mem_src_width);
    Mem_Data_Write_Select  : OUT std_logic_vector(mem_src_width);
    
    -------------- MEM/WB      --------------
    Reset_MEM_WB           : OUT std_logic;      

    	-- WB control signals
    Reg_Wb                 : OUT std_logic;
    Reg_Wb_Data_Select     : OUT std_logic_vector(wb_src_width);
    Reg_Wb_Idx             : OUT std_logic_vector(reg_idx_width)
    
    -- Latch Ports
--    PC_PORT             : in  std_logic_vector(instr_addr_width);

    );
end Controller;

architecture Behavioral of Controller is

    -- Global Reset Signals
    signal Reset_Execute      : std_logic;
    signal Reset_Load         : std_logic;

    -------------- PC    --------------
    
    signal PC                 : PC_rec; -- Is this used?    
    signal PCSrc              : std_logic;
    
    -------------- IF/ID --------------

    signal IF_ID_INS          : std_logic_vector(instr_width);
    signal IF_ID_INS_type     : std_logic_vector(instr_type_width);

    -------------- ID/EX --------------

    signal ID_EX_INS          : std_logic_vector(instr_width);
    signal ID_EX_INS_type     : std_logic_vector(instr_type_width);

    signal Status_Flags       : Status_Flags_rec;
    
    signal Branch_Flag        : std_logic;
    
    -------------- EX/MEM -------------

    signal EX_MEM_INS         : std_logic_vector(instr_width);
    signal EX_MEM_INS_type    : std_logic_vector(instr_type_width);
    
    -------------- MEM/WB -------------

    signal MEM_WB_INS         : std_logic_vector(instr_width);    
    signal MEM_WB_INS_type    : std_logic_vector(instr_type_width);
    
	-- Writeback target for each latch
    signal ex_mem_dest        : std_logic_vector(reg_idx_width);
    signal mem_wb_dest        : std_logic_vector(reg_idx_width);

--    signal Branch_Addr_Select  : std_logic;
    
begin
    
    Reset_Execute   <= Reset_Execute_Port;
    Reset_Load      <= Reset_Load_Port;
    
----------------------------------     PC       ------------------------------------------------

    Reset_PC <= Reset_Execute or Reset_Load;                      
    
-----------------------------------   IF/ID     -------------------------------------------------        
    Reset_IF_ID <= Reset_Execute or Reset_Load or PCSrc; 
    IF_ID_INS   <= IF_ID_instr;

    IF_ID_Instr_Decode_instance: entity work.Instruction_Decoder
      port map(
       Instr_Port      => IF_ID_INS(op_width),
       Instr_Type_Port => IF_ID_INS_type
    );
    
    -- Branch Relative Selector --
    with ID_EX_INS_type select
         Branch_Relative <=
                           '1' when b2_instr,
                           '0' when others;
           
    Reg_Idx_1_Select <= IF_ID_INS(rb_width) when IF_ID_INS_type = a1_instr else
                  reg_7_idx when IF_ID_INS(op_width) = op_return else -- selecting
                  reg_7_idx when IF_ID_INS(op_width) = op_load_imm else
                  IF_ID_INS(ra_width);

	Reg_Idx_2_Select <= IF_ID_INS(rb_width) when IF_ID_INS_type = l2_instr else
				  IF_ID_INS(rc_width);

-----------------------------------   ID/EX   -------------------------------------------------   
     Reset_ID_EX   <= Reset_Execute or Reset_Load or PCSrc; 
     Reset_Reg     <= Reset_Execute or Reset_Load;

    ID_EX_Instr_Decode_instance: entity work.Instruction_Decoder
      port map(
        Instr_Port      => ID_EX_INS(op_width),
        Instr_Type_Port => ID_EX_INS_type
      );
    
     ID_EX_INS <= ID_EX_instr;
     Disp_Select_Port <= ID_EX_INS_type;      
     ex_mem_dest <= "111" when (EX_MEM_INS_type = l1_instr or EX_MEM_INS(op_width) = op_br_sub) else
                     EX_MEM_INS(ra_width);
                     
     mem_wb_dest <= "111" when (MEM_WB_INS_type = l1_instr or MEM_WB_INS(op_width) = op_br_sub) else
                     MEM_WB_INS(ra_width);    
                     
     -- Forwarding/ALU input select
    ALU_A_Select <= alu_src_fd1 when ((ID_EX_INS_type = a1_instr or ID_EX_INS_type = l2_instr) and ID_EX_INS(rb_width) = ex_mem_dest) else
                    alu_src_fd1 when (ID_EX_INS_type = l1_instr and ex_mem_dest = "111") else
                    alu_src_fd1 when (ID_EX_INS_type /= a1_instr and ID_EX_INS(ra_width) = ex_mem_dest) else
                    alu_src_fd2 when ((ID_EX_INS_type = a1_instr or ID_EX_INS_type = l2_instr) and ID_EX_INS(rb_width) = mem_wb_dest) else
                    alu_src_fd2 when (ID_EX_INS_type = l1_instr and mem_wb_dest = "111") else
                    alu_src_fd2 when (ID_EX_INS_type /= a1_instr and ID_EX_INS(ra_width) = mem_wb_dest) else
                    alu_src_rd;
                        
    ALU_B_Select <= alu_src_cl  when (ID_EX_INS_type = a2_instr) else
                    alu_src_fd1 when (ID_EX_INS_type = a1_instr and ID_EX_INS(rc_width) = ex_mem_dest) else
                    alu_src_fd2 when (ID_EX_INS_type = a1_instr and ID_EX_INS(rc_width) = mem_wb_dest) else
                    alu_src_rd;

    Status_Flags.zero     <= ALU_Z;
    Status_Flags.neg      <= ALU_N;
    Status_Flags.overflow <= ALU_Ov;
    
    -- ALU Output Select    
    Result_Select <= ex_res_src_in when ID_EX_INS(op_width) = op_in else
                  ex_res_src_alu;
                     
      
    Branch_Resolver_instance: entity work.Branch_Resolver
      port map(
        Status     => Status_Flags,
        Opcode     => ID_EX_INS(op_width),
        PCSrc_Port => PCSrc
    );
               
    -- Send the select PCScr to The_Marmot via the PCScr_Select signal
    PCSrc_Select <= PCSrc;
        
-----------------------------------   EX/MEM   -------------------------------------------------   
      Reset_EX_MEM <= Reset_Execute or Reset_Load; -- OR whatever else
      EX_MEM_INS <= EX_MEM_instr;

      EX_MEM_Instr_Decode_instance: entity work.Instruction_Decoder
       port map(
        Instr_Port      => EX_MEM_INS(op_width),
        Instr_Type_Port => EX_MEM_INS_type
       );
          
	  Mem_Data_Addr_Select <= mem_src_f1 when EX_MEM_INS(op_width) = op_load and EX_MEM_INS(rb_width) = mem_wb_dest else
						      mem_src_f1 when EX_MEM_INS(op_width) = op_store and EX_MEM_INS(ra_width) = mem_wb_dest else
						      mem_src_rb when EX_MEM_INS(op_width) = op_load else 
						      mem_src_ra;

	  Mem_Data_Write_Select <= mem_src_f1 when EX_MEM_INS(rb_width) = mem_wb_dest else
						       mem_src_rb;

      -- We only write to data memory on a store
      Mem_Write_Not_Read    <= write_word when EX_MEM_INS(op_width) = op_store else read_mem; 

      Reg_Wb_Data_Select <=
         wb_src_mem when EX_MEM_INS(op_width) = op_load else
         wb_src_npc when EX_MEM_INS(op_width) = op_br_sub else
         wb_src_in  when EX_MEM_INS(op_width) = op_in else
         wb_src_alu;
    
-----------------------------------   MEM/WB   -------------------------------------------------   
      Reset_MEM_WB <= Reset_Execute or Reset_Load; -- OR whatever else 
      MEM_WB_INS <= MEM_WB_instr;

      MEM_WB_Instr_Decode_instance: entity work.Instruction_Decoder
       port map(
        Instr_Port      => MEM_WB_INS(op_width),
        Instr_Type_Port => MEM_WB_INS_type
       );

      -- Register Writeback signal
      Reg_Wb <= '1' when 
        MEM_WB_instr(op_width) = op_add OR
        MEM_WB_instr(op_width) = op_sub OR
        MEM_WB_instr(op_width) = op_mult OR
        MEM_WB_instr(op_width) = op_nand OR
        MEM_WB_instr(op_width) = op_bshl OR
        MEM_WB_instr(op_width) = op_bshr OR
        MEM_WB_instr(op_width) = op_in OR
        MEM_WB_instr(op_width) = op_br_sub OR
        MEM_WB_instr(op_width) = op_load OR
        MEM_WB_instr(op_width) = op_load_imm OR
        MEM_WB_instr(op_width) = op_mov
        else '0';

      -- Register Writeback index
	  Reg_Wb_Idx <= reg_7_idx when MEM_WB_instr(op_width) = op_br_sub else
					reg_7_idx when MEM_WB_instr(op_width) = op_load_imm else
					MEM_WB_instr(ra_width);
       
-----------------------------------   OUT Port   -------------------------------------------------   
    
end Behavioral;
