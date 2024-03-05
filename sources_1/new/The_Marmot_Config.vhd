library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Marmot_Config is
    constant REG_width       :   integer        := 17;
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
    
    constant address_add     : std_logic_vector := "0000001";
    constant address_sub     : std_logic_vector := "0000010";            
    constant address_mult    : std_logic_vector := "0000011";
    constant address_nand    : std_logic_vector := "0000100";
    constant address_bshl    : std_logic_vector := "0000101";
    constant address_bshr    : std_logic_vector := "0000110";
    constant address_test    : std_logic_vector := "0000111";
    constant address_out     : std_logic_vector := "0100000";
    constant address_in      : std_logic_vector := "0100001";
    
    constant alu_mode_a0     : std_logic_vector := "000";
    constant alu_mode_a1     : std_logic_vector := "001";
    constant alu_mode_a2     : std_logic_vector := "010";
    constant alu_mode_a3     : std_logic_vector := "011";
    
    constant ALU_Op_width    :   integer         := 3;
    constant MEM_Op_width    :   integer         := 2;
    constant WB_Op_width     :   integer         := 2;    
end package Marmot_Config;