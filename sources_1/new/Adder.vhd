library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Marmot_Config.all;


entity Adder is
    Port(
        Adder_A,Adder_B     : IN std_logic_vector(instr_width);
        Adder_C             : OUT std_logic_vector(reg_width)
    );
end Adder;


architecture Behavioral of Adder is
    
     signal Sum     : std_logic_vector(instr_width);
     signal CarryIn : std_logic := '0';
     signal CarryOut: std_logic;
        
 begin
     
    Adder_instance : entity work.Adder4bits
    port map(
        A    => Adder_A,
        B    => Adder_B,
        S    => Sum,
        Cin  => CarryIn,
        Cout => CarryOut        
    );
    
    Adder_C <= CarryOut & Sum;
           
end Behavioral;