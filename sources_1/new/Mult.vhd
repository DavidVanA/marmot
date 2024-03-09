library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Marmot_Config.all;

entity Mult is
    Port(
        Mult_A,Mult_B     : IN std_logic_vector(instr_width);
        Mult_C            : OUT std_logic_vector(reg_width)
        );
end Mult;


architecture Behavioral of Mult is

    signal  o_mult_result : std_logic_vector(31 downto 0);
    signal  o_overflow    : std_logic;

begin

    -- perform 16 * 16 = 32
    o_mult_result <= std_logic_vector(unsigned(Mult_A(instr_width)) * unsigned(Mult_B(instr_width)));
        
    -- test for overflow
    o_overflow <= o_mult_result(31) OR
                  o_mult_result(30) OR
                  o_mult_result(29) OR
                  o_mult_result(28) OR
                  o_mult_result(27) OR
                  o_mult_result(26) OR
                  o_mult_result(25) OR
                  o_mult_result(24) OR
                  o_mult_result(23) OR
                  o_mult_result(22) OR
                  o_mult_result(21) OR
                  o_mult_result(20) OR
                  o_mult_result(19) OR
                  o_mult_result(18) OR
                  o_mult_result(17) OR
                  o_mult_result(16);                                       
            
    -- output the ovflow flag and the lower  2 bytes of the result
    Mult_C     <= o_overflow & o_mult_result(instr_width);
    
    
end Behavioral;
