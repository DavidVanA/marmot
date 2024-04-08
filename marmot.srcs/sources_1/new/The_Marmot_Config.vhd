library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Marmot_Config is

    subtype op_code is natural range 6 downto 0;

    -- A format   
    constant op_nop          : std_logic_vector(op_code) := "0000000"; --  0  -- A0
    constant op_return       : std_logic_vector(op_code) := "1000111"; -- 71
    constant op_add          : std_logic_vector(op_code) := "0000001"; --  1  -- A1
    constant op_sub          : std_logic_vector(op_code) := "0000010"; --  2
    constant op_mult         : std_logic_vector(op_code) := "0000011"; --  3
    constant op_nand         : std_logic_vector(op_code) := "0000100"; --  4
    constant op_bshl         : std_logic_vector(op_code) := "0000101"; --  5  -- A2
    constant op_bshr         : std_logic_vector(op_code) := "0000110"; --  6
    constant op_test         : std_logic_vector(op_code) := "0000111"; --  7  -- A3
    constant op_out          : std_logic_vector(op_code) := "0100000"; --  32 -- A4
    constant op_in           : std_logic_vector(op_code) := "0100001"; --  33
    -- B format
    constant op_brr          : std_logic_vector(op_code) := "1000000"; -- 64  -- B1
    constant op_brr_n        : std_logic_vector(op_code) := "1000001"; -- 65
    constant op_brr_z        : std_logic_vector(op_code) := "1000010"; -- 66 
    constant op_brr_ov       : std_logic_vector(op_code) := "1001001"; -- 73
    constant op_br           : std_logic_vector(op_code) := "1000011"; -- 67  -- B2
    constant op_br_n         : std_logic_vector(op_code) := "1000100"; -- 68
    constant op_br_z         : std_logic_vector(op_code) := "1000101"; -- 69
    constant op_br_sub       : std_logic_vector(op_code) := "1000110"; -- 70
    constant op_br_ov        : std_logic_vector(op_code) := "1001000"; -- 72

    -- L format
    constant op_load         : std_logic_vector(op_code) := "0010000"; -- 16 -- L2 
    constant op_store        : std_logic_vector(op_code) := "0010001"; -- 17
    constant op_load_imm     : std_logic_vector(op_code) := "0010010"; -- 18 -- L1 
    constant op_mov          : std_logic_vector(op_code) := "0010011"; -- 19

    -- ALU input source
    constant alu_src_rd      : std_logic_vector := "000";
    constant alu_src_fd1     : std_logic_vector := "001";
    constant alu_src_fd2     : std_logic_vector := "010";
    constant alu_src_cl      : std_logic_vector := "011";
    
    -- EX result source
    constant ex_res_src_alu  : std_logic_vector := "00";
    constant ex_res_src_in   : std_logic_vector := "01";

    -- Wb source
    constant wb_src_alu      : std_logic_vector := "000";
    constant wb_src_mem      : std_logic_vector := "001";
    constant wb_src_npc      : std_logic_vector := "010";
    constant wb_src_imm_lower: std_logic_vector := "011";
    constant wb_src_imm_upper: std_logic_vector := "100";
    constant wb_src_rb       : std_logic_vector := "101";
    constant wb_src_in       : std_logic_vector := "110";
    constant wb_src_out      : std_logic_vector := "111";

    -- Instruction types
    constant a0_instr        : std_logic_vector := "000";
    constant a1_instr        : std_logic_vector := "001";
    constant a2_instr        : std_logic_vector := "010";
    constant a3_instr        : std_logic_vector := "011";
    constant b1_instr        : std_logic_vector := "100";
    constant b2_instr        : std_logic_vector := "101";
    constant l1_instr        : std_logic_vector := "110";
    constant l2_instr        : std_logic_vector := "111";

    -- Memory constants
    constant mem_load        : std_logic_vector := "00";
    constant mem_not_mem     : std_logic_vector := "10";
    constant mem_store       : std_logic_vector := "11";


	-- Memory source enum
	constant mem_src_ra		 : std_logic_vector := "00";
	constant mem_src_rb		 : std_logic_vector := "01";
	constant mem_src_f1		 : std_logic_vector := "10";

    -- Memory specific ranges
    subtype instr_mem_width  is natural range 8 downto 0;
    subtype byte_addressable is natural range 1 downto 0;
    
    -- Register specific ranges
    subtype reg_width        is natural range 16 downto 0;
    subtype reg_idx_width    is natural range 2 downto 0;
    
    -- ALU specific ranges
    subtype instr_type_width is natural range 2 downto 0;
    
    -- Instruction specific ranges    
    subtype instr_addr_width is natural range 16 downto 0; -- Address of an Instr
    subtype instr_width      is natural range 15 downto 0; -- The Instr
    subtype op_width         is natural range 15 downto 9;

    -- A Instructions ranges
    subtype ra_width         is natural range 8 downto 6;
    subtype rb_width         is natural range 5 downto 3;
    subtype rc_width         is natural range 2 downto 0;
    subtype cl_width         is natural range 3 downto 0;

    -- B Instructions
    subtype disp_l_width     is natural range 8 downto 0;
    subtype disp_s_width     is natural range 5 downto 0;

    -- L instructions
    subtype imm_width        is natural range 7 downto 0;
    subtype r_src            is natural range 5 downto 3;
    
    -- rd index mux
    subtype rd_index_width   is natural range 2 downto 0;
    
    -- alu src mux
    subtype alu_src_width    is natural range 2 downto 0;
    
    -- result src mux
    subtype ex_res_src_width is natural range 1 downto 0;

    -- wb src mux
    subtype wb_src_width     is natural range 2 downto 0;

	-- memory data src mux
	subtype mem_src_width	 is natural range 1 downto 0;

   -- Pipeline Latch Record Types
    type PC_rec is record
           pc      : std_logic_vector(instr_width);
           npc     : std_logic_vector(instr_width);
           br      : std_logic_vector(instr_width);
    end record PC_rec;

    type IF_ID_rec is record
           instr   : std_logic_vector(instr_width);
           npc     : std_logic_vector(instr_width);        
           pc      : std_logic_vector(instr_width);
   end record IF_ID_rec;

   type ID_EX_rec is record
           instr   : std_logic_vector(instr_width);
           npc     : std_logic_vector(instr_width);
           pc      : std_logic_vector(instr_width);
           br_addr : std_logic_vector(instr_width);
           ra_data : std_logic_vector(reg_width);
           rb_data : std_logic_vector(reg_width);
   end record ID_EX_rec;

   type EX_MEM_rec is record
           instr   : std_logic_vector(instr_width);
           npc     : std_logic_vector(instr_width);
           pc      : std_logic_vector(instr_width);
           ra_data : std_logic_vector(reg_width);
           rb_data : std_logic_vector(reg_width);
           result  : std_logic_vector(reg_width);
           Z       : std_logic;
           N       : std_logic;
           OV      : std_logic;
           r_src   : std_logic_vector(reg_width);
   end record EX_MEM_rec;

   type MEM_WB_rec is record
          instr    : std_logic_vector(instr_width);
          pc       : std_logic_vector(instr_width);
          result   : std_logic_vector(reg_width);
          mem_data : std_logic_vector(instr_width);
   end record MEM_WB_rec;

    -- Status Flag Latch Record Type
    type Status_Flags_rec is record
         zero      : std_logic;
         neg       : std_logic;
         overflow  : std_logic;
    end record Status_Flags_rec;
    
end package Marmot_Config;
