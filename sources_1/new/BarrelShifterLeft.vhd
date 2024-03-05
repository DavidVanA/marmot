library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifterLeft is
  Port ( 
  Sh_A    	        : IN std_logic_vector(15 downto 0);
  Sh_B              : IN std_logic_vector(3 downto 0);
  Sh_C            	: OUT std_logic_vector(15 downto 0)
  );
end BarrelShifterLeft;

architecture Behavioral of BarrelShifterLeft is

    signal  sh_8, sh_4, sh_2 : std_logic_vector(16 downto 0);

begin

    sh_8(15 downto 8) <= Sh_A(7 downto 0) when Sh_B(3)='1' else Sh_A(15 downto 8);
    sh_8(7 downto 0) <= "00000000" when Sh_B(3)='1' else Sh_A(7 downto 0);
            
    sh_4(15 downto 4) <= sh_8(11 downto 0) when Sh_B(2)='1' else sh_8(15 downto 4);
    sh_4(3 downto 0) <= "0000" when Sh_B(2)='1' else sh_8 (3 downto 0);

    sh_2(15 downto 2) <= sh_4(13 downto 0) when Sh_B(1)='1' else sh_4(15 downto 2);
    sh_2(1 downto 0) <= "00" when Sh_B(1)='1' else sh_4(1 downto 0);

    Sh_C(15 downto 1) <= sh_2(14 downto 0) when Sh_B(0)='1' else sh_2(15 downto 1);
    Sh_C(0) <= '0' when Sh_B(0)='1' else sh_2(0);
            
end Behavioral;
