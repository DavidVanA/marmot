----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2024 10:33:17 AM
-- Design Name: 
-- Module Name: The_Marmot - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity The_Marmot is

  generic(
--    ALU_Op_Default :   std_logic_vector     := "001";
    IF_ID_width    :   integer              := 17;   -- 16 bits for 1 word
    ID_EX_width    :   integer              := 83;   -- [16 - instruction][16 - NPC][17 - ra_data][17 - rb_data][17 - rc_data]
    EX_MEM_width   :   integer              := 17;   -- 16 bits for 1 word
    MEM_WB_width   :   integer              := 17;   -- 16 bits for 1 word
    --                                          1234123412341234
    Test_Val_1     :   std_logic_vector     := "00000000000000001";
    Test_val_2     :   std_logic_vector     := "00000000000000001"
    
    );

  port (
    in_port             : IN std_logic_vector(15 downto 0);
    M_clock             : IN std_logic;
    Reset_and_Execute   : IN std_logic;
    Reset_and_Load      : IN std_logic;
    out_port            : OUT std_logic_vector(15 downto 0) ;
    
    ALU_A_test          :OUT std_logic_vector(15 downto 0) ;
    ALU_B_test          :OUT std_logic_vector(15 downto 0) ;
    ALU_C_test          :OUT std_logic_vector(15 downto 0) ;
    EX_MEM_test         :OUT std_logic_vector(15 downto 0); 
    MEM_WB_test         :OUT std_logic_vector(15 downto 0) 
    
  );
end The_Marmot;

architecture Behavioral of The_Marmot is

    signal i_ALU_A, i_ALU_B, o_ALU_C: std_logic_vector(16 downto 0);
    signal i_ALU_Op     :   std_logic_vector(2 downto 0);
    
    signal IF_ID_val    :   std_logic_vector(IF_ID_width-1 downto 0);
    signal ID_EX_val    :   std_logic_vector(ID_EX_width-1 downto 0);
    signal EX_MEM_val   :   std_logic_vector(EX_MEM_width-1 downto 0);
    signal MEM_WB_val   :   std_logic_vector(MEM_WB_width-1 downto 0);
    
begin
-----------------------------------   IN Port   -------------------------------------------------   

-----------------------------------   IF/ID     -------------------------------------------------    
    IF_ID: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then
            IF_ID_val <= (others => '0'); -- Asynchronous reset
        elsif rising_edge(M_clock) then
            IF_ID_val(15 downto 0) <= in_port; -- Update register value on rising edge of clock
        end if;
    end process IF_ID;
    
--   Registers_Latches_instance: entity work.Register_Latches
--   port map();
    
-----------------------------------   ID/EX   -------------------------------------------------   
-- [16 - instruction][16 - NPC][17 - ra_data][17 - rb_data][17 - rc_data]
    ID_EX: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then
            ID_EX_val <= (others => '0'); -- Asynchronous reset
        elsif rising_edge(M_clock) then
            ID_EX_val(82 downto 67) <= IF_ID_val(15 downto 0); -- Update register value on rising edge of clock
        end if;
    end process ID_EX;    
    
    ALU_instance: entity work.ALU
    port map( ALU_Op => i_ALU_Op, ALU_A => i_ALU_A, ALU_B => i_ALU_B, ALU_C => o_ALU_C );    
    
    i_ALU_Op <= ID_EX_val(77 downto 75);
    i_ALU_A <= "0" & x"000" & ID_EX_val(74 downto 71);
    i_ALU_B <= "0" & x"000" & ID_EX_val(70 downto 67);

    
-----------------------------------   EX/MEM   -------------------------------------------------   
    EX_MEM: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then
            EX_MEM_val <= (others => '0'); -- Asynchronous reset
        elsif rising_edge(M_clock) then
            EX_MEM_val <= o_ALU_C; -- Update register value on rising edge of clock
        end if;
    end process EX_MEM;    
    EX_MEM_test <= EX_MEM_val;
-----------------------------------   MEM/WB   -------------------------------------------------   
    MEM_WB: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then
            MEM_WB_val <= (others => '0'); -- Asynchronous reset
        elsif rising_edge(M_clock) then
            MEM_WB_val <= EX_MEM_val; -- Update register value on rising edge of clock
        end if;
    end process MEM_WB;   
    MEM_WB_test <= MEM_WB_val;
-----------------------------------   OUT Port   -------------------------------------------------   
    out_port <= MEM_WB_val(15 downto 0);
    
end Behavioral;
