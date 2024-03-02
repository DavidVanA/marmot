library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Marmot_Config.all;

entity Nand_Component is
  Port ( 
  Nand_A, Nand_B    : IN std_logic_vector(int_instr_width-1 downto 0);
  Nand_C            : OUT std_logic_vector(int_instr_width-1 downto 0)
  );
end Nand_Component;

architecture Behavioral of Nand_Component is

begin
    Nand_structure: for i in 15 downto 0 generate
        Nand_C(i) <= (Nand_A(i)) nand (Nand_B(i));
    end generate Nand_structure;
    Nand_C(16) <= '0';

end Behavioral;
