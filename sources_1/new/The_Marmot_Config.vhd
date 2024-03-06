library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Marmot_Config is
    constant INSTR_width     :   integer        := 16;
    constant REG_width       :   integer        := 17;
    constant REG_IDX_width   :   integer        := 3;
    
    constant IF_ID_width     :   integer        := 17;
    constant ID_EX_width     :   integer        := 83;   -- [16 - instruction][16 - NPC][17 - ra_data][17 - rb_data][17 - rc_data]
    constant EX_MEM_width    :   integer        := 17;   -- 16 bits for 1 word
    constant MEM_WB_width    :   integer        := 17;   -- 16 bits for 1 word

    constant op_nop          : std_logic_vector := "0000000";
    constant op_add          : std_logic_vector := "0000001";
    constant op_sub          : std_logic_vector := "0000010";
    constant op_mult         : std_logic_vector := "0000011";
    constant op_nand         : std_logic_vector := "0000100";
    constant op_bshl         : std_logic_vector := "0000101";
    constant op_bshr         : std_logic_vector := "0000110";
    constant op_test         : std_logic_vector := "0000111";
    constant op_out          : std_logic_vector := "0100000";
    constant op_in           : std_logic_vector := "0100001";
    
    constant alu_mode_a0     : std_logic_vector := "000";
    constant alu_mode_a1     : std_logic_vector := "001";
    constant alu_mode_a2     : std_logic_vector := "010";
    constant alu_mode_a3     : std_logic_vector := "011";
    
    constant OPC_width       :   integer         := 7;
    constant ALU_Op_width    :   integer         := 3;
    constant MEM_Op_width    :   integer         := 2;
    constant WB_Op_width     :   integer         := 2;    
    
-- Example of record type implementation of fields within latches    
--    type IF_ID_rec is record
--            INSTR: std_logic_vector(INSTR_width-1 downto 0);
--            NPC   : std_logic_vector(INSTR_width-1 downto 0);        
--    end record IF_ID_rec;

--    type ID_EX_rec is record
--            INSTR   : std_logic_vector(INSTR_width-1 downto 0);
--            NPC     : std_logic_vector(INSTR_width-1 downto 0);
--            ra_data : std_logic_vector(REG_width-1 downto 0);
--            rb_data : std_logic_vector(REG_width-1 downto 0);
--            rc_data : std_logic_vector(REG_width-1 downto 0);        
--    end record ID_EX_rec;
    
end package Marmot_Config;