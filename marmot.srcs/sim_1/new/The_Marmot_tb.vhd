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
        in_port             : IN  std_logic_vector(15 downto 0);
        M_clock             : IN  std_logic;
        Reset_and_Execute   : IN  std_logic;
        Reset_and_Load      : IN  std_logic;
        out_port            : OUT std_logic_vector(15 downto 0);
    
        INS_port            : IN std_logic_vector(15 downto 0)
    );
    END COMPONENT;
   
   --Inputs
   signal in_port : std_logic_vector(15 downto 0) := (others => '0');
   signal M_clock : std_logic := '0';
   signal Reset_and_Execute : std_logic := '0';
   signal Reset_and_Load : std_logic := '0';
   
   signal INS_port : std_logic_vector(15 downto 0);

   --Outputs
   signal out_port : std_logic_vector(15 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
   uut: COMPONENT The_Marmot
        PORT MAP (
          in_port => in_port,
          M_clock => M_clock,
          Reset_and_Execute => Reset_and_Execute,
          Reset_and_Load => Reset_and_Load,
          
          INS_port => INS_port,
          
          out_port => out_port
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
        in_port <= (others => '0');
        Reset_and_Execute <= '0';
        Reset_and_Load <= '0';
        wait for 20 ns;  

        INS_port <= "0100001001000000" ;
        wait for 20ns;
        
        INS_port <= "0100001010000000" ;
        wait for 20ns;
        
        INS_PORT <= "0000000000000000";
        in_port <= "0000000000000001";
        wait for 40ns;
        in_port <= "0000000000000010";
        wait for 20ns;
        in_port <= "0000000000000011";
        
        wait for 60ns;

        -- Add stimulus here 
        
        -- ADD R3 R2 R1
        INS_port <= "0000001011010001" ;
        wait for 20 ns;          
        
        -- SUB R3 R2 R1
        INS_port <= "0000010011010001" ;
        wait for 20 ns;

        -- MUL R3 R2 R1
        INS_port <= "0000011011010001" ;
        wait for 20 ns;          
        
        -- NAND R3 R2 R1
        INS_port <= "0000100011010001" ;
        wait for 20 ns;        
        
        -- SHL R1 #2
        INS_port <= "0000101001000001" ;
        wait for 20 ns;  
        
        -- SHR R1 #1
        INS_port <= "0000110001000001" ;
        wait for 20 ns;
        
        -- TEST R3 with value 0x0002
        INS_port <= "0000111001000000" ;
        wait for 20 ns;
        
        -- TEST R3 with value 0x0002
        INS_port <= "0000000000000000" ;
        wait for 20 ns;
        
        -- TEST R1 with value 0x8002
        INS_port <= "0000111001000000" ;
        wait for 20 ns;

        -- OUT R3
        INS_port <= "0100000010000000" ;
        wait for 20 ns;  
        
        -- IN R3
        INS_port <= "0100001011000000" ;
        wait for 20 ns;  
        
    end process;

END;
