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
    out_port              : OUT std_logic_vector(instr_width)
    );
end The_Marmot;

architecture Behavioral of The_Marmot is

    signal i_ALU_A, i_ALU_B, o_ALU_C : std_logic_vector(reg_width);
    
    signal rd_index1      :   std_logic_vector(reg_idx_width); 
    signal rd_index2      :   std_logic_vector(reg_idx_width); 
    signal r1_data        :   std_logic_vector(reg_width);
    signal r2_data        :   std_logic_vector(reg_width);

    signal MEM_read_data  :   std_logic_vector(instr_width);
    signal MEM_data_addr  :   std_logic_vector(instr_width);
    signal MEM_data_data  :   std_logic_vector(instr_width);
    signal MEM_instr      :   std_logic_vector(instr_width);
    
    signal br_addr        :   std_logic_vector(instr_width);

    signal i_CON_IF_ID    :   std_logic_vector(instr_width);
    signal i_CON_ID_EX    :   std_logic_vector(instr_width);
    signal i_CON_EX_MEM   :   std_logic_vector(instr_width);
    signal i_CON_MEM_WB   :   std_logic_vector(instr_width);
    
    -- Writeback enable from controller
    signal o_CON_Wb_En    :   std_logic;
    
    -- MUX for REG read index 1
    signal o_CON_Rd_Index1:   std_logic_vector(rd_index_width);
    -- MUX for REG read index 2
    signal o_CON_Rd_Index2:   std_logic_vector(rd_index_width);

    -- MUX for ALU A and B
    signal o_CON_alu_src_1:   std_logic_vector(alu_src_width);    
    signal o_CON_alu_src_2:   std_logic_vector(alu_src_width);
    
    -- MUX for MEM_WB write index
    signal o_CON_Mem_Wb_Index: std_logic_vector(reg_idx_width);

    -- MUX for memory data address
    signal o_CON_Data_Addr_Src: std_logic;

    -- MUX for memory write data 
    signal o_CON_Data_Data_Src: std_logic;

    -- Signal for selecting write or read
    signal o_CON_Mem_Wr_nRd: std_logic_vector(byte_addressable);

    -- MUX for writeback source
    signal o_CON_Wb_Src:     std_logic_vector(wb_src_width);
    
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
    signal o_ALU_Ov       :  std_logic;
    signal FLAG_Ov        :  std_logic;

    signal wb_data         : std_logic_vector(reg_width);
    signal PCSrc           : std_logic;
    signal Disp_Select     : std_logic_vector(instr_type_width);
    signal Branch_Relative : std_logic;
    signal Branch_Base     : std_logic_vector(instr_width);

    
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
       WB_EN              => o_CON_Wb_En,
       MEM_DATA_ADDR_SRC  => o_CON_Data_Addr_Src,
       MEM_DATA_DATA_SRC  => o_CON_Data_Data_Src,
       ALU_SRC_1          => o_CON_alu_src_1,
       ALU_SRC_2          => o_CON_alu_src_2,
       MEM_WR_nRD         => o_CON_Mem_Wr_nRd,
       WB_SRC             => o_CON_Wb_Src,
       MEM_WB_INDEX       => o_CON_Mem_Wb_Index,
       RD_INDEX_1         => o_CON_Rd_Index1,
       RD_INDEX_2         => o_CON_Rd_Index2,
       ALU_N              => o_ALU_N,
       ALU_Z              => o_ALU_Z,
       ALU_Ov             => o_ALU_Ov,
       Conn_PCSrc_Port    => PCSrc,
       Disp_Select_Port   => Disp_Select,
       Branch_Relative    => Branch_Relative
       );

----------------------------------     PC       -------------------------------------------------

    PC_process: process(M_clock, Reset_PC)
    begin
        if Reset_PC = '1' then
            PC.pc <= (others => '0');
        elsif rising_edge(M_clock) then
            -- Instr_mem.in <= PC.pc
            if PCSrc = '0' then
                PC.pc <= PC.npc;
            else
                PC.pc <= PC.br;
            end if;
        end if;
    end process PC_process;

    PC.npc <= std_logic_vector(unsigned(PC.pc) + 2);
     
-----------------------------------   IF/ID     -------------------------------------------------    
    IF_ID: process(M_clock, Reset_IF_ID)
    begin
        if Reset_IF_ID = '1' then
            IF_ID_latch.instr <= (others => '0');
            IF_ID_latch.pc <= (others => '0');
            IF_ID_latch.npc <= (others => '0');
        elsif rising_edge(M_clock) then
            IF_ID_latch.pc <= PC.pc;
            IF_ID_latch.npc <= PC.npc;
            IF_ID_latch.instr <= MEM_instr;
        end if;
    end process IF_ID;

     ------------ Branching -----------------

     with Branch_Relative select
          Branch_Base <=
                        r1_data(instr_width) when '1',
                        IF_ID_latch.pc       when others;
     
    Branch_Calculator_instance: entity work.Branch_Calculator
        port map (
            Instr_Port => IF_ID_latch.instr,
            Branch_Base => Branch_Base,
            Ra  => r1_data(instr_width),
            Disp_Selector => Disp_Select,
            Br_Addr_Port => br_addr
        );

     --------------------------------------

         -- Select register read index
    rd_index1 <= o_CON_Rd_Index1;
    rd_index2 <= o_CON_Rd_Index2;
     
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

     ---
     
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
        ALU_Ins  => ID_EX_latch.instr,
        ALU_A    => i_ALU_A, 
        ALU_B    => i_ALU_B, 
        ALU_C    => o_ALU_C, 
        ALU_N    => o_ALU_N, 
        ALU_Z    => o_ALU_Z, 
        ALU_Ov   => o_ALU_Ov
        );    
    
-----------------------------------   EX/MEM   -------------------------------------------------   
    EX_MEM: process(M_clock, Reset_EX_MEM)
    begin
        if Reset_EX_MEM = '1' then
              EX_MEM_latch.instr <= (others => '0');
              EX_MEM_latch.result <= (others => '0');
        elsif rising_edge(M_clock) then
            EX_MEM_latch.result <= o_ALU_C;
            EX_MEM_latch.instr <= ID_EX_latch.instr;
            EX_MEM_latch.ra_data <= ID_EX_latch.ra_data;
            EX_MEM_latch.rb_data <= ID_EX_latch.ra_data;
            EX_MEM_latch.npc <= ID_EX_latch.npc;
            
            if ID_EX_latch.instr (op_width) = op_test then
                FLAG_N  <= o_ALU_N;
                FLAG_Z  <= o_ALU_Z;
                FLAG_Ov <= o_ALU_Ov;
            end if;
            
        end if;
    end process EX_MEM;    

    with o_CON_Data_Addr_Src select
        MEM_data_addr <=
            EX_MEM_latch.ra_data(15 downto 0) when mem_src_ra,
            EX_MEM_latch.rb_data(15 downto 0) when mem_src_rb,
			MEM_WB_latch.result(15 downto 0) when mem_src_f1
			(others => '0') when others;

    with o_CON_Data_Data_Src select
        MEM_data_data <=
            EX_MEM_latch.rb_data(15 downto 0) when mem_src_rb,
			MEM_WB_latch.result(15 downto 0) when mem_src_f1
			(others => '0') when others;
        
     Memory_instance : entity work.Memory
        port map(                               
            Reset => Reset_EX_MEM,
            Clk => M_Clock,
            Instr_Addr => PC.pc,
            Instr => MEM_instr,
            Data_Addr => MEM_data_addr,
            Read_Data => MEM_read_data,
            Write_Data => EX_MEM_latch.rb_data(instr_width),
            Write_Not_Read => o_CON_Mem_Wr_nRd
        );

    with o_CON_Wb_Src select
        wb_data <=
           EX_MEM_latch.result       when wb_src_alu,
           '0' & MEM_read_data       when wb_src_mem,
           '0' & EX_MEM_latch.npc    when wb_src_npc,
           EX_MEM_latch.rb_data      when wb_src_rb,
           '0' & in_port             when wb_src_in,
           (others => '0')           when others;
           
           
-----------------------------------   MEM/WB   -------------------------------------------------   
    MEM_WB: process(M_clock, Reset_MEM_WB)
    begin
        if Reset_MEM_WB = '1' then
            MEM_WB_latch.result <= (others => '0');
            MEM_WB_latch.instr <= (others => '0');
        elsif rising_edge(M_clock) then
            MEM_WB_latch.instr <= EX_MEM_latch.instr;
            MEM_WB_latch.result <= wb_data;
        end if;
    end process MEM_WB;   
    
-----------------------------------   OUT Port   -------------------------------------------------
    out_port <= MEM_WB_latch.result(instr_width) when MEM_WB_latch.instr(op_width) = op_out;  
    
end Behavioral;
