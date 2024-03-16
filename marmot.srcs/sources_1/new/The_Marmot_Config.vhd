library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Marmot_Config is

    subtype op_code is natural range 6 downto 0;

    -- A format
    constant op_nop          : std_logic_vector(op_code) := "0000000"; -- A0
    constant op_return       : std_logic_vector(op_code) := "1000111"; 
    constant op_add          : std_logic_vector(op_code) := "0000001"; -- A1
    constant op_sub          : std_logic_vector(op_code) := "0000010";
    constant op_mult         : std_logic_vector(op_code) := "0000011";
    constant op_nand         : std_logic_vector(op_code) := "0000100";
    constant op_bshl         : std_logic_vector(op_code) := "0000101"; -- A2
    constant op_bshr         : std_logic_vector(op_code) := "0000110";
    constant op_test         : std_logic_vector(op_code) := "0000111"; -- A3
    constant op_out          : std_logic_vector(op_code) := "0100000"; -- A4
    constant op_in           : std_logic_vector(op_code) := "0100001";
    -- B format
    constant op_brr          : std_logic_vector(op_code) := "1000000"; -- B1
    constant op_brr_n        : std_logic_vector(op_code) := "1000001";
    constant op_brr_z        : std_logic_vector(op_code) := "1000010";
    constant op_br           : std_logic_vector(op_code) := "1000011"; -- B2
    constant op_br_n         : std_logic_vector(op_code) := "1000100";
    constant op_br_z         : std_logic_vector(op_code) := "1000101";
    constant op_br_sub       : std_logic_vector(op_code) := "1000110";
    --constant  op_br_ov
    --constant op_br_cov
    -- L format
    constant op_load         : std_logic_vector(op_code) := "0010000"; -- L2 
    constant op_store        : std_logic_vector(op_code) := "0010001";
    constant op_load_imm     : std_logic_vector(op_code) := "0010010"; -- L1 
    constant op_mov          : std_logic_vector(op_code) := "0010011";

    -- ALU Mode
    -- Redundant?
    constant alu_mode_a0     : std_logic_vector := "000";
    constant alu_mode_a1     : std_logic_vector := "001";
    constant alu_mode_a2     : std_logic_vector := "010";
    constant alu_mode_a3     : std_logic_vector := "011";

    -- Instruction types
    constant a0_instr        : std_logic_vector := "000";
    constant a1_instr        : std_logic_vector := "001";
    constant a2_instr        : std_logic_vector := "010";
    constant a3_instr        : std_logic_vector := "011";
    constant b1_instr        : std_logic_vector := "100";
    constant b2_instr        : std_logic_vector := "101";
    constant l1_instr        : std_logic_vector := "110";
    constant l2_instr        : std_logic_vector := "111";
    
    -- Register specific ranges
    subtype reg_width        is natural range 16 downto 0;
    subtype reg_idx_width    is natural range 2 downto 0;
    
    -- ALU specific ranges
    subtype alu_mode_width   is natural range 2 downto 0;
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
    subtype r_rdest          is natural range 8 downto 6;
    subtype r_src            is natural range 5 downto 3;
    
   -- Pipeline Latch Record Types
    type PC_rec is record
           instr   : std_logic_vector(instr_width);
           npc     : std_logic_vector(instr_width);
           br      : std_logic_vector(instr_width);
    end record PC;

    type IF_ID_rec is record
           instr : std_logic_vector(instr_width);
           npc   : std_logic_vector(instr_width);        
   end record IF_ID_rec;

   type ID_EX_rec is record
           instr   : std_logic_vector(instr_width);
--           npc     : std_logic_vector(instr_width);
           br_addr : std_logic_vector(instr_width);
           ra_data : std_logic_vector(reg_width);
           rb_data : std_logic_vector(reg_width);
           rc_data : std_logic_vector(reg_width);        
   end record ID_EX_rec;

   type EX_MEM_rec is record
           instr   : std_logic_vector(instr_width);
           npc     : std_logic_vector(instr_width);
           result  : std_logic_vector(reg_width);
           Z       : std_logic;
           N       : std_logic;
           OV      : std_logic;
   end record EX_MEM_rec;

   type MEM_WB_rec is record
          instr    : std_logic_vector(instr_width);
          result   : std_logic_vector(reg_width);
          mem_data : std_logic_vector(instr_width);
   end record MEM_WB_rec;

    -- Status Flag Latch Record Type
    type Status_Flags_rec is record
         zero     : std_logic;
         neg      : std_logic;
         overflow : std_logic;
    end record Status_Flags;
    
end package Marmot_Config;
