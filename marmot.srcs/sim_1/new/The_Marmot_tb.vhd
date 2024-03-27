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
        in_port             : IN  std_logic_vector(15 downto 6);
        M_clock             : IN  std_logic;
        Reset_and_Execute   : IN  std_logic;
        Reset_and_Load      : IN  std_logic;
        out_port            : OUT std_logic;
        
        ------- Debug Console Ports -----------------------------
        debug_console   : in std_logic;
        board_clock     : in std_logic;
    
        vga_red         : out std_logic_vector( 3 downto 0 );
        vga_green       : out std_logic_vector( 3 downto 0 );
        vga_blue        : out std_logic_vector( 3 downto 0 );
    
        h_sync_signal   : out std_logic;
        v_sync_signal   : out std_logic
    );
    END COMPONENT;
   
   --Inputs
   signal d_in_port               : std_logic_vector(15 downto 0) := (others => '0');
   signal d_M_clock               : std_logic                     := '0';
   signal d_Reset_and_Execute     : std_logic                     := '0';
   signal d_Reset_and_Load        : std_logic                     := '0';
   
   --Outputs
   signal d_out_port              : std_logic;
   
   signal d_debug_console         : std_logic;
   signal d_board_clock           : std_logic;
   
   signal d_vga_red               : std_logic_vector( 3 downto 0 );
   signal d_vga_green             : std_logic_vector( 3 downto 0 );
   signal d_vga_blue              : std_logic_vector( 3 downto 0 );

   signal d_h_sync_signal         : std_logic;
   signal d_v_sync_signal         : std_logic

BEGIN

    -- Instantiate the Unit Under Test (UUT)
   uut: COMPONENT The_Marmot
        PORT MAP (
          in_port           => d_in_port,
          M_clock           => d_M_clock,
          Reset_and_Execute => d_Reset_and_Execute,
          Reset_and_Load    => d_Reset_and_Load,
          out_port          => d_out_port,
          debug_console     => d_debug_console,
          board_clock       => d_board_clock,
      
          vga_red           => d_vga_red, 
          vga_green         => d_vga_green,
          vga_blue          => d_vga_blue,
      
          h_sync_signal     => d_h_sync_signal,
          v_sync_signal     => d_v_sync_signal
          
          
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
        in_port <= x"0080";
        Reset_and_Load <= '1';
        wait for 20 ns;
        
        -- Clear resets
        Reset_and_Load <= '0';
        
        wait for 210ns;
        in_port <= x"AA00";

        wait for 600 ns;
    end process;

END;
