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
    Reset_Execute_Port  : IN  std_logic;
    Reset_Load_Port     : IN  std_logic;
    Reset_PC            : OUT std_logic;
    Reset_IF_ID         : OUT std_logic;
    Reset_Reg           : OUT std_logic;
    Reset_ID_EX         : OUT std_logic;
    Reset_EX_MEM        : OUT std_logic;
    Reset_MEM_WB        : OUT std_logic;

    -- Latch Ports
--    PC_PORT             : in  std_logic_vector(instr_addr_width);
    IF_ID_PORT          : IN  std_logic_vector(instr_width);
    ID_EX_PORT          : IN  std_logic_vector(instr_width);
    EX_MEM_PORT         : IN  std_logic_vector(instr_width);
    MEM_WB_PORT         : IN  std_logic_vector(instr_width);

    -- ALU Ports
    ALU_N               : IN std_logic;
    ALU_Z               : IN std_logic;
    ALU_Ov              : IN std_logic;

    -- Control Signal Ports
    Disp_Select_Port    : OUT std_logic_vector(instr_type_width);

  	-- Read indices
    RD_INDEX_1          : OUT std_logic_vector(rd_index_width);
    RD_INDEX_2          : OUT std_logic_vector(rd_index_width);
    
  	-- Source for ALU inputs
    ALU_SRC_1           : OUT std_logic_vector(alu_src_width);
    ALU_SRC_2           : OUT std_logic_vector(alu_src_width);

    -- Source for EX stage result
    EX_RES_SRC          : OUT std_logic_vector(ex_res_src_width);
    
  	-- RAM control signals
    MEM_WR_nRD          : OUT std_logic_vector(byte_addressable);
    MEM_DATA_ADDR_SRC   : OUT std_logic_vector(mem_src_width);
    MEM_DATA_DATA_SRC   : OUT std_logic_vector(mem_src_width);

  	-- WB control signals
    WB_EN               : OUT std_logic;
    WB_SRC              : OUT std_logic_vector(wb_src_width);
    MEM_WB_INDEX        : OUT std_logic_vector(reg_idx_width);

  	-- Branch control signals
    Branch_Relative     : OUT std_logic

    );
end Controller;

architecture Behavioral of Controller is

    -- Global Reset Signals
    signal Reset_Execute      : std_logic;
    signal Reset_Load         : std_logic;

    -- Latch Signals
    signal IF_ID_INS          : std_logic_vector(instr_width);
    signal ID_EX_INS          : std_logic_vector(instr_width);
    signal EX_MEM_INS         : std_logic_vector(instr_width);
    signal MEM_WB_INS         : std_logic_vector(instr_width);
    signal IF_ID_INS_type     : std_logic_vector(instr_type_width);
    signal ID_EX_INS_type     : std_logic_vector(instr_type_width);
    signal EX_MEM_INS_type    : std_logic_vector(instr_type_width);
    signal MEM_WB_INS_type    : std_logic_vector(instr_type_width);
    
	-- Writeback target for each latch
    signal ex_mem_dest        : std_logic_vector(reg_idx_width);
    signal mem_wb_dest        : std_logic_vector(reg_idx_width);

    -- Control Signals
    signal Branch_Flag       : std_logic;
    
    -- PC Counter Calculator
    signal PC          : PC_rec;

--    signal Branch_Addr_Select  : std_logic;
    
begin
    
    Reset_Execute   <= Reset_Execute_Port;
    Reset_Load      <= Reset_Load_Port;

-----------------------------------   Hazards    ------------------------------------------------

    -- Data Hazards

    -- Check instrction relative positions 
       -- A , A
       -- 
    -- Check operands - Dependencies
       -- RAR:
    
    -- Set forwarding signals
       -- ALUSrc1
       -- ALUSec2?
    
    -- Control Hazards

----------------------------------     PC       ------------------------------------------------

    Reset_PC <= Reset_Execute or Reset_Load;                      
    
-----------------------------------   IF/ID     -------------------------------------------------        
    Reset_IF_ID <= Reset_Execute or Reset_Load; -- OR whatever else
    IF_ID_INS   <= IF_ID_PORT;

    Disp_Select_Port <= IF_ID_INS_type;

    IF_ID_Instr_Decode_instance: entity work.Instruction_Decoder
      port map(
       Instr_Port      => IF_ID_INS(op_width),
       Instr_Type_Port => IF_ID_INS_type
    );
    
    -- Branch Relative Selector --
    with IF_ID_INS_type select
         Branch_Relative <=
                           '1' when b2_instr,
                           '0' when others;
           
    RD_INDEX_1 <= IF_ID_INS(rb_width) when IF_ID_INS_type = a1_instr else
                  "111" when IF_ID_INS(op_width) = op_return else
                  "111" when IF_ID_INS(op_width) = op_load_imm else
                  IF_ID_INS(ra_width);

	RD_INDEX_2 <= IF_ID_INS(rb_width) when IF_ID_INS_type = l2_instr else
				  IF_ID_INS(rc_width);

-----------------------------------   ID/EX   -------------------------------------------------   
      Reset_ID_EX   <= Reset_Execute or Reset_Load; -- OR whatever else
      Reset_Reg     <= Reset_Execute or Reset_Load;

      ID_EX_INS <= ID_EX_PORT;
      
     ex_mem_dest <= "111" when (EX_MEM_INS_type = l1_instr or EX_MEM_INS(op_width) = op_br_sub) else
                     EX_MEM_INS(ra_width);
                     
     mem_wb_dest <= "111" when (MEM_WB_INS_type = l1_instr or MEM_WB_INS(op_width) = op_br_sub) else
                     MEM_WB_INS(ra_width);    
                     
     -- <TODO>: This is gnarly look at - make it a block?
    ALU_SRC_1 <= alu_src_fd1 when ((ID_EX_INS_type = a1_instr or ID_EX_INS_type = l2_instr) and ID_EX_INS(rb_width) = ex_mem_dest) else
                 alu_src_fd1 when (ID_EX_INS_type = l1_instr and ex_mem_dest = "111") else
                 alu_src_fd1 when (ID_EX_INS_type /= a1_instr and ID_EX_INS(ra_width) = ex_mem_dest) else
                 alu_src_fd2 when ((ID_EX_INS_type = a1_instr or ID_EX_INS_type = l2_instr) and ID_EX_INS(rb_width) = mem_wb_dest) else
                 alu_src_fd2 when (ID_EX_INS_type = l1_instr and mem_wb_dest = "111") else
                 alu_src_fd2 when (ID_EX_INS_type /= a1_instr and ID_EX_INS(ra_width) = mem_wb_dest) else

                 alu_src_rd;
                        
    ALU_SRC_2 <= alu_src_cl  when (ID_EX_INS_type = a2_instr) else
                 alu_src_fd1 when (ID_EX_INS_type = a1_instr and ID_EX_INS(rc_width) = ex_mem_dest) else
                 alu_src_fd2 when (ID_EX_INS_type = a1_instr and ID_EX_INS(rc_width) = mem_wb_dest) else

                 alu_src_rd;
    
    EX_RES_SRC <= ex_res_src_in when ID_EX_INS(op_width) = op_in else
                  ex_res_src_alu;
                 
    ID_EX_Instr_Decode_instance: entity work.Instruction_Decoder
      port map(
        Instr_Port      => ID_EX_INS(op_width),
        Instr_Type_Port => ID_EX_INS_type
      );
      
    -- IF PCScr == 1 we chose wrong (we are Branching) need to Flush
    -- IF_ID_Flush <= PCScr;
    -- ID_EC_Flush <= PCScr;
    
-----------------------------------   EX/MEM   -------------------------------------------------   
      Reset_EX_MEM <= Reset_Execute or Reset_Load; -- OR whatever else

      EX_MEM_INS <= EX_MEM_PORT;
      
	  MEM_DATA_ADDR_SRC <= mem_src_f1 when EX_MEM_INS(op_width) = op_load and EX_MEM_INS(rb_width) = mem_wb_dest else
						   mem_src_f1 when EX_MEM_INS(op_width) = op_store and EX_MEM_INS(ra_width) = mem_wb_dest else
						   mem_src_rb when EX_MEM_INS(op_width) = op_load else 
						   mem_src_ra;

	  MEM_DATA_DATA_SRC <= mem_src_f1 when EX_MEM_INS(rb_width) = mem_wb_dest else
						   mem_src_rb;

      MEM_WR_nRD <= write_word when EX_MEM_INS(op_width) = op_store else read_mem; 

      WB_SRC <=
         wb_src_mem when EX_MEM_INS(op_width) = op_load else
         wb_src_npc when EX_MEM_INS(op_width) = op_br_sub else
         wb_src_in  when EX_MEM_INS(op_width) = op_in else
         wb_src_alu;
        
      EX_MEM_Instr_Decode_instance: entity work.Instruction_Decoder
       port map(
        Instr_Port      => EX_MEM_INS(op_width),
        Instr_Type_Port => EX_MEM_INS_type
       );
    
-----------------------------------   MEM/WB   -------------------------------------------------   
      Reset_MEM_WB <= Reset_Execute or Reset_Load; -- OR whatever else 

      MEM_WB_INS <= MEM_WB_PORT;
      
      WB_EN <= '1' when 
        MEM_WB_PORT(op_width) = op_add OR
        MEM_WB_PORT(op_width) = op_sub OR
        MEM_WB_PORT(op_width) = op_mult OR
        MEM_WB_PORT(op_width) = op_nand OR
        MEM_WB_PORT(op_width) = op_bshl OR
        MEM_WB_PORT(op_width) = op_bshr OR
        MEM_WB_PORT(op_width) = op_in OR
        MEM_WB_PORT(op_width) = op_br_sub OR
        MEM_WB_PORT(op_width) = op_load OR
        MEM_WB_PORT(op_width) = op_load_imm OR
        MEM_WB_PORT(op_width) = op_mov
        else '0';
      
	  MEM_WB_INDEX <= "111" when MEM_WB_PORT(op_width) = op_br_sub else
					  "111" when MEM_WB_PORT(op_width) = op_load_imm else
					  MEM_WB_PORT(ra_width);
        
      MEM_WB_Instr_Decode_instance: entity work.Instruction_Decoder
       port map(
        Instr_Port      => MEM_WB_INS(op_width),
        Instr_Type_Port => MEM_WB_INS_type
       );
       
-----------------------------------   OUT Port   -------------------------------------------------   
    
end Behavioral;
