library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Marmot_Config is

    -- Depreciated
--     constant INSTR_width     :   integer        := 16;
    -- constant REG_width       :   integer        := 17;
    -- constant REG_IDX_width   :   integer        := 3;    
    -- constant IF_ID_width     :   integer        := 17;
    -- constant ID_EX_width     :   integer        := 83;   -- [16 - instruction][16 - NPC][17 - ra_data][17 - rb_data][17 - rc_data]
    -- constant EX_MEM_width    :   integer        := 17;   -- 16 bits for 1 word
    -- constant MEM_WB_width    :   integer        := 17;   -- 16 bits for 1 word

    constant op_nop          : std_logic_vector(6 downto 0) := "0000000";
    constant op_add          : std_logic_vector(6 downto 0) := "0000001";
    constant op_sub          : std_logic_vector(6 downto 0) := "0000010";
    constant op_mult         : std_logic_vector(6 downto 0) := "0000011";
    constant op_nand         : std_logic_vector(6 downto 0) := "0000100";
    constant op_bshl         : std_logic_vector(6 downto 0) := "0000101";
    constant op_bshr         : std_logic_vector(6 downto 0) := "0000110";
    constant op_test         : std_logic_vector(6 downto 0) := "0000111";
    constant op_out          : std_logic_vector(6 downto 0) := "0100000";
    constant op_in           : std_logic_vector(6 downto 0) := "0100001";
    
--    constant op_nop          : std_logic_vector := "000";
--    constant op_add          : std_logic_vector := "001";
--    constant op_sub          : std_logic_vector := "010";
--    constant op_mult         : std_logic_vector := "011";
--    constant op_nand         : std_logic_vector := "100";
--    constant op_bshl         : std_logic_vector := "101";
--    constant op_bshr         : std_logic_vector := "110";
--    constant op_test         : std_logic_vector := "0111";
--    constant op_out          : std_logic_vector := "0100000";
--    constant op_in           : std_logic_vector := "0100001";
    
    constant alu_mode_a0     : std_logic_vector := "000";
    constant alu_mode_a1     : std_logic_vector := "001";
    constant alu_mode_a2     : std_logic_vector := "010";
    constant alu_mode_a3     : std_logic_vector := "011";
    
--    constant data_src_alu    : std_logic := '0';
--    constant data_src_in     : std_logic := '1';
    
    -- constant OPC_width       :   integer         := 7;
    -- constant ALU_Op_width    :   integer         := 3;
    -- constant MEM_Op_width    :   integer         := 2;
    -- constant WB_Op_width     :   integer         := 2;    

    -- Register specific ranges
    subtype reg_width      is natural range 16 downto 0;
    subtype reg_idx_width  is natural range 2 downto 0;
    
    -- ALU specific ranges
    subtype alu_mode_width is natural range 2 downto 0;
    
    -- Instruction specific ranges --   
    subtype instr_width  is natural range 15 downto 0;
    subtype op_width     is natural range 15 downto 9;

    -- A Instructions ranges
    subtype ra_width     is natural range 8 downto 6;
    subtype rb_width     is natural range 5 downto 3;
    subtype rc_width     is natural range 2 downto 0;
    subtype cl_width     is natural range 3 downto 0;

    -- B Instructions
    subtype disp_l_width is natural range 8 downto 0;
    subtype disp_s_width is natural range 5 downto 0;

    -- L instructions
    subtype imm_width    is natural range 7 downto 0;
    subtype r_rdest      is natural range 8 downto 6;
    subtype r_src        is natural range 5 downto 3;
    
   -- Pipeline Latch Record Types --
   type IF_ID_rec is record
           instr : std_logic_vector(instr_width);
           npc   : std_logic_vector(instr_width);        
   end record IF_ID_rec;

   type ID_EX_rec is record
           instr   : std_logic_vector(instr_width);
           npc     : std_logic_vector(instr_width);
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
    
end package Marmot_Config;
