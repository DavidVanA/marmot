LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use work.Marmot_Config.all;

ENTITY The_Marmot_tb IS
END The_Marmot_tb;

ARCHITECTURE behavior OF The_Marmot_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT The_Marmot
    PORT(
    in_port               : IN std_logic_vector(15 downto 6);
    M_clock               : IN std_logic;
    Reset_and_Execute     : IN std_logic;
    Reset_and_Load        : IN std_logic;
    out_port              : OUT std_logic;
    
    ------- Input Switch Ports ------------------------------
    sw      : IN std_logic_vector(9 downto 0);
    sw_sel  : IN std_logic;
    
    ------- Debug Console Ports -----------------------------

    debug_console   : in std_logic;
    board_clock     : in std_logic;

    vga_red         : out std_logic_vector( 3 downto 0 );
    vga_green       : out std_logic_vector( 3 downto 0 );
    vga_blue        : out std_logic_vector( 3 downto 0 );

    h_sync_signal   : out std_logic;
    v_sync_signal   : out std_logic;
    
    ------- LED Display Ports -------------------------------
    led_segments    : out STD_LOGIC_VECTOR( 6 downto 0 );
    led_digits      : out STD_LOGIC_VECTOR( 3 downto 0 )

    );
    END COMPONENT;
   
   --Inputs
   signal in_port           : std_logic_vector(15 downto 6) := (others => '0');
   signal M_clock           : std_logic := '0';
   signal Reset_and_Execute : std_logic := '0';
   signal Reset_and_Load    : std_logic := '0';
   
   --Outputs
   signal out_port      : std_logic;
   
   signal debug_console : std_logic;
   signal board_clock   : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
   uut: COMPONENT The_Marmot
        PORT MAP (
          in_port           => in_port,
          M_clock           => M_clock,
          Reset_and_Execute => Reset_and_Execute,
          Reset_and_Load    => Reset_and_Load,
          out_port          => out_port,
          debug_console     => debug_console,
          board_clock       => board_clock,

          sw            => (others=> '0'),
          sw_sel        =>  '0'

      
--          vga_red       => "0000",
--          vga_green     => "0000",
--          vga_blue      => "0000",
      
----          h_sync_signal => '0',
----          v_sync_signal => '0',
--          led_segments  => "0000000",
--          led_digits    => "0000"
        );

    -- Clock process definitions
    clk_process :process
    begin
        M_clock <= '0';
        wait for 10 ns;
        M_clock <= '1';
        wait for 10 ns;
    end process;

    -- Stimulus process
    stim_proc: process
    begin        
        -- Initialize Inputs
        in_port <= x"00" & "10";
        Reset_and_Execute <= '1';
        wait for 20 ns;
        
        -- Clear resets
        Reset_and_Execute <= '0';
        
        wait for 210ns;
        in_port <= x"AA" & "00";
        
        wait for 200ns;
        in_port <= x"55" & "00";
        
        wait for 470ns;
        in_port <= x"55" & "10";
        
        wait for 380ns;
        in_port <= x"00" & "00";

        wait for 2000 ns;
    end process;

END;
