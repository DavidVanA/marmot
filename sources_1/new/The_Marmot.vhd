library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Marmot_Config.all;


entity The_Marmot is

  port (
    in_port             : IN std_logic_vector(instr_range);
    M_clock             : IN std_logic;
    Reset_and_Execute   : IN std_logic;
    Reset_and_Load      : IN std_logic;
    out_port            : OUT std_logic_vector(instr_range) ;
    
    INS_port            : IN std_logic_vector(instr_range);
    wr_data             : IN std_logic_vector(reg_range);
    wr_index            : IN std_logic_vector(reg_idx_range);
    wr_enable           : IN std_logic
        
  );
end The_Marmot;

architecture Behavioral of The_Marmot is

    signal i_ALU_A, i_ALU_B, o_ALU_C: std_logic_vector(16 downto 0);
    signal i_ALU_Op     :   std_logic_vector(15 downto 0); -- Is there a reason we're feeding the ALU the entire instruction vbs. just op?
    
    signal rd_index1      :   std_logic_vector(REG_IDX_width-1 downto 0);
    signal RB_data        :   std_logic_vector(reg_range);
    signal RC_data        :   std_logic_vector(reg_range);

    signal i_CON_IF_ID    :   std_logic_vector(instr_range);
    signal i_CON_ID_EX    :   std_logic_vector(instr_range);
    signal i_CON_EX_MEM   :   std_logic_vector(instr_range);
    signal i_CON_MEM_WB   :   std_logic_vector(instr_range);
    
    -- Pipeline Latch Signals
    signal IF_ID_latch  : IF_ID_rec;
    signal ID_EX_latch  : ID_EX_rec;
    signal EX_MEM_latch : EX_MEM_rec;
    signal MEM_WB_latch : MEM_WB_rec;
    
    -- signal IF_ID_ins    :   std_logic_vector(15 downto 0);
    -- signal ID_EX_val    :   std_logic_vector(ID_EX_width-1 downto 0);
    -- signal ID_EX_ins    :   std_logic_vector(15 downto 0);
    -- signal EX_MEM_val   :   std_logic_vector(EX_MEM_width-1 downto 0);
    -- signal EX_MEM_ins   :   std_logic_vector(15 downto 0);
    -- signal MEM_WB_val   :   std_logic_vector(MEM_WB_width-1 downto 0);
    -- signal MEM_WB_ins   :   std_logic_vector(15 downto 0);
    
    signal o_ALU_Z      :   std_logic;
    signal FLAG_Z       :   std_logic;
    signal o_ALU_N      :   std_logic;
    signal FLAG_N       :   std_logic;
    
begin
-----------------------------------   IN Port   -------------------------------------------------   


-----------------------------------   Control   -------------------------------------------------
    Control: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then

        elsif rising_edge(M_clock) then
          -- Should this happen here or in the latches?
          i_CON_IF_ID  <= IF_ID_latch.instr;
          i_CON_ID_EX  <= ID_EX_latch.instr;
          i_CON_EX_MEM <= EX_MEM_latch.instr;
          i_CON_MEM_WB <= MEM_WB_latch.instr;
        end if;
    end process;

--     Control_instance: entity work.Control
--     port map(
--       IF_ID_PORT  => i_CON_IF_ID,
--       ID_EX_PORT  => i_CON_ID_EX,
--       EX_MEM_PORT => i_CON_EX_MEM,
--       MEM_WB_PORT => i_CON_MEM_WB,
-- --      ALU_Mode    => i_ALU_Op -- TODO: ALU_Mode needs resizing before this
-- --      can happen
--       --MEM_Op     =>;
--       --WB_Op      =>;
--       );

-----------------------------------   IF/ID     -------------------------------------------------    
    IF_ID: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then
            
            -- Possible alternative naming scheme using custom record type:
            IF_ID_latch.instr <= (others => '0');
            --IF_ID_ins <= (others => '0');
        elsif rising_edge(M_clock) then
            IF_ID_latch.instr <= INS_PORT;
            --IF_ID_ins <= INS_PORT;
         -- TODO: IF_IF_Control <= IF_ID.instr -- Feed the controller the
         -- current latch instruction.
        end if;
    end process IF_ID;
    
    -- ???? TODO: SHOULD BE PART OF CONTROLLER ?????
   with IF_ID_latch.instr(15 downto 9) select
   --with IF_ID_ins(15 downto 9) select
        rd_index1 <=
            -- IF_ID_ins(2 downto 0) when op_bshl,
            -- IF_ID_ins(2 downto 0) when op_bshr,
            -- IF_ID_ins(8 downto 6) when op_out,
            -- IF_ID_ins(8 downto 6) when op_test,
            -- IF_ID_ins(5 downto 3) when others;
            IF_ID_latch.instr(2 downto 0) when op_bshl,
            IF_ID_latch.instr(2 downto 0) when op_bshr,
            IF_ID_latch.instr(8 downto 6) when op_out,
            IF_ID_latch.instr(8 downto 6) when op_test,
            IF_ID_latch.instr(5 downto 3) when others;
 
    Registers_Latches_instance : entity work.register_file
    port map(
        rst         => Reset_and_Execute,
        clk         => M_clock,
        wr_index    => wr_index,
        wr_data     => wr_data,
        wr_enable   => wr_enable,
        rd_index1   => rd_index1,
        rd_index2   => IF_ID_latch.instr(2 downto 0), --??
--        rd_index2   => IF_ID_ins(2 downto 0), --rd gives data to bits 2..0 of
                                              --the I_ID instr??
        rd_data1    => RB_data,
        rd_data2    => RC_data
    );
    
-----------------------------------   ID/EX   -------------------------------------------------   
-- [16 - instruction][16 - NPC][17 - ra_data][17 - rb_data][17 - rc_data]
    ID_EX: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then
            ID_EX_latch.instr <= (others => '0');
--            ID_EX_val <= (others => '0'); -- Asynchronous reset
        elsif rising_edge(M_clock) then
            ID_EX_latch.instr <= IF_ID_latch.instr;
--            ID_EX_ins <= IF_ID_ins;

            -- TODO: ALU_Mode port needs resizing before this can go away
            i_ALU_Op <= IF_ID_latch.instr;

--            i_ALU_Op  <= IF_ID_ins;
            -- TODO: IF_IF_Control <= IF_ID.instr -- Feed the controller the
            -- current latch instruction.
            if IF_ID_latch.instr(op_range) = op_in then
--            if IF_ID_ins(15 downto 9) = op_in then
                i_ALU_A <= '0' & in_port;
            else
                i_ALU_A <= RB_data;
            end if;
                i_ALU_B <= RC_data;
        end if;
    end process ID_EX;
    
    ALU_instance: entity work.ALU
    port map( 
        ALU_Ins => i_ALU_Op, 
        ALU_A   => i_ALU_A, 
        ALU_B   => i_ALU_B, 
        ALU_C   => o_ALU_C, 
        ALU_N   => o_ALU_N, 
        ALU_Z   => o_ALU_Z 
    );    
    
-----------------------------------   EX/MEM   -------------------------------------------------   
    EX_MEM: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then
              EX_MEM_latch.instr <= (others => '0');
              EX_MEM_latch.result <= (others => '0');
--            EX_MEM_val <= (others => '0');
--            EX_MEM_ins <= (others => '0');
        elsif rising_edge(M_clock) then
              EX_MEM_latch.instr <= ID_EX_latch.instr;
              EX_MEM_latch.result <= o_ALU_C;
--            EX_MEM_ins <= ID_EX_ins;
--            EX_MEM_val <= o_ALU_C;
            -- TODO: Feed the controller the current latch instruction
            if ID_EX_latch.instr (op_range) = op_test then
--            if ID_EX_ins(15 downto 9) = op_test then
                FLAG_N <= o_ALU_N;
                FLAG_Z <= o_ALU_Z;
            end if;
        end if;
    end process EX_MEM;    
    
-----------------------------------   MEM/WB   -------------------------------------------------   
    MEM_WB: process(M_clock, Reset_and_Execute, Reset_and_Load)
    begin
        if Reset_and_Execute = '1' or Reset_and_Load = '1' then
            MEM_WB_latch.result <= (others => '0');
--            MEM_WB_val <= (others => '0');
        elsif rising_edge(M_clock) then
            MEM_WB_latch.instr <= EX_MEM_latch.instr;
            MEM_WB_latch.result <= EX_MEM_latch.result;
--            MEM_WB_ins <= EX_MEM_ins;
--            MEM_WB_val <= EX_MEM_val;
        end if;
    end process MEM_WB;   
    
-----------------------------------   OUT Port   -------------------------------------------------
    out_port <= MEM_WB_latch.result(instr_range) when MEM_WB_latch.instr(op_range) = op_out;  
--    out_port <= MEM_WB_val(15 downto 0) when MEM_WB_ins(15 downto 9) = "0100000";
    
end Behavioral;
