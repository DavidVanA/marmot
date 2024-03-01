library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Test_Component is
  Port ( 
  Test_A			: IN std_logic_vector(15 downto 0);
  Test_Z			: OUT std_logic;
  Test_N			: OUT std_logic;
  );
end Test_Component;

architecture Behavioral of Test_Component is

begin

	Test_Z <= OR_reduce(Test_A);
	Test_N <= Test_N(15);

end Behavioral;
