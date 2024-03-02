library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Marmot_Config.all;

entity The_Marmot_tb_V0 is
--  Port ( );
end The_Marmot_tb_V0;

architecture Behavioral of The_Marmot_tb_V0 is

    component The_Marmot
    port (
        in_port             : IN std_logic_vector(ext_instr_width-1 downto 0);
        M_clock             : IN std_logic;
        Reset_and_Execute   : IN std_logic;
        Reset_and_Load      : IN std_logic;
        out_port            : OUT std_logic_vector(ext_instr_width-1 downto 0)    
    );
    end component;
    
    -- Signals for interfacing with the component
    signal in_port             : std_logic_vector(ext_instr_width-1 downto 0) := (others => '0');
    signal M_clock             : std_logic := '0';
    signal Reset_and_Execute   : std_logic := '0';
    signal Reset_and_Load      : std_logic := '0';
    signal out_port            : std_logic_vector(ext_instr_width-1 downto 0);    
    
begin

    uut: The_Marmot
        port map(
            in_port           => in_port,
            M_clock           => M_clock,
            Reset_and_Execute => Reset_and_Execute,
            Reset_and_Load    => Reset_and_Load,
            out_port          => out_port
        );
    -- Clock generation process
    clock_process: process
    begin
        while true loop
            M_clock <= '0';
            wait for 10 ns;  -- Adjust the clock period according to your design's requirements
            M_clock <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        -- Initial reset
        Reset_and_Execute <= '1';
        Reset_and_Load <= '0';
        wait for 100 ns;  -- Wait for the reset to take effect
        Reset_and_Execute <= '0';

        -- Example input sequence
        in_port <= (others => '0');  -- Initial input
        wait for 100 ns;  -- Wait some time to observe the output

        -- Change inputs as needed to test different parts of your design
        in_port <= (others => '1');  -- Change input to another value
        wait for 200 ns;  -- Wait more time to observe changes in the output

        -- Apply first input
        in_port <= x"0001";
        wait for 100 ns; -- Wait for the system to process this input
        
        -- Apply second input
        in_port <= x"00FF";
        wait for 100 ns;

        -- Finish simulation
        wait;
    end process;
end Behavioral;
