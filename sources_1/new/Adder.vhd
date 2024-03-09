library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Marmot_Config.all;

entity Adder is
    Port(
        Adder_A,Adder_B     : IN std_logic_vector(instr_width);
        Adder_C             : OUT std_logic_vector(instr_width)
    );
end Adder;


architecture Behavioral of Adder is

begin
    Adder_C(instr_width) <= std_logic_vector(unsigned(Adder_A(instr_width)) + (unsigned(Adder_B(instr_width))));
    
end Behavioral;
