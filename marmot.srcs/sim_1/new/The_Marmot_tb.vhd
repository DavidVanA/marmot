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
        Reset_and_Execute <= '1';
        Reset_and_Load <= '1';
        wait for 20 ns;
        
        -- Clear resets
        Reset_and_Execute <= '0';
        Reset_and_Load <= '0';

        -- IN to R1
        INS_port <= "0100001001000000" ;
        wait for 20ns;
        
        -- IN to R2
        INS_port <= "0100001010000000" ;
        wait for 20ns;
        
        -- IN to R3
        INS_port <= "0100001011000000";
        wait for 20ns;

        -- IN to R4
        INS_port <= "0100001100000000";
        
        -- R1 <- 2
        in_port <= "0000000000000010";
        wait for 20ns;
        
        INS_port <= "0000000000000000";
        
        -- R2 <- 4
        in_port <= "0000000000000100";
        wait for 20ns;
        
        -- R3 <- 0x00FF
        in_port <= "0000000011111111";
        wait for 20ns;
        
        -- R4 <- 0x0F0F
        in_port <= "0000111100001111";

        -- Clear the pipeline
        wait for 40ns;

        -- Add stimulus here 
        
        -- ADD R5 R2 R1
        INS_port <= op_add & "101" & "010" & "001";
        wait for 20 ns;          
        
        -- ADD R5 R2 R1
        INS_port <= op_add & "101" & "101" & "001";
        wait for 20 ns;
        
        -- BRR 
        INS_port <= op_brr & "011" & "010000";
        wait for 20ns;
        
        -- ADD R5 R5 R1
        INS_port <= op_add & "101" & "010" & "001";
        wait for 20 ns;

        INS_port <= op_add & "101" & "010" & "001";
        wait for 20ns;
        
        -- ADD R5 R2 R1
        INS_port <= op_add & "101" & "101" & "001";
        wait for 20 ns;
        
        INS_port <= op_br_sub & "011" & "010000";
        wait for 20ns;
        
        -- SUB R5 R5 R1
        INS_port <= op_sub & "101" & "010" & "001";
        wait for 20 ns;
        
        -- MUL R5 R2 R1
        INS_port <= op_mult & "101" & "101" & "001";
        wait for 20 ns;          
        
        -- NAND R5 R2 R1
        INS_port <= op_nand & "101" & "010" & "001";
        wait for 20 ns;        
        
        -- SHL R4 #1
        INS_port <= op_bshl & "100" & "00" & "0001";
        wait for 20 ns;
        
        INS_port <= (others => '0');
        wait for 60ns;
        
        -- SHR R4 #1
        INS_port <= op_bshr & "100" & "00" & "0001";
        wait for 20 ns;
        
        -- SHL R4 #1
        INS_port <= op_bshl & "100" & "00" & "0001";
        wait for 20 ns;
        
        -- SHR R4 #1
        INS_port <= op_bshr & "100" & "00" & "0001";
        wait for 20 ns;
        
        -- TEST R1
        INS_port <= "0000111001000000" ;
        wait for 20 ns;
        
        -- TEST R5
        INS_port <= "0000111101000000" ;
        wait for 20 ns;

        -- OUT R2
        INS_port <= "0100000010000000" ;
        wait for 20 ns;  
        
        ---------------------------------------------
        -- Test Branches
        -- Test BRR
        INS_port <= op_brr & '0' & x"FF";
        wait for 20 ns;
        
    end process;

END;
