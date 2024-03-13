library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Marmot_Config.all;


entity The_Marmot is

  port (
    in_port               : IN std_logic_vector(instr_width);
    M_clock               : IN std_logic;
    Reset_and_Execute     : IN std_logic;
    Reset_and_Load        : IN std_logic;
    out_port              : OUT std_logic_vector(instr_width);
    
    INS_port              : IN std_logic_vector(instr_width);
    wr_data               : IN std_logic_vector(reg_width);
    wr_index              : IN std_logic_vector(reg_idx_width);
    wr_enable             : IN std_logic
        
  );
end The_Marmot;

architecture Behavioral of The_Marmot is

    signal i_ALU_A, i_ALU_B, o_ALU_C : std_logic_vector(reg_width);
    signal i_ALU_Op                  : std_logic_vector(alu_mode_width); -- Is there a reason we're feeding the ALU the entire instruction vbs. just op?
    
    signal rd_index1      :   std_logic_vector(reg_idx_width); 
    signal RB_data        :   std_logic_vector(reg_width);
    signal RC_data        :   std_logic_vector(reg_width);

    signal i_CON_IF_ID    :   std_logic_vector(instr_width);
    signal i_CON_ID_EX    :   std_logic_vector(instr_width);
    signal i_CON_EX_MEM   :   std_logic_vector(instr_width);
    signal i_CON_MEM_WB   :   std_logic_vector(instr_width);
    
    -- Pipeline Latch Signals
    signal IF_ID_latch    :   IF_ID_rec;
    signal ID_EX_latch    :   ID_EX_rec;
    signal EX_MEM_latch   :   EX_MEM_rec;
    signal MEM_WB_latch   :   MEM_WB_rec;

    signal Reset_IF_ID    :  std_logic;
    signal Reset_ID_EX    :  std_logic;
    signal Reset_EX_MEM   :  std_logic;
    signal Reset_MEM_WB   :  std_logic;
    
    signal o_ALU_Z        :   std_logic;
    signal FLAG_Z         :   std_logic;
    signal o_ALU_N        :   std_logic;
    signal FLAG_N         :   std_logic;
    
begin
-----------------------------------   IN Port   -------------------------------------------------   


-----------------------------------   Control   -------------------------------------------------
  
     i_CON_IF_ID  <= IF_ID_latch.instr;
     i_CON_ID_EX  <= ID_EX_latch.instr;
     i_CON_EX_MEM <= EX_MEM_latch.instr;
     i_CON_MEM_WB <= MEM_WB_latch.instr;

     Controller_instance: entity work.Controller
     port map(
       Reset_Execute_Port => Reset_and_Execute,
       Reset_Load_Port    => Reset_and_Load,
       Reset_IF_ID        => Reset_IF_ID,
       Reset_ID_EX        => Reset_ID_EX,
       Reset_EX_MEM       => Reset_EX_MEM,
       Reset_MEM_WB       => Reset_MEM_WB,
       IF_ID_PORT         => i_CON_IF_ID,
       ID_EX_PORT         => i_CON_ID_EX,
       EX_MEM_PORT        => i_CON_EX_MEM,
       MEM_WB_PORT        => i_CON_MEM_WB,
       ALU_Mode           => i_ALU_Op 
 --      can happen
 --      MEM_Op     =>;
 --      WB_Op      =>;
       );
    
    
-----------------------------------   IF/ID     -------------------------------------------------    
    IF_ID: process(M_clock, Reset_IF_ID)
    begin
        if Reset_IF_ID = '1' then
            IF_ID_latch.instr <= (others => '0');
        elsif rising_edge(M_clock) then
            IF_ID_latch.instr <= INS_PORT;
         -- <TODO> IF_IF_Control <= IF_ID.instr -- Feed the controller the
         -- current latch instruction.
        end if;
    end process IF_ID;
    
    -- ???? <TODO> - Remove when we no longer needed
   with IF_ID_latch.instr(op_width) select
        rd_index1 <=
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
    ID_EX: process(M_clock, Reset_ID_EX)
    begin
        if Reset_ID_EX = '1' then
            ID_EX_latch.instr <= (others => '0');
        elsif rising_edge(M_clock) then
            ID_EX_latch.instr <= IF_ID_latch.instr;

            if IF_ID_latch.instr(op_width) = op_in then
                i_ALU_A <= '0' & in_port;
            else
                i_ALU_A <= RB_data;
            end if;
                i_ALU_B <= RC_data;
        end if;
    end process ID_EX;
    
    ALU_instance: entity work.ALU
    port map( 
        ALU_Mode => i_ALU_Op, 
        ALU_A    => i_ALU_A, 
        ALU_B    => i_ALU_B, 
        ALU_C    => o_ALU_C, 
        ALU_N    => o_ALU_N, 
        ALU_Z    => o_ALU_Z 
    );    
    
-----------------------------------   EX/MEM   -------------------------------------------------   
    EX_MEM: process(M_clock, Reset_EX_MEM)
    begin
        if Reset_EX_MEM = '1' then
              EX_MEM_latch.instr <= (others => '0');
              EX_MEM_latch.result <= (others => '0');
        elsif rising_edge(M_clock) then
              EX_MEM_latch.instr <= ID_EX_latch.instr;
              EX_MEM_latch.result <= o_ALU_C;
            if ID_EX_latch.instr (op_width) = op_test then
                FLAG_N <= o_ALU_N;
                FLAG_Z <= o_ALU_Z;
            end if;
        end if;
    end process EX_MEM;    
    
-----------------------------------   MEM/WB   -------------------------------------------------   
    MEM_WB: process(M_clock, Reset_MEM_WB)
    begin
        if Reset_MEM_WB = '1' then
            MEM_WB_latch.result <= (others => '0');
        elsif rising_edge(M_clock) then
            MEM_WB_latch.instr <= EX_MEM_latch.instr;
            MEM_WB_latch.result <= EX_MEM_latch.result;
        end if;
    end process MEM_WB;   
    
-----------------------------------   OUT Port   -------------------------------------------------
    out_port <= MEM_WB_latch.result(instr_width) when MEM_WB_latch.instr(op_width) = op_out;  
    
end Behavioral;
