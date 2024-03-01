library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifterLeft is
  Port ( 
  Sh_A, Sh_B    	: IN std_logic_vector(15 downto 0);
  Sh_C            	: OUT std_logic_vector(15 downto 0)
  );
end BarrelShifterLeft;

architecture Behavioral of BarrelShifterLeft is

begin
	

    Nand_structure: for i in 15 downto 0 generate
        Nand_C(i) <= (Nand_A(i)) nand (Nand_B(i));
    end generate Nand_structure;

end Behavioral;
