library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Marmot_Config.all;

entity TwosComplement is
    Port ( 
        input           : in  std_logic_vector(instr_width);
        twos_complement : out  std_logic_vector(instr_width)
    );
end TwosComplement;

architecture Behavioral of TwosComplement is

signal temp : std_logic_vector(instr_width);

begin

  temp              <= not input;
  twos_complement   <= std_logic_vector(unsigned(temp) + 1);
  
end Behavioral;
