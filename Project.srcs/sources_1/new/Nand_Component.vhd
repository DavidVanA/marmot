library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nand_Component is
  Port ( 
  Nand_A, Nand_B    : IN std_logic_vector(15 downto 0);
  Nand_C            : OUT std_logic_vector(15 downto 0)
  );
end Nand_Component;

architecture Behavioral of Nand_Component is

begin
    Nand_structure: for i in 15 downto 0 generate
        Nand_C(i) <= (Nand_A(i)) nand (Nand_B(i));
    end generate Nand_structure;

end Behavioral;
