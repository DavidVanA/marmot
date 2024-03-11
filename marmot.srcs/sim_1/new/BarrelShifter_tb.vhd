LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY BarrelShifter_tb IS
END BarrelShifter_tb;

ARCHITECTURE behavior OF BarrelShifter_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT BarrelShifterLeft
    PORT(
            Sh_A    	        : IN std_logic_vector(15 downto 0);
            Sh_B                : IN std_logic_vector(3 downto 0);
            Sh_C            	: OUT std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   
    --Inputs
    signal Sh_A : std_logic_vector(15 downto 0);
    signal Sh_B : std_logic_vector(3 downto 0);

    --Outputs
    signal Sh_C : std_logic_vector(15 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: BarrelShifterLeft PORT MAP (
            Sh_A => Sh_A,
            Sh_B => Sh_B,
            Sh_C => Sh_C
        );
    
    -- Testbench stimulus
    stimulus: process
    begin       
        -- Apply input
        Sh_A <= "0000000000001111";
        wait for 30 ns;
                    
        -- Apply another input
        Sh_B <= "0000";
        wait for 30 ns;
        
        -- Apply another input
        Sh_B <= "0001";
        wait for 30 ns;    
        
        -- Apply another input
        Sh_B <= "0010";
        wait for 30 ns;
        
        -- Apply another input
        Sh_B <= "0011";
        wait for 30 ns;
        
        Sh_B <= "0100";
        
        wait for 30 ns;
        Sh_B <= "0101";
        
        wait for 30 ns;
        Sh_B <= "0110";
        
        wait for 30 ns;
        Sh_B <= "0111";
        
        wait for 30 ns;
        Sh_B <= "1000";
        
        wait for 30 ns;
        Sh_B <= "1001";
        
        wait for 30 ns;
        Sh_B <= "1010";
        
        wait for 30 ns;
        Sh_B <= "1011";
        
        wait for 30 ns;
        Sh_B <= "1100";
        
        wait for 30 ns;
        Sh_B <= "1101";
        
        wait for 30 ns;        
        Sh_B <= "1110";
        
        wait for 30 ns;        
        Sh_B <= "1111";
        
        wait for 30 ns;

        wait;
    end process;

END;
