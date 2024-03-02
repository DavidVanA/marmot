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
    REG_width       :   integer             := 17;
    ID_EX_width     :   integer             := 83;   -- [16 - instruction][16 - NPC][17 - ra_data][17 - rb_data][17 - rc_data]
    EX_MEM_width    :   integer             := 17;   -- 16 bits for 1 word
    MEM_WB_width    :   integer             := 17;   -- 16 bits for 1 word
    
    op_nop      : std_logic_vector := "0000000";
    op_add      : std_logic_vector := "0000001";
    op_sub      : std_logic_vector := "0000010";
    op_mult     : std_logic_vector := "0000011";
    op_nand     : std_logic_vector := "0000100";
    op_bshl     : std_logic_vector := "0000101";
    op_bshr     : std_logic_vector := "0000110";
    op_test     : std_logic_vector := "0000111";
    op_out      : std_logic_vector := "0100000";
    op_in       : std_logic_vector := "0100001"

    );

  port (
    in_port             : IN std_logic_vector(15 downto 0);
    M_clock             : IN std_logic;
    Reset_and_Execute   : IN std_logic;
    Reset_and_Load      : IN std_logic;
    out_port            : OUT std_logic_vector(15 downto 0) ;
    
    INS_port            : IN std_logic_vector(15 downto 0);
    wr_data             : IN std_logic_vector(REG_width-1 downto 0);
    wr_index            : IN std_logic_vector(2 downto 0);
    wr_enable           : IN std_logic
        
  );
end The_Marmot;

architecture Behavioral of The_Marmot is

    signal i_ALU_A, i_ALU_B, o_ALU_C: std_logic_vector(16 downto 0);
    signal i_ALU_Op     :   std_logic_vector(15 downto 0);
    
    signal rd_index1    :   std_logic_vector(2 downto 0);
    signal RB_data      :   std_logic_vector(REG_width-1 downto 0);
    signal RC_data      :   std_logic_vector(REG_width-1 downto 0);
    
    signal IF_ID_ins    :   std_logic_vector(15 downto 0);
    signal ID_EX_val    :   std_logic_vector(ID_EX_width-1 downto 0);
    signal ID_EX_ins    :   std_logic_vector(15 downto 0);
    signal EX_MEM_val   :   std_logic_vector(EX_MEM_width-1 downto 0);
    signal EX_MEM_ins   :   std_logic_vector(15 downto 0);
    signal MEM_WB_val   :   std_logic_vector(MEM_WB_width-1 downto 0);
    signal MEM_WB_ins   :   std_logic_vector(15 downto 0);
    
begin
-----------------------------------   IN Port   -------------------------------------------------   

-----------------------------------   IF/ID     -------------------------------------------------    
    IF_ID: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then
            IF_ID_ins <= (others => '0'); -- Asynchronous reset
        elsif rising_edge(M_clock) then
            IF_ID_ins <= INS_PORT;
        end if;
    end process IF_ID;
    
    -- ???? TODO: SHOULD BE PART OF CONTROLLER ?????
    with IF_ID_ins(15 downto 9) select
        rd_index1 <=
            IF_ID_ins(2 downto 0) when op_bshl,
            IF_ID_ins(2 downto 0) when op_bshr,
            IF_ID_ins(5 downto 3) when others;

        
    Registers_Latches_instance : entity work.register_file
    port map(
        rst => Reset_and_Execute,
        clk => M_clock,
        wr_index => wr_index,
        wr_data => wr_data,
        wr_enable => wr_enable,
        rd_index1 => rd_index1,
        rd_index2 => IF_ID_ins(2 downto 0),
        rd_data1 => RB_data,
        rd_data2 => RC_data
    );
    
-----------------------------------   ID/EX   -------------------------------------------------   
-- [16 - instruction][16 - NPC][17 - ra_data][17 - rb_data][17 - rc_data]
    ID_EX: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then
            ID_EX_val <= (others => '0'); -- Asynchronous reset
        elsif rising_edge(M_clock) then
            ID_EX_ins <= IF_ID_ins;
            i_ALU_Op <= IF_ID_ins;
            i_ALU_A <= RB_data;
            i_ALU_B <= RC_data;
        end if;
    end process ID_EX;
    
    ALU_instance: entity work.ALU
    port map( ALU_Ins => i_ALU_Op, ALU_A => i_ALU_A, ALU_B => i_ALU_B, ALU_C => o_ALU_C );    
-----------------------------------   EX/MEM   -------------------------------------------------   
    EX_MEM: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then
            EX_MEM_val <= (others => '0'); -- Asynchronous reset
        elsif rising_edge(M_clock) then
            EX_MEM_ins <= ID_EX_ins;
            EX_MEM_val <= o_ALU_C; -- Update register value on rising edge of clock
        end if;
    end process EX_MEM;    
-----------------------------------   MEM/WB   -------------------------------------------------   
    MEM_WB: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then
            MEM_WB_val <= (others => '0'); -- Asynchronous reset
        elsif rising_edge(M_clock) then
            MEM_WB_ins <= EX_MEM_ins;
            MEM_WB_val <= EX_MEM_val; -- Update register value on rising edge of clock
        end if;
    end process MEM_WB;   
-----------------------------------   OUT Port   -------------------------------------------------
    out_port <= MEM_WB_val(15 downto 0) when MEM_WB_ins(15 downto 9) = "0100000" else (others => '0');
    
end Behavioral;
