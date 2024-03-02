LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY The_Marmot_tb IS
END The_Marmot_tb;

ARCHITECTURE behavior OF The_Marmot_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT The_Marmot
    GENERIC(
--        IF_ID_width    : integer := 17;
--        ID_EX_width    : integer := 83;
--        EX_MEM_width   : integer := 17;
--        MEM_WB_width   : integer := 17;
--        Test_Val_1     : std_logic_vector := "00000000000000001";
--        Test_val_2     : std_logic_vector := "00000000000000001"
--    );
    PORT(
        in_port             : IN  std_logic_vector(15 downto 0);
        M_clock             : IN  std_logic;
        Reset_and_Execute   : IN  std_logic;
        Reset_and_Load      : IN  std_logic;
        out_port            : OUT std_logic_vector(15 downto 0)
    );
    END COMPONENT;
   
   --Inputs
   signal in_port : std_logic_vector(15 downto 0) := (others => '0');
   signal M_clock : std_logic := '0';
   signal Reset_and_Execute : std_logic := '0';
   signal Reset_and_Load : std_logic := '0';

   --Outputs
   signal out_port : std_logic_vector(15 downto 0);
   signal ALU_A_test : std_logic_vector(15 downto 0);
   signal ALU_B_test : std_logic_vector(15 downto 0);
   signal ALU_C_test : std_logic_vector(15 downto 0);
   signal EX_MEM_test : std_logic_vector(15 downto 0);
   signal MEM_WB_test : std_logic_vector(15 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
   uut: COMPONENT The_Marmot
        GENERIC MAP (
            IF_ID_width => 17,
            ID_EX_width => 83,
            EX_MEM_width => 17,
            MEM_WB_width => 17,
            Test_Val_1 => "00000000000000001",
            Test_val_2 => "00000000000000001"
        )
        PORT MAP (
          in_port => in_port,
          M_clock => M_clock,
          Reset_and_Execute => Reset_and_Execute,
          Reset_and_Load => Reset_and_Load,
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

        -- Add stimulus here 

    end process;

END;
