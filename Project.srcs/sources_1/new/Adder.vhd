library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Adder is
    Port(
        Adder_A,Adder_B     : IN std_logic_vector(15 downto 0);
        Adder_C             : OUT std_logic_vector(15 downto 0)
        );
end Adder;


architecture Behavioral of Adder is

begin
    Adder_C <= std_logic_vector(unsigned(Adder_A) + (unsigned(Adder_B)));
    

end Behavioral;
