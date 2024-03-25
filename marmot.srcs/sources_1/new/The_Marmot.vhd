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
    
    ------- Debug Console Ports -----------------------------
    debug_console   : in std_logic;
    board_clock     : in std_logic;

    vga_red         : out std_logic_vector( 3 downto 0 );
    vga_green       : out std_logic_vector( 3 downto 0 );
    vga_blue        : out std_logic_vector( 3 downto 0 );

    h_sync_signal   : out std_logic;
    v_sync_signal   : out std_logic
    );
end The_Marmot;

architecture Behavioral of The_Marmot is

    signal i_ALU_A, i_ALU_B, o_ALU_C : std_logic_vector(reg_width);
    signal i_ALU_Op                  : std_logic_vector(alu_mode_width); 
    
    signal rd_index1      :   std_logic_vector(reg_idx_width); 
    signal rd_index2      :   std_logic_vector(reg_idx_width); 
    signal r1_data        :   std_logic_vector(reg_width);
    signal r2_data        :   std_logic_vector(reg_width);

    signal MEM_read_data  :   std_logic_vector(instr_width);
    signal MEM_data_addr  :   std_logic_vector(instr_width);
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

    -- MUX for ALU A and B
    signal o_CON_alu_src_1:   std_logic_vector(alu_src_width);    
    signal o_CON_alu_src_2:   std_logic_vector(alu_src_width);
    
    -- MUX for EX_MEM result
    signal o_CON_Ex_Mem_Res_Src: std_logic;
    
    -- MUX for MEM_WB write index
    signal o_CON_Mem_Wb_Index: std_logic_vector(reg_idx_width);

    -- MUX for memory data address
    signal o_CON_Data_Addr_Src: std_logic;

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

    
   
component console is
        port (
    
    --
    -- Stage 1 Fetch
    --
            s1_pc : in STD_LOGIC_VECTOR ( 15 downto 0 );
            s1_inst : in STD_LOGIC_VECTOR ( 15 downto 0 );
    
    
    --
    -- Stage 2 Decode
    --
            s2_pc : in STD_LOGIC_VECTOR ( 15 downto 0 );
            s2_inst : in STD_LOGIC_VECTOR ( 15 downto 0 );
    
            s2_reg_a : in STD_LOGIC_VECTOR( 2 downto 0 );
            s2_reg_b : in STD_LOGIC_VECTOR( 2 downto 0 );
            s2_reg_c : in STD_LOGIC_VECTOR( 2 downto 0 );
    
            s2_reg_a_data : in STD_LOGIC_VECTOR( 15 downto 0 );
            s2_reg_b_data : in STD_LOGIC_VECTOR( 15 downto 0 );
            s2_reg_c_data : in STD_LOGIC_VECTOR( 15 downto 0 );
    
            s2_immediate : in STD_LOGIC_VECTOR( 15 downto 0 );
    
    
    --
    -- Stage 3 Execute
    --
            s3_pc : in STD_LOGIC_VECTOR ( 15 downto 0 );
            s3_inst : in STD_LOGIC_VECTOR ( 15 downto 0 );
    
            s3_reg_a : in STD_LOGIC_VECTOR( 2 downto 0 );
            s3_reg_b : in STD_LOGIC_VECTOR( 2 downto 0 );
            s3_reg_c : in STD_LOGIC_VECTOR( 2 downto 0 );
    
            s3_reg_a_data : in STD_LOGIC_VECTOR( 15 downto 0 );
            s3_reg_b_data : in STD_LOGIC_VECTOR( 15 downto 0 );
            s3_reg_c_data : in STD_LOGIC_VECTOR( 15 downto 0 );
    
            s3_immediate : in STD_LOGIC_VECTOR( 15 downto 0 );
    
    --
    -- Branch and memory operation
    --
            s3_r_wb : in STD_LOGIC;
            s3_r_wb_data : in STD_LOGIC_VECTOR( 15 downto 0 );
    
            s3_br_wb : in STD_LOGIC;
            s3_br_wb_address : in STD_LOGIC_VECTOR( 15 downto 0 );
    
            s3_mr_wr : in STD_LOGIC;
            s3_mr_wr_address : in STD_LOGIC_VECTOR( 15 downto 0 );
            s3_mr_wr_data : in STD_LOGIC_VECTOR( 15 downto 0 );
    
            s3_mr_rd : in STD_LOGIC;
            s3_mr_rd_address : in STD_LOGIC_VECTOR( 15 downto 0 );
    
    --
    -- Stage 4 Memory
    --
            s4_pc : in STD_LOGIC_VECTOR( 15 downto 0 );
            s4_inst : in STD_LOGIC_VECTOR( 15 downto 0 );
    
            s4_reg_a : in STD_LOGIC_VECTOR( 2 downto 0 );
    
            s4_r_wb : in STD_LOGIC;
            s4_r_wb_data : in STD_LOGIC_VECTOR( 15 downto 0 );
    
    --
    -- CPU registers
    --
    
            register_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_4 : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_5 : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_6 : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_7 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    
    --
    -- CPU registers overflow flags
    --
            register_0_of : in STD_LOGIC;
            register_1_of : in STD_LOGIC;
            register_2_of : in STD_LOGIC;
            register_3_of : in STD_LOGIC;
            register_4_of : in STD_LOGIC;
            register_5_of : in STD_LOGIC;
            register_6_of : in STD_LOGIC;
            register_7_of : in STD_LOGIC;
    
    --
    -- CPU Flags
    --
            zero_flag : in STD_LOGIC;
            negative_flag : in STD_LOGIC;
            overflow_flag : in STD_LOGIC;
    
    --
    -- Debug screen enable
    --
            debug : in STD_LOGIC;
    
    --
    -- Text console display memory access signals ( clk is the processor clock )
    --
            addr_write : in  STD_LOGIC_VECTOR (15 downto 0);
            clk : in  STD_LOGIC;
            data_in : in  STD_LOGIC_VECTOR (15 downto 0);
            en_write : in  STD_LOGIC;
    
    --
    -- Video related signals
    --
            board_clock : in STD_LOGIC;
            v_sync_signal : out STD_LOGIC;
            h_sync_signal : out STD_LOGIC;
            vga_red : out STD_LOGIC_VECTOR( 3 downto 0 );
            vga_green : out STD_LOGIC_VECTOR( 3 downto 0 );
            vga_blue : out STD_LOGIC_VECTOR( 3 downto 0 )
    
        );
    end component;    
    
    
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
       MEM_DATA_ADDR_SRC  => o_CON_Data_Addr_Src,
       ALU_SRC_1          => o_CON_alu_src_1,
       ALU_SRC_2          => o_CON_alu_src_2,
       EX_MEM_RES_SRC     => o_CON_Ex_Mem_Res_Src,
       MEM_WR_nRD         => o_CON_Mem_Wr_nRd,
       WB_SRC             => o_CON_Wb_Src,
       MEM_WB_INDEX       => o_CON_Mem_Wb_Index,
       RD_INDEX_1         => o_CON_Rd_Index1,
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
    IF_ID_latch.npc <= PC.npc;
     
-----------------------------------   IF/ID     -------------------------------------------------    
    IF_ID: process(M_clock, Reset_IF_ID)
    begin
        if Reset_IF_ID = '1' then
            IF_ID_latch.instr <= (others => '0');
            IF_ID_latch.pc <= (others => '0');
            IF_ID_latch.npc <= (others => '0');
        elsif rising_edge(M_clock) then
            IF_ID_latch.pc <= PC.pc;
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
    rd_index2 <= IF_ID_latch.instr(rc_width);
     
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
        ALU_Mode => i_ALU_Op, 
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
        Mem_data_addr <=
            EX_MEM_latch.ra_data(15 downto 0) when '0',
            EX_MEM_latch.rb_data(15 downto 0) when others;
        
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
           '0' & EX_MEM_latch.instr(imm_width) & EX_MEM_latch.ra_data(7 downto 0) when wb_src_imm_upper,
           '0' & EX_MEM_latch.ra_data(15 downto 8) & EX_MEM_latch.instr(imm_width) when wb_src_imm_lower,
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
    
-----------------
    console_display : console
    port map
    (
    --
    -- Stage 1 Fetch
    --
        s1_pc => x"0000",
        s1_inst => x"0000",
    
    --
    -- Stage 2 Decode
    --
    
        s2_pc => x"0000",
        s2_inst => x"0000",
    
        s2_reg_a => "000",
        s2_reg_b => "000",
        s2_reg_c => "000",
    
        s2_reg_a_data => x"0000",
        s2_reg_b_data => x"0000",
        s2_reg_c_data => x"0000",
        s2_immediate => x"0000",
    
    --
    -- Stage 3 Execute
    --
    
        s3_pc => x"0000",
        s3_inst => x"0000",
    
        s3_reg_a => "000",
        s3_reg_b => "000",
        s3_reg_c => "000",
    
        s3_reg_a_data => x"0000",
        s3_reg_b_data => x"0000",
        s3_reg_c_data => x"0000",
        s3_immediate => x"0000",
    
        s3_r_wb => '0',
        s3_r_wb_data => x"0000",
    
        s3_br_wb => '0',
        s3_br_wb_address => x"0000",
    
        s3_mr_wr => '0',
        s3_mr_wr_address => x"0000",
        s3_mr_wr_data => x"0000",
    
        s3_mr_rd => '0',
        s3_mr_rd_address => x"0000",
    
    --
    -- Stage 4 Memory
    --
    
        s4_pc => x"0000",
        s4_inst => x"0000",
        s4_reg_a => "000",
        s4_r_wb => '0',
        s4_r_wb_data => x"0000",
    
    --
    -- CPU registers
    --
    
        register_0 => x"0000",
        register_1 => x"0000",
        register_2 => x"0000",
        register_3 => x"0000",
        register_4 => x"0000",
        register_5 => x"0000",
        register_6 => x"0000",
        register_7 => x"0000",
    
        register_0_of => '0',
        register_1_of => '0',
        register_2_of => '0',
        register_3_of => '0',
        register_4_of => '0',
        register_5_of => '0',
        register_6_of => '0',
        register_7_of => '0',
    
    --
    -- CPU Flags
    --
        zero_flag => '0',
        negative_flag => '0',
        overflow_flag => '0',
    
    --
    -- Debug screen enable
    --
        debug => debug_console,
    
    --
    -- Text console display memory access signals ( clk is the processor clock )
    --
    
        clk => '0',
        addr_write => x"0000",
        data_in => x"0000",
        en_write => '0',
    
    --
    -- Video related signals
    --
    
        board_clock => board_clock,
        h_sync_signal => h_sync_signal,
        v_sync_signal => v_sync_signal,
        vga_red => vga_red,
        vga_green => vga_green,
        vga_blue => vga_blue
    );
end Behavioral;
