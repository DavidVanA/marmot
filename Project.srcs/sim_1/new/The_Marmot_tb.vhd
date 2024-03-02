LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY The_Marmot_tb IS
END The_Marmot_tb;

ARCHITECTURE behavior OF The_Marmot_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT The_Marmot
    PORT(
         in_port            : IN  std_logic_vector(15 downto 0);
         M_clock            : IN  std_logic;
         Reset_and_Execute  : IN  std_logic;
         Reset_and_Load     : IN  std_logic;
         out_port           : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   
    --Inputs
    signal in_port : std_logic_vector(15 downto 0) := (others => '0');
    signal M_clock : std_logic := '0';
    signal Reset_and_Execute : std_logic := '0';
    signal Reset_and_Load : std_logic := '0';

    --Outputs
    signal out_port : std_logic_vector(15 downto 0);

    -- Clock period definitions
    constant M_clock_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: The_Marmot PORT MAP (
          in_port => in_port,
          M_clock => M_clock,
          Reset_and_Execute => Reset_and_Execute,
          Reset_and_Load => Reset_and_Load,
          out_port => out_port
        );

    -- Clock process definitions
    M_clock_process :process
    begin
        M_clock <= '0';
        wait for M_clock_period/2;
        M_clock <= '1';
        wait for M_clock_period/2;
    end process;
    
    -- Testbench stimulus
    stimulus: process
    begin       
        -- Apply a reset
        Reset_and_Load <= '1';
        wait for 20 ns;
        Reset_and_Load <= '0';
        wait for 10 ns;

        -- Add
        in_port <= "0000" & "0001" & "0010" & "0011";
        wait for 80 ns;
        
        -- Nand
        in_port <= "0000" & "0010" & "0111" & "1110";
        wait for 80 ns;

        -- Multiply
        in_port <= "0000" & "0011" & "0010" & "0010";
        wait for 80 ns;        
        -- Finish simulation
        wait;
    end process;

END;
