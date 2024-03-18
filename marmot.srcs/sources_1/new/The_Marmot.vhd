library IEEE;                           --
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Marmot_Config.all;

entity The_Marmot is

  port (
    in_port               : IN std_logic_vector(instr_width);
    M_clock               : IN std_logic;
    Reset_and_Execute     : IN std_logic;
    Reset_and_Load        : IN std_logic;
    out_port              : OUT std_logic_vector(instr_width);
    
    INS_port              : IN std_logic_vector(instr_width)
    );
end The_Marmot;

architecture Behavioral of The_Marmot is

    signal i_ALU_A, i_ALU_B, o_ALU_C : std_logic_vector(reg_width);
    signal i_ALU_Op                  : std_logic_vector(alu_mode_width); 
    
    signal rd_index1      :   std_logic_vector(reg_idx_width); 
    signal rd_index2      :   std_logic_vector(reg_idx_width); 
    signal r1_data        :   std_logic_vector(reg_width);
    signal r2_data        :   std_logic_vector(reg_width);
    
    signal br_addr        :   std_logic_vector(instr_width);

    signal i_CON_IF_ID    :   std_logic_vector(instr_width);
    signal i_CON_ID_EX    :   std_logic_vector(instr_width);
    signal i_CON_EX_MEM   :   std_logic_vector(instr_width);
    signal i_CON_MEM_WB   :   std_logic_vector(instr_width);
    
    -- Writeback enable from controller
    signal o_CON_Wb_En    :   std_logic;

    -- Data source select from controller (IN or ALU)
    signal o_CON_Data_Src :   std_logic;
    
    -- MUX for REG read index 1
    signal o_CON_Rd_Index1:   std_logic_vector(rd_index_width);

    -- MUX for ALU A and B
    signal o_CON_alu_src_1:   std_logic_vector(alu_src_width);    
    signal o_CON_alu_src_2:   std_logic_vector(alu_src_width);
    
    -- MUX for EX_MEM result
    signal o_CON_Ex_Mem_Res_Src: std_logic;
    
    -- MUX for MEM_WB write index
    signal o_CON_Mem_Wb_Index: std_logic_vector(reg_idx_width);
    
    -- Pipeline Latch Signals
    signal PC             :   PC_rec;
    signal IF_ID_latch    :   IF_ID_rec;
    signal ID_EX_latch    :   ID_EX_rec;
    signal EX_MEM_latch   :   EX_MEM_rec;
    signal MEM_WB_latch   :   MEM_WB_rec;

    signal Reset_PC       :  std_logic;
    signal Reset_IF_ID    :  std_logic;
    signal Reset_ID_EX    :  std_logic;
    signal Reset_EX_MEM   :  std_logic;
    signal Reset_MEM_WB   :  std_logic;
    
    signal o_ALU_Z        :  std_logic;
    signal FLAG_Z         :  std_logic;
    signal o_ALU_N        :  std_logic;
    signal FLAG_N         :  std_logic;

    signal PCSrc          : std_logic;
    signal Disp_Select    : std_logic_vector(instr_type_width);
    
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
       Reset_PC           => Reset_PC,
       Reset_IF_ID        => Reset_IF_ID,
       Reset_ID_EX        => Reset_ID_EX,
       Reset_EX_MEM       => Reset_EX_MEM,
       Reset_MEM_WB       => Reset_MEM_WB,
       IF_ID_PORT         => i_CON_IF_ID,
       ID_EX_PORT         => i_CON_ID_EX,
       EX_MEM_PORT        => i_CON_EX_MEM,
       MEM_WB_PORT        => i_CON_MEM_WB,
       ALU_Mode           => i_ALU_Op, 
       WB_EN              => o_CON_Wb_En,
       DATA_SRC           => o_CON_Data_Src,
       ALU_SRC_1          => o_CON_alu_src_1,
       ALU_SRC_2          => o_CON_alu_src_2,
       EX_MEM_RES_SRC     => o_CON_Ex_Mem_Res_Src,
       MEM_WB_INDEX       => o_CON_Mem_Wb_Index,
       RD_INDEX_1         => o_CON_Rd_Index1,
       ALU_N              => o_ALU_N,
       ALU_Z              => o_ALU_Z,
       Conn_PCSrc_Port    => PCSrc,
       Disp_Select_Port   => Disp_Select
       
       );

----------------------------------     PC       -------------------------------------------------

    PC_process: process(M_clock, Reset_PC)
    begin
        if Reset_PC = '1' then
            PC.instr <= (others => '0');
        elsif falling_edge(M_clock) then
            -- Instr_mem.in <= PC.instro
            if PCSrc = '0' then
                PC.instr <= PC.npc;
            else
                PC.instr <= PC.br;
            end if;
        end if;
    end process PC_process;

    PC.npc <= std_logic_vector(unsigned(PC.instr) + 2);
    IF_ID_latch.npc <= PC.npc;
     
-----------------------------------   IF/ID     -------------------------------------------------    
    IF_ID: process(M_clock, Reset_IF_ID)
    begin
        if Reset_IF_ID = '1' then
            IF_ID_latch.instr <= (others => '0');
        elsif rising_edge(M_clock) then
            IF_ID_latch.instr <= INS_PORT;
        end if;
    end process IF_ID;

    -- Select register read index
    rd_index1 <= o_CON_Rd_Index1;
    rd_index2 <= IF_ID_latch.instr(rc_width);


    Branch_Calculator_instance: entity work.Branch_Calculator
        port map (
            Instr_Port => IF_ID_latch.instr,
            NPC => ID_Ex_latch.npc,
            Ra  => r1_data(instr_width),
            Disp_Selector => Disp_Select,
            Br_Addr_Port => br_addr
        );
 
    Registers_Latches_instance : entity work.register_file
    port map(
        rst         => Reset_and_Execute,
        clk         => M_clock,
        wr_index    => o_CON_Mem_Wb_Index,
        wr_data     => MEM_WB_latch.result,
        wr_enable   => o_CON_Wb_En,
        rd_index1   => rd_index1,
        rd_index2   => rd_index2,
        rd_data1    => r1_data,
        rd_data2    => r2_data
    );
    
-----------------------------------   ID/EX   -------------------------------------------------   
-- [16 - instruction][16 - NPC][17 - ra_data][17 - rb_data][17 - rc_data]
    ID_EX: process(M_clock, Reset_ID_EX)
    begin
        if Reset_ID_EX = '1' then
            ID_EX_latch.instr <= (others => '0');
        elsif rising_edge(M_clock) then
            ID_EX_latch.instr <= IF_ID_latch.instr;
            ID_EX_latch.ra_data <= r1_data;
            ID_EX_latch.rb_data <= r2_data;
            ID_EX_latch.npc <= IF_ID_latch.npc;
            ID_EX_latch.br_addr <= br_addr;
        end if;
    end process ID_EX;
    
    PC.br <= ID_EX_latch.br_addr;
    
    with o_CON_alu_src_1 select
      i_ALU_A <= 
        ID_EX_latch.ra_data when alu_src_rd,
        EX_MEM_latch.result when alu_src_fd1,
        MEM_WB_latch.result when alu_src_fd2,
        (others => '0') when others;
        
    with o_CON_alu_src_2 select
      i_ALU_B <= 
        ID_EX_latch.rb_data when alu_src_rd,
        EX_MEM_latch.result when alu_src_fd1,
        MEM_WB_latch.result when alu_src_fd2,
        '0' & x"000" & ID_EX_latch.instr(cl_width) when alu_src_cl,
        (others => '0') when others;

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
            
            if o_CON_Ex_Mem_Res_Src = '0' then
              EX_MEM_latch.result <= o_ALU_C;
            else
              EX_MEM_latch.result <= '0' & ID_EX_latch.npc;
            end if;
            
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
            MEM_WB_latch.instr <= (others => '0');
        elsif rising_edge(M_clock) then
            MEM_WB_latch.instr <= EX_MEM_latch.instr;
            if o_CON_Data_Src = '0' then
                MEM_WB_latch.result <= EX_MEM_latch.result;
            else
                Mem_WB_latch.result <= '0' & in_port;
            end if;
        end if;
    end process MEM_WB;   
    
-----------------------------------   OUT Port   -------------------------------------------------
    out_port <= MEM_WB_latch.result(instr_width) when MEM_WB_latch.instr(op_width) = op_out;  
    
end Behavioral;
