library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Marmot_Config is
    constant ext_instr_width : integer := 16;
    constant int_instr_width : integer := 17;
    constant address_adder   : std_logic_vector := "001";
    constant address_nand    : std_logic_vector := "010";
    constant address_bshl    : std_logic_vector := "101";
    constant address_bshr    : std_logic_vector := "110";
    constant address_test    : std_logic_vector := "111";
    constant address_mult    : std_logic_vector := "011";
end package Marmot_Config;
