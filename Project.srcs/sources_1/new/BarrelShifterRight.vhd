library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifterRight is
  Port ( 
  Sh_A    	        : IN std_logic_vector(15 downto 0);
  Sh_B              : IN std_logic_vector(3 downto 0);
  Sh_C            	: OUT std_logic_vector(15 downto 0)
  );
end BarrelShifterRight;

architecture Behavioral of BarrelShifterRight is

    signal  sh_8, sh_4, sh_2 : std_logic_vector(16 downto 0);

begin
    process(Sh_B, Sh_A)
    begin
        if (Sh_B(3)='1') then
            sh_8(7 downto 0) <= Sh_A(15 downto 8);
            sh_8(15 downto 8) <= "00000000";
        else
            sh_8(15 downto 0) <= Sh_A(15 downto 0);
        end if;
        
        if (Sh_B(2)='1') then
            sh_4(11 downto 0) <= sh_8(15 downto 4);
            sh_4(15 downto 12) <= "0000";
        else
            sh_4(15 downto 0) <= sh_8(15 downto 0);
        end if;
        
        if (Sh_B(1)='1') then
            sh_2(13 downto 0) <= sh_4(15 downto 2);
            sh_2(15 downto 14) <= "00";
        else
            sh_2(15 downto 0) <= sh_4(15 downto 0);
        end if;
        
        if (Sh_B(0)='1') then
            Sh_C(14 downto 0) <= sh_2(15 downto 1);
            Sh_C(15) <= '0';
        else
            Sh_C(15 downto 0) <= sh_2(15 downto 0);
        end if;
        
    end process;
    
end Behavioral;
