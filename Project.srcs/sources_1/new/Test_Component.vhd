library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Test_Component is
  Port ( 
  Test_A			: IN std_logic_vector(16 downto 0);
  Test_Z			: OUT std_logic;
  Test_N			: OUT std_logic
  );
end Test_Component;

architecture Behavioral of Test_Component is

begin

    Test_Z <= not(Test_A(0) or Test_A(1) or Test_A(2) or Test_A(3)
                  or Test_A(4) or Test_A(5) or Test_A(6) or Test_A(7)
                  or Test_A(8) or Test_A(9) or Test_A(10) or Test_A(11)
                  or Test_A(12) or Test_A(13) or Test_A(14) or Test_A(15));
                  
    Test_N <= Test_A(15);

end Behavioral;
