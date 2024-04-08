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
    
    -- Reset Ports
    Reset_Execute_Port        : IN  std_logic;
    Reset_Load_Port           : IN  std_logic;
    
----------------------------- PC ---------------------------------------
    
    Reset_PC                  : OUT std_logic;
    PC_Select                 : OUT std_logic;

----------------------------- IF/ID -----------------------------------

    IF_ID_PORT                : IN  std_logic_vector(instr_width);
    Reset_IF_ID               : OUT std_logic;

    -- Registers
    Rd_Index_1_Select         : out std_logic_vector(rd_index_width);
    Rd_Index_2_Select         : out std_logic_vector(rd_index_width);
    Reset_Reg                 : OUT std_logic;

                
----------------------------- ID/EX -----------------------------------
    
    ID_EX_PORT                : IN  std_logic_vector(instr_width);
    Reset_ID_EX               : OUT std_logic;

  	-- Branch control signals
    Branch_Relative           : OUT std_logic;
    Disp_Select_Port          : OUT std_logic_vector(instr_type_width);
--    Disp_Select_Port          : OUT std_logic_vector(instr_type_width);

    -- ALU Ports
    ALU_A_Select              : OUT std_logic_vector(alu_src_width);
    ALU_B_Select              : OUT std_logic_vector(alu_src_width);
    ALU_N                     : IN  std_logic;
    ALU_Z                     : IN  std_logic;
    ALU_Ov                    : IN  std_logic;

    -- Source for EX stage result
    EX_Result_Select          : OUT std_logic_vector(ex_res_src_width);
    
----------------------------- EX/MEM -----------------------------------
             
    EX_MEM_PORT               : IN  std_logic_vector(instr_width);
    Reset_EX_MEM              : OUT std_logic;

    -- Memory
    Store_Not_Load            : OUT std_logic_vector(byte_addressable);
    Mem_Addr_Select           : OUT std_logic_vector(mem_src_width);
    Store_Data_Select         : OUT std_logic_vector(mem_src_width);

----------------------------- MEM/WB -----------------------------------
        
    MEM_WB_PORT               : IN  std_logic_vector(instr_width);
    Reset_MEM_WB              : OUT std_logic;

    -- Write back
    WB_Enable                 : OUT std_logic;
    WB_Data_Select            : OUT std_logic_vector(wb_src_width);
    MEM_WB_INDEX              : OUT std_logic_vector(reg_idx_width)
    );
end Controller;

architecture Behavioral of Controller is

    -- Global Reset Signals
    signal Reset_Execute      : std_logic;
    signal Reset_Load         : std_logic;

----------------------------- PC ---------------------------------------
    
    signal PC                 : PC_rec;
    signal PCSrc_conn         : std_logic;                             

----------------------------- IF/ID -----------------------------------
        
    signal IF_ID_INS          : std_logic_vector(instr_width);
    signal IF_ID_INS_type     : std_logic_vector(instr_type_width);

----------------------------- ID/EX -----------------------------------
        
    signal ID_EX_INS          : std_logic_vector(instr_width);
    signal ID_EX_INS_type     : std_logic_vector(instr_type_width);

    signal ALU_A_Read_Src     : std_logic_vector(3 downto 0);
    signal ALU_B_Read_Src     : std_logic_vector(3 downto 0);
    signal Status_Flags       : Status_Flags_rec;

----------------------------- EX/MEM -----------------------------------
    
    signal ex_mem_dest        : std_logic_vector(3 downto 0);
            
    signal EX_MEM_INS         : std_logic_vector(instr_width);
    signal EX_MEM_INS_type    : std_logic_vector(instr_type_width);

----------------------------- MEM/WB -----------------------------------
        
    signal MEM_WB_INS         : std_logic_vector(instr_width);   
    signal MEM_WB_INS_type    : std_logic_vector(instr_type_width);
    signal mem_wb_dest        : std_logic_vector(3 downto 0);

    -- Unused?
    signal Branch_Flg        : std_logic;
    
begin
    
    Reset_Execute         <= Reset_Execute_Port;
    Reset_Load            <= Reset_Load_Port;
                       
----------------------------------     PC       ------------------------------------------------
                       
    Reset_PC              <= Reset_Execute or Reset_Load;                      
                       
-----------------------------------   IF/ID     -------------------------------------------------        
                       
    Reset_IF_ID           <= Reset_Execute or Reset_Load or PCsrc_conn; -- OR whatever else
    IF_ID_INS             <= IF_ID_PORT;

    IF_ID_Instr_Decode_instance: entity work.Instruction_Decoder
      port map(
       Instr_Port         => IF_ID_INS(op_width),
       Instr_Type_Port    => IF_ID_INS_type
    );
    
    -- Branch Relative Selector --
    with ID_EX_INS_type select
         Branch_Relative  <=
                            '1' when b2_instr,
                            '0' when others;
    
    -- Registers                          
     Reset_Reg            <= Reset_Execute or Reset_Load;
     Rd_Index_1_Select     <= IF_ID_INS(rb_width) when IF_ID_INS_type = a1_instr else
                             "111" when IF_ID_INS(op_width)          = op_return else
                             "111" when IF_ID_INS(op_width)          = op_load_imm else
                             IF_ID_INS(ra_width);
                          
	Rd_Index_2_Select     <= IF_ID_INS(rb_width) when IF_ID_INS_type = l2_instr else
				             IF_ID_INS(rc_width);
                          
------------------------------------   ID/EX   -------------------------------------------------   
                          
     Reset_ID_EX          <= Reset_Execute or Reset_Load or PCsrc_conn; 


     ID_EX_INS            <= ID_EX_PORT;

    ID_EX_Instr_Decode_instance: entity work.Instruction_Decoder
      port map(
        Instr_Port        => ID_EX_INS(op_width),
        Instr_Type_Port   => ID_EX_INS_type
      );
    
    -- Branching
     Disp_Select_Port     <= ID_EX_INS_type;      

    -- Fowarding
     ex_mem_dest          <= "0111" when (EX_MEM_INS_type = l1_instr or EX_MEM_INS(op_width) = op_br_sub) else
				             "1000" when (EX_MEM_INS(op_width) /= op_add      AND
				             			 EX_MEM_INS(op_width) /= op_sub      AND
				             			 EX_MEM_INS(op_width) /= op_mult     AND
				             			 EX_MEM_INS(op_width) /= op_nand     AND
				             			 EX_MEM_INS(op_width) /= op_bshl     AND
				             			 EX_MEM_INS(op_width) /= op_bshr     AND
				             			 EX_MEM_INS(op_width) /= op_in       AND
				             			 EX_MEM_INS(op_width) /= op_br_sub   AND
				             			 EX_MEM_INS(op_width) /= op_load     AND
				             			 EX_MEM_INS(op_width) /= op_load_imm AND
				             			 EX_MEM_INS(op_width) /= op_mov)     else
                              '0' & EX_MEM_INS(ra_width);
     -- Forwarding                                  
     mem_wb_dest          <= "0111" when (MEM_WB_INS_type = l1_instr or MEM_WB_INS(op_width) = op_br_sub) else
				             "1000" when (MEM_WB_INS(op_width) /= op_add      AND
				             			 MEM_WB_INS(op_width) /= op_sub      AND
				             			 MEM_WB_INS(op_width) /= op_mult     AND
				             			 MEM_WB_INS(op_width) /= op_nand     AND
				             			 MEM_WB_INS(op_width) /= op_bshl     AND
				             			 MEM_WB_INS(op_width) /= op_bshr     AND
				             			 MEM_WB_INS(op_width) /= op_in       AND
				             			 MEM_WB_INS(op_width) /= op_br_sub   AND
				             			 MEM_WB_INS(op_width) /= op_load     AND
				             			 MEM_WB_INS(op_width) /= op_load_imm AND
				             			 MEM_WB_INS(op_width) /= op_mov)     else
                              '0' & MEM_WB_INS(ra_width);    


	ALU_A_Read_Src        <= '0' & ID_EX_INS(rb_width) when (ID_EX_INS_type = a1_instr) else
				             "0111" 				   when (ID_EX_INS_type = l1_instr  or ID_EX_INS(op_width) = op_out) else
				             '0' & ID_EX_INS(ra_width);
                          
	ALU_B_Read_Src        <= '0' & ID_EX_INS(rb_width) when (ID_EX_INS_type = l2_instr) else
	                         '0' & ID_EX_INS(rc_width) when (ID_EX_INS_type = a1_instr) else
				             "1111";
                          
	ALU_A_Select          <= alu_src_fd1 when ALU_A_Read_Src = ex_mem_dest else
				             alu_src_fd2 when ALU_A_Read_Src = mem_wb_dest else
                             alu_src_rd;
                              
    ALU_B_Select          <= alu_src_cl  when ID_EX_INS_type = a2_instr    else
                             alu_src_fd1 when ALU_B_Read_Src = ex_mem_dest else
                             alu_src_fd2 when ALU_B_Read_Src = mem_wb_dest else
                             alu_src_rd;
                         
    EX_Result_Select      <= ex_res_src_in when ID_EX_INS(op_width) = op_in else
                             ex_res_src_alu;
                 
      
    Branch_Resolver_instance: entity work.Branch_Resolver
      port map(
        Status            => Status_Flags,
        Opcode            => ID_EX_INS(op_width),
        PCSrc_Port        => PCSrc_conn
    );
               
    Status_Flags.zero     <= ALU_Z;
    Status_Flags.neg      <= ALU_N;
    Status_Flags.overflow <= ALU_Ov;
    
    PC_Select             <= PCSrc_conn;
    
-----------------------------------   EX/MEM   -------------------------------------------------   

      Reset_EX_MEM        <= Reset_Execute or Reset_Load; 
                          
      EX_MEM_INS          <= EX_MEM_PORT;

      EX_MEM_Instr_Decode_instance: entity work.Instruction_Decoder
       port map(
        Instr_Port        => EX_MEM_INS(op_width),
        Instr_Type_Port   => EX_MEM_INS_type
       );
                              
	  Mem_Addr_Select     <= mem_src_f1   when EX_MEM_INS(op_width) = op_load  and EX_MEM_INS(rb_width) = mem_wb_dest(reg_idx_width) else
						     mem_src_f1   when EX_MEM_INS(op_width) = op_store and EX_MEM_INS(ra_width) = mem_wb_dest(reg_idx_width) else
						     mem_src_rb   when EX_MEM_INS(op_width) = op_load  else 
						     mem_src_ra;
                          
	  Store_Data_Select   <= mem_src_f1   when EX_MEM_INS(rb_width) = mem_wb_dest(reg_idx_width) else
						     mem_src_rb;
                          
                          
      Store_Not_Load      <= mem_store    when EX_MEM_INS(op_width) = op_store else 
                             mem_load     when EX_MEM_INS(op_width) = op_load  else
                             mem_not_mem;

      WB_Data_Select      <= wb_src_mem   when EX_MEM_INS(op_width) = op_load   else
                             wb_src_npc   when EX_MEM_INS(op_width) = op_br_sub else
                             wb_src_out   when EX_MEM_INS(op_width) = op_out    else
                             wb_src_alu;
            
-----------------------------------   MEM/WB   -------------------------------------------------   

      Reset_MEM_WB        <= Reset_Execute or Reset_Load; -- OR whatever else 
      MEM_WB_INS          <= MEM_WB_PORT;

      MEM_WB_Instr_Decode_instance: entity work.Instruction_Decoder
       port map(
        Instr_Port      => MEM_WB_INS(op_width),
        Instr_Type_Port => MEM_WB_INS_type
       );
          
      WB_Enable <= '1' when 
        MEM_WB_PORT(op_width) = op_add      OR
        MEM_WB_PORT(op_width) = op_sub      OR
        MEM_WB_PORT(op_width) = op_mult     OR
        MEM_WB_PORT(op_width) = op_nand     OR
        MEM_WB_PORT(op_width) = op_bshl     OR
        MEM_WB_PORT(op_width) = op_bshr     OR
        MEM_WB_PORT(op_width) = op_in       OR
        MEM_WB_PORT(op_width) = op_br_sub   OR
        MEM_WB_PORT(op_width) = op_load     OR
        MEM_WB_PORT(op_width) = op_load_imm OR
        MEM_WB_PORT(op_width) = op_mov
        else '0';
      
	  MEM_WB_INDEX       <= "111" when MEM_WB_PORT(op_width) = op_br_sub   else
					        "111" when MEM_WB_PORT(op_width) = op_load_imm else
					        MEM_WB_PORT(ra_width);
       
-----------------------------------   OUT Port   -------------------------------------------------   
    
end Behavioral;
