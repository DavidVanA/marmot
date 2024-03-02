LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY The_Marmot_tb IS
END The_Marmot_tb;

ARCHITECTURE behavior OF The_Marmot_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT The_Marmot
    GENERIC(
        IF_ID_width    : integer := 17;
        ID_EX_width    : integer := 83;
        EX_MEM_width   : integer := 17;
        MEM_WB_width   : integer := 17
    );
    PORT(
        in_port             : IN  std_logic_vector(15 downto 0);
        M_clock             : IN  std_logic;
        Reset_and_Execute   : IN  std_logic;
        Reset_and_Load      : IN  std_logic;
        out_port            : OUT std_logic_vector(15 downto 0);
    
        INS_port            : IN std_logic_vector(15 downto 0);
        wr_data             : IN std_logic_vector(16 downto 0);
        wr_index            : IN std_logic_vector(2 downto 0);
        wr_enable           : IN std_logic;
        
        ALU_A_test          : OUT std_logic_vector(16 downto 0);
        ALU_B_test          : OUT std_logic_vector(16 downto 0);
        ALU_C_test          : OUT std_logic_vector(16 downto 0);
        EX_MEM_test         : OUT std_logic_vector(EX_MEM_width-1 downto 0);
        MEM_WB_test         : OUT std_logic_vector(MEM_WB_width-1 downto 0)
    );
    END COMPONENT;
   
   --Inputs
   signal in_port : std_logic_vector(15 downto 0) := (others => '0');
   signal M_clock : std_logic := '0';
   signal Reset_and_Execute : std_logic := '0';
   signal Reset_and_Load : std_logic := '0';
   
   signal INS_port : std_logic_vector(15 downto 0);
   signal wr_data : std_logic_vector(16 downto 0);
   signal wr_index : std_logic_vector(2 downto 0);
   signal wr_enable : std_logic;

   --Outputs
   signal out_port : std_logic_vector(15 downto 0);
   signal ALU_A_test : std_logic_vector(16 downto 0);
   signal ALU_B_test : std_logic_vector(16 downto 0);
   signal ALU_C_test : std_logic_vector(16 downto 0);
   signal EX_MEM_test : std_logic_vector(16 downto 0);
   signal MEM_WB_test : std_logic_vector(16 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
   uut: COMPONENT The_Marmot
        GENERIC MAP (
            IF_ID_width => 17,
            ID_EX_width => 83,
            EX_MEM_width => 17,
            MEM_WB_width => 17
        )
        PORT MAP (
          in_port => in_port,
          M_clock => M_clock,
          Reset_and_Execute => Reset_and_Execute,
          Reset_and_Load => Reset_and_Load,
          
          INS_port => INS_port,
          wr_data => wr_data,
          wr_index => wr_index,
          wr_enable => wr_enable,
          
          out_port => out_port,
          ALU_A_test => ALU_A_test,
          ALU_B_test => ALU_B_test,
          ALU_C_test => ALU_C_test,
          EX_MEM_test => EX_MEM_test,
          MEM_WB_test => MEM_WB_test
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
        wait for 100 ns;  

        wr_index <= "001";
        wr_data <= '0' & x"0001";
        wr_enable <= '1';
        wait for 40 ns;
        wr_enable <= '0';
        wr_index <= "010";
        wr_data <= '0' & x"0002";
        wr_enable <= '1';
        wait for 20 ns;
        wr_enable <= '0';


        -- Add stimulus here 
        INS_port <= "0000001011010001" ;
        wait for 100 ns;          
        INS_port <= "0000101011000010" ;
        wait for 100 ns;  

    end process;

END;
