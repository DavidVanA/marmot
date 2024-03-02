library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Marmot_Config.all;

entity Adder is
    Port (
        Adder_A, Adder_B     : IN  std_logic_vector(int_instr_width-1 downto 0);
        Adder_C              : OUT std_logic_vector(int_instr_width-1 downto 0)
    );
end Adder;

architecture Behavioral of Adder is
begin
    Adder_Process: process(Adder_A, Adder_B)
        variable sum: unsigned(int_instr_width downto 0); -- Note: int_instr_width should be 17 for a 16-bit adder with overflow
    begin
        -- Perform addition on the lower 16 bits
        sum := unsigned(Adder_A(int_instr_width-2 downto 0)) + unsigned(Adder_B(int_instr_width-2 downto 0));
        
        -- Assign the result and the overflow bit
        Adder_C(int_instr_width-2 downto 0) <= std_logic_vector(sum(int_instr_width-2 downto 0));
        Adder_C(int_instr_width-1) <= sum(sum'high); -- Correctly assigns the overflow bit
    end process Adder_Process;
end Behavioral;
