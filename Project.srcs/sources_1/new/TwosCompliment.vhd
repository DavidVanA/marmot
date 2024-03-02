library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TwosComplement is
    Port ( 
        input           : in  std_logic_vector(15 downto 0);
        twos_complement : out  std_logic_vector(15 downto 0)
    );
end TwosComplement;

architecture Behavioral of TwosComplement is

signal temp : std_logic_vector(15 downto 0);

begin

  temp              <= not input;
  twos_complement   <= std_logic_vector(unsigned(temp + 1));
  
end Behavioral;