library IEEE;                           --
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Marmot_Config.all;

entity The_Marmot is

  port (
    in_port                  : IN std_logic_vector(15 downto 6);
    M_clock                  : IN std_logic;
    Reset_and_Execute        : IN std_logic;
    Reset_and_Load           : IN std_logic;
    out_port                 : OUT std_logic;
                             
    ------- Input Switch Ports ------------------------------
                             
    sw         			     : IN std_logic_vector(9 downto 0);
    sw_sel     			     : IN std_logic;
                             
    ------- Debug Console Ports -----------------------------
                             
    debug_console   	     : in std_logic;
    board_clock     	     : in std_logic;
                    	     
    vga_red         	     : out std_logic_vector( 3 downto 0 );
    vga_green       	     : out std_logic_vector( 3 downto 0 );
    vga_blue        	     : out std_logic_vector( 3 downto 0 );
                    	     
    h_sync_signal   	     : out std_logic;
    v_sync_signal   	     : out std_logic;
                    	     
    ------- LED Display Ports -------------------------------
                             
    led_segments    	     : out STD_LOGIC_VECTOR( 6 downto 0 );
    led_digits      	     : out STD_LOGIC_VECTOR( 3 downto 0 )

    );
end The_Marmot;

architecture Behavioral of The_Marmot is

    signal ALU_A             : std_logic_vector(reg_width);
    signal ALU_B             : std_logic_vector(reg_width);
    signal ALU_C             : std_logic_vector(reg_width);
                             
    signal rd_index1         : std_logic_vector(reg_idx_width); 
    signal rd_index2         : std_logic_vector(reg_idx_width); 
    signal r1_data           : std_logic_vector(reg_width);
    signal r2_data           : std_logic_vector(reg_width);
                             
    signal Load_Data         :   std_logic_vector(instr_width);
    signal Mem_Addr          :   std_logic_vector(instr_width);
    signal Store_Data        :   std_logic_vector(instr_width);
    signal Fetch_Instr       :   std_logic_vector(instr_width);
                             
    signal br_addr           :   std_logic_vector(instr_width);
                             
    -- Writeback enable from controller
    signal WB_Enable         :   std_logic;
    
    -- MUX for REG read index 1
    signal Rd_Index_1_Select :   std_logic_vector(rd_index_width);
    -- MUX for REG read index 2
    signal Rd_Index_2_Select :   std_logic_vector(rd_index_width);

    -- MUX for ALU A and B
    signal ALU_A_Select      :   std_logic_vector(alu_src_width);    
    signal ALU_B_Select      :   std_logic_vector(alu_src_width);
    
    -- MUX for EX stage result source
    signal EX_Result_Select  :  std_logic_vector(ex_res_src_width);
    
    -- MUX for MEM_WB write index
    signal WB_Index_Select   : std_logic_vector(reg_idx_width);

    -- MUX for memory data address
    signal Mem_Addr_Select   : std_logic_vector(mem_src_width);
    -- MUX for memory write data 
    signal Store_Data_Select : std_logic_vector(mem_src_width);
    -- Signal for selecting write or read
    signal Store_Not_Load    : std_logic_vector(byte_addressable);

    -- MUX for writeback source
    signal WB_Data_Select    :     std_logic_vector(wb_src_width);
    
    -- Pipeline Latch Signals
    signal PC                :   PC_rec;
    signal IF_ID_latch       :   IF_ID_rec;
    signal ID_EX_latch       :   ID_EX_rec;
    signal EX_MEM_latch      :   EX_MEM_rec;
    signal MEM_WB_latch      :   MEM_WB_rec;
                             
    signal Reset_PC          :  std_logic;
    signal Reset_IF_ID       :  std_logic;
    signal Reset_Reg         :  std_logic;
    signal Reset_ID_EX       :  std_logic;
    signal Reset_EX_MEM      :  std_logic;
    signal Reset_MEM_WB      :  std_logic;
    signal Reset_Out         :  std_logic;
    
    signal ALU_Z             :  std_logic;
    signal FLAG_Z            :  std_logic;
    signal ALU_N             :  std_logic;
    signal FLAG_N            :  std_logic;
    signal ALU_Ov            :  std_logic;
    signal FLAG_Ov           :  std_logic;
    signal EX_result         :  std_logic_vector(reg_width);

    signal wb_data           : std_logic_vector(reg_width);
    signal PC_Select         : std_logic;
    signal Disp_Select       : std_logic_vector(instr_type_width);
    signal Branch_Relative   : std_logic;
    signal Branch_Base       : std_logic_vector(instr_width);
                             
    signal branch_WB         : std_logic;
    

    -- Debug monitor
    signal debug_reg_0       : std_logic_vector(reg_width);
    signal debug_reg_1       : std_logic_vector(reg_width);
    signal debug_reg_2       : std_logic_vector(reg_width);
    signal debug_reg_3       : std_logic_vector(reg_width);
    signal debug_reg_4       : std_logic_vector(reg_width);
    signal debug_reg_5       : std_logic_vector(reg_width);
    signal debug_reg_6       : std_logic_vector(reg_width);
    signal debug_reg_7       : std_logic_vector(reg_width);
        
component led_display is
   Port (
       -- Mem mapped to xFFF2
       addr_write            : in  STD_LOGIC_VECTOR (15 downto 0);
       clk                   : in  STD_LOGIC;
       data_in               : in  STD_LOGIC_VECTOR (15 downto 0);
       en_write              : in  STD_LOGIC;
       board_clock           : in  STD_LOGIC;
       led_segments          : out STD_LOGIC_VECTOR( 6 downto 0 );
       led_digits            : out STD_LOGIC_VECTOR( 3 downto 0 )
   );
end component;
   
component console is
        port (
    --
    -- Stage 1 Fetch
    --
            s1_pc            : in STD_LOGIC_VECTOR ( 15 downto 0 );
            s1_inst          : in STD_LOGIC_VECTOR ( 15 downto 0 );
    --
    -- Stage 2 Decode
    --
            s2_pc            : in STD_LOGIC_VECTOR ( 15 downto 0 );
            s2_inst          : in STD_LOGIC_VECTOR ( 15 downto 0 );
    
            s2_reg_a         : in STD_LOGIC_VECTOR( 2 downto 0 );
            s2_reg_b         : in STD_LOGIC_VECTOR( 2 downto 0 );
            s2_reg_c         : in STD_LOGIC_VECTOR( 2 downto 0 );
    
            s2_reg_a_data    : in STD_LOGIC_VECTOR( 15 downto 0 );
            s2_reg_b_data    : in STD_LOGIC_VECTOR( 15 downto 0 );
            s2_reg_c_data    : in STD_LOGIC_VECTOR( 15 downto 0 );
    
            s2_immediate     : in STD_LOGIC_VECTOR( 15 downto 0 );
    --
    -- Stage 3 Execute
    --
            s3_pc            : in STD_LOGIC_VECTOR ( 15 downto 0 );
            s3_inst          : in STD_LOGIC_VECTOR ( 15 downto 0 );
    
            s3_reg_a         : in STD_LOGIC_VECTOR( 2 downto 0 );
            s3_reg_b         : in STD_LOGIC_VECTOR( 2 downto 0 );
            s3_reg_c         : in STD_LOGIC_VECTOR( 2 downto 0 );
    
            s3_reg_a_data    : in STD_LOGIC_VECTOR( 15 downto 0 );
            s3_reg_b_data    : in STD_LOGIC_VECTOR( 15 downto 0 );
            s3_reg_c_data    : in STD_LOGIC_VECTOR( 15 downto 0 );
    
            s3_immediate     : in STD_LOGIC_VECTOR( 15 downto 0 );
    --
    -- Branch and memory operation
    --
            s3_r_wb          : in STD_LOGIC;
            s3_r_wb_data     : in STD_LOGIC_VECTOR( 15 downto 0 );
    
            s3_br_wb         : in STD_LOGIC;
            s3_br_wb_address : in STD_LOGIC_VECTOR( 15 downto 0 );
    
            s3_mr_wr         : in STD_LOGIC;
            s3_mr_wr_address : in STD_LOGIC_VECTOR( 15 downto 0 );
            s3_mr_wr_data    : in STD_LOGIC_VECTOR( 15 downto 0 );
    
            s3_mr_rd         : in STD_LOGIC;
            s3_mr_rd_address : in STD_LOGIC_VECTOR( 15 downto 0 );
    --
    -- Stage 4 Memory
    --
            s4_pc            : in STD_LOGIC_VECTOR( 15 downto 0 );
            s4_inst          : in STD_LOGIC_VECTOR( 15 downto 0 );
    
            s4_reg_a         : in STD_LOGIC_VECTOR( 2 downto 0 );
    
            s4_r_wb          : in STD_LOGIC;
            s4_r_wb_data     : in STD_LOGIC_VECTOR( 15 downto 0 );
    --
    -- CPU registers
    --    
            register_0       : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_1       : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_2       : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_3       : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_4       : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_5       : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_6       : in STD_LOGIC_VECTOR ( 15 downto 0 );
            register_7       : in STD_LOGIC_VECTOR ( 15 downto 0 );
    --
    -- CPU registers overflow flags
    --
            register_0_of    : in STD_LOGIC;
            register_1_of    : in STD_LOGIC;
            register_2_of    : in STD_LOGIC;
            register_3_of    : in STD_LOGIC;
            register_4_of    : in STD_LOGIC;
            register_5_of    : in STD_LOGIC;
            register_6_of    : in STD_LOGIC;
            register_7_of    : in STD_LOGIC;
    --
    -- CPU Flags
    --
            zero_flag        : in STD_LOGIC;
            negative_flag    : in STD_LOGIC;
            overflow_flag    : in STD_LOGIC;
    --
    -- Debug screen enable
    --
            debug            : in STD_LOGIC;
    -- Text console display memory access signals ( clk is the processor clock )
            addr_write       : in  STD_LOGIC_VECTOR (15 downto 0);
            clk              : in  STD_LOGIC;
            data_in          : in  STD_LOGIC_VECTOR (15 downto 0);
            en_write         : in  STD_LOGIC;
    --
    -- Video related signals
    --
            board_clock      : in STD_LOGIC;
            v_sync_signal    : out STD_LOGIC;
            h_sync_signal    : out STD_LOGIC;
            vga_red          : out STD_LOGIC_VECTOR( 3 downto 0 );
            vga_green        : out STD_LOGIC_VECTOR( 3 downto 0 );
            vga_blue         : out STD_LOGIC_VECTOR( 3 downto 0 )
    
        );
    end component;    
    
    
begin

-----------------------------------   IN Port   -------------------------------------------------   


-----------------------------------   Control   -------------------------------------------------
  
     Controller_instance: entity work.Controller
     port map(
       Reset_Execute_Port => Reset_and_Execute,
       Reset_Load_Port    => Reset_and_Load,
       Reset_PC           => Reset_PC,
       Reset_IF_ID        => Reset_IF_ID,
       Reset_Reg          => Reset_Reg,
       Reset_ID_EX        => Reset_ID_EX,
       Reset_EX_MEM       => Reset_EX_MEM,
       Reset_MEM_WB       => Reset_MEM_WB,
       IF_ID_PORT         => IF_ID_latch.instr,
       ID_EX_PORT         => ID_EX_latch.instr,
       EX_MEM_PORT        => EX_MEM_latch.instr,
       MEM_WB_PORT        => MEM_WB_latch.instr,
       WB_Enable          => WB_Enable,
       Mem_Addr_Select    => Mem_Addr_Select,
       Store_Data_Select  => Store_Data_Select,
       ALU_A_Select       => ALU_A_Select,
       ALU_B_Select       => ALU_B_Select,
       EX_Result_Select   => EX_Result_Select,
       Store_Not_Load     => Store_Not_Load,
       WB_Data_Select     => WB_Data_Select,
       MEM_WB_INDEX       => WB_Index_Select,
       Rd_Index_1_Select  => Rd_Index_1_Select,
       Rd_Index_2_Select  => Rd_Index_2_Select,
       ALU_N              => FLAG_N,
       ALU_Z              => FLAG_Z,
       ALU_Ov             => FLAG_Ov,
       PC_Select          => PC_Select,
       Disp_Select_Port   => Disp_Select,
       Branch_Relative    => Branch_Relative
       );

----------------------------------     PC       -------------------------------------------------

    PC_process: process(M_clock, Reset_And_Execute, Reset_And_Load)
    begin
        if Reset_And_Execute = '1' then
            PC.pc <= (others => '0');
            Reset_Out           <= '1';
        elsif Reset_And_Load = '1' then
            PC.pc <= x"0002";
            Reset_Out           <= '1';
        elsif rising_edge(M_clock) then
            Reset_Out           <= '0';
            if PC_Select = '0' then
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
        if rising_edge(M_clock) then
            if Reset_IF_ID = '1' then
                IF_ID_latch.instr   <= (others => '0');
                IF_ID_latch.pc      <= (others => '0');
                IF_ID_latch.npc     <= (others => '0'); 
            else
                IF_ID_latch.pc      <= PC.pc;
                IF_ID_latch.npc     <= PC.npc;
                IF_ID_latch.instr   <= Fetch_Instr;
            end if;
        end if;
    end process IF_ID;

         -- Select register read index
    rd_index1 <= Rd_Index_1_Select;
    rd_index2 <= Rd_Index_2_Select;
     
    Registers_Latches_instance : entity work.register_file
    port map(
        rst         => Reset_Reg,
        clk         => M_clock,
        wr_index    => WB_Index_Select,
        wr_data     => MEM_WB_latch.result,
        wr_enable   => WB_Enable,
        rd_index1   => rd_index1,
        rd_index2   => rd_index2,
        rd_data1    => r1_data,
        rd_data2    => r2_data,
        
        reg_0       =>  debug_reg_0,
        reg_1       =>  debug_reg_1,
        reg_2       =>  debug_reg_2,
        reg_3       =>  debug_reg_3,
        reg_4       =>  debug_reg_4,
        reg_5       =>  debug_reg_5,
        reg_6       =>  debug_reg_6,
        reg_7       =>  debug_reg_7        
    );
    
-----------------------------------   ID/EX   -------------------------------------------------   
-- [16 - instruction][16 - NPC][17 - ra_data][17 - rb_data][17 - rc_data]
    ID_EX: process(M_clock, Reset_ID_EX)
    begin
        if rising_edge(M_clock) then
            if Reset_ID_EX = '1' then
                ID_EX_latch.instr 	<= (others => '0');
                ID_EX_latch.pc 		<= (others => '0');
                ID_EX_latch.npc     <= (others => '0');
                ID_EX_latch.br_addr <= (others => '0');
                ID_EX_latch.ra_data <= (others => '0');
                ID_EX_latch.rb_data <= (others => '0');
            else
                ID_EX_latch.instr <= IF_ID_latch.instr;
                ID_EX_latch.pc <= IF_ID_latch.pc;
                ID_EX_latch.ra_data <= r1_data;
                ID_EX_latch.rb_data <= r2_data;
    
                ID_EX_latch.npc <= IF_ID_latch.npc;
                ID_EX_latch.br_addr <= br_addr;
            end if;
        end if;
    end process ID_EX;
    
     ------------ Branching -----------------

    -- Redundant?
    with Branch_Relative select
         Branch_Base <=
                       ALU_A(instr_width) when '1',
                       ID_EX_latch.pc                   when others;
    
   Branch_Calculator_instance: entity work.Branch_Calculator
       port map (
           Instr_Port      => ID_EX_latch.instr,
           Branch_Base     => Branch_Base,
           Ra              => ALU_A(instr_width),
           Disp_Selector   => Disp_Select,
           Br_Addr_Port    => PC.br
       );

    --------------------------------------
          
    with ALU_A_Select select
         ALU_A <= 
                 ID_EX_latch.ra_data when alu_src_rd,
                 wb_data when alu_src_fd1,
                 MEM_WB_latch.result when alu_src_fd2,
                 (others => '0') when others;
        
    with ALU_B_Select select
         ALU_B <= 
                 ID_EX_latch.rb_data when alu_src_rd,
                 wb_data when alu_src_fd1,
                 MEM_WB_latch.result when alu_src_fd2,
                 '0' & x"000" & ID_EX_latch.instr(cl_width) when alu_src_cl,
                 (others => '0') when others;

    ALU_instance: entity work.ALU
    port map( 
        ALU_Ins  => ID_EX_latch.instr,
        ALU_A    => ALU_A, 
        ALU_B    => ALU_B, 
        ALU_C    => ALU_C, 
        ALU_N    => ALU_N, 
        ALU_Z    => ALU_Z, 
        ALU_Ov   => ALU_Ov
        );    
    
    OUT_process: process(Reset_Out, M_Clock)
        begin
            if rising_edge(M_Clock) and Reset_Out = '1' then
                out_port <= '0';
            end if;
            if falling_edge(M_Clock) and Reset_Out = '0' then
                if ID_EX_latch.instr(op_width) = op_out then
                    out_port <= ALU_A(0);
                end if;
            end if;
    end process OUT_process;        
    
    EX_result <= '0' & in_port & "000000" when EX_Result_Select = ex_res_src_in and sw_sel = '0' else
                 '0' & "000000"& sw       when EX_Result_Select = ex_res_src_in and sw_sel = '1' else
                 ALU_C;
    
-----------------------------------   EX/MEM   -------------------------------------------------   
    EX_MEM: process(M_clock, Reset_EX_MEM)
    begin
        if Reset_EX_MEM = '1' then
              EX_MEM_latch.instr    <= (others => '0');
              EX_MEM_latch.pc       <= (others => '0');
              EX_MEM_latch.npc      <= (others => '0');
              EX_MEM_latch.result   <= (others => '0');
              EX_MEM_latch.ra_data  <= (others => '0');
              EX_MEM_latch.rb_data  <= (others => '0');
              FLAG_N    <= '0';
              FLAG_Z    <= '0';
              FLAG_Ov   <= '0';
        elsif rising_edge(M_clock) then
              EX_MEM_latch.result  <= EX_result;
              EX_MEM_latch.instr   <= ID_EX_latch.instr;
              EX_MEM_latch.pc      <= ID_EX_latch.pc;
              EX_MEM_latch.ra_data <= ALU_A;
              EX_MEM_latch.rb_data <= ALU_B;
              EX_MEM_latch.npc     <= ID_EX_latch.npc;
            
              if ID_EX_latch.instr (op_width) = op_test then
                  FLAG_N  <= ALU_N;
                  FLAG_Z  <= ALU_Z;
                  FLAG_Ov <= ALU_Ov;
              end if;            
        end if;
    end process EX_MEM;    

    with Mem_Addr_Select select
         Mem_Addr <=
                    EX_MEM_latch.ra_data(15 downto 0) when mem_src_ra,
                    EX_MEM_latch.rb_data(15 downto 0) when mem_src_rb,
			        MEM_WB_latch.result(15 downto 0)  when mem_src_f1,
			        (others => '0') when others;

    with Store_Data_Select select    
         Store_Data <=
                      EX_MEM_latch.rb_data(15 downto 0) when mem_src_rb,
			          MEM_WB_latch.result(15 downto 0) when mem_src_f1,
			          (others => '0') when others;
        
        
    Memory_instance : entity work.Memory
    port map(                               
        Reset           => Reset_and_Load,
        M_clock         => M_Clock,
        Fetch_Addr      => PC.pc,
        Fetch_Instr     => Fetch_instr,
        Mem_Addr        => Mem_addr,
        Load_Data       => Load_Data,
        Store_Data      => Store_Data, 
        Store_Not_Load  => Store_Not_Load
    );        
    
    with WB_Data_Select select
         WB_Data <=
                   EX_MEM_latch.result       when wb_src_alu,
                   '0' & Load_Data           when wb_src_mem,
                   '0' & EX_MEM_latch.npc    when wb_src_npc,
                   EX_MEM_latch.rb_data      when wb_src_rb,
                   EX_MEM_latch.ra_data      when wb_src_out,
                   (others => '0')           when others;
           
           
-----------------------------------   MEM/WB   -------------------------------------------------

    MEM_WB: process(M_clock, Reset_MEM_WB)
    begin
        if Reset_MEM_WB = '1' then
            MEM_WB_latch.result     <= (others => '0');
            MEM_WB_latch.instr      <= (others => '0');
            MEM_WB_latch.pc         <= (others => '0');
        elsif rising_edge(M_clock) then
            MEM_WB_latch.instr      <= EX_MEM_latch.instr;
            MEM_WB_latch.pc         <= EX_MEM_latch.pc;
            MEM_WB_latch.result     <= wb_data;
        end if;
    end process MEM_WB;       

-----------------------------------   LED Display     -------------------------------------------------   

-- Mem mapped to xFFF2
led_display_memory : led_display
port map (

       addr_write   => EX_MEM_latch.ra_data(15 downto 0), -- store address  
       clk          => M_clock,
       data_in      => EX_MEM_latch.rb_data(15 downto 0), -- data written to LEDs  
       en_write     => '1', 
       board_clock  => board_clock,
       led_segments => led_segments,
       led_digits   => led_digits
   );
     
-----------------------------------   Debug Console   -------------------------------------------------   

    console_display : console
    port map
    (
    --
    -- Stage 1 Fetch
    --
        s1_pc   => IF_ID_latch.pc,
        s1_inst => IF_ID_latch.instr,    
    --
    -- Stage 2 Decode
    --
        s2_pc           => ID_EX_latch.pc,
        s2_inst         => ID_EX_latch.instr,
    
        s2_reg_a        => ID_EX_latch.instr(ra_width),
        s2_reg_b        => ID_EX_latch.instr(rb_width),
        s2_reg_c        => ID_EX_latch.instr(rc_width),
    
        s2_reg_a_data   => ALU_A(instr_width),
        s2_reg_b_data   => ALU_B(instr_width),
        s2_reg_c_data   => EX_Result(instr_width),
        s2_immediate    => x"0000",
    --
    -- Stage 3 Execute
    --
        s3_pc           => EX_MEM_latch.pc,
        s3_inst         => EX_MEM_latch.instr,
    
        s3_reg_a        => EX_MEM_latch.instr(8 downto 6),
        s3_reg_b        => EX_MEM_latch.instr(5 downto 3),
        s3_reg_c        => EX_MEM_latch.instr(2 downto 0),
    
        s3_reg_a_data   => EX_MEM_latch.ra_data(instr_width),
        s3_reg_b_data   => EX_MEM_latch.rb_data(instr_width),
        s3_reg_c_data   => wb_data(instr_width),
        s3_immediate    => x"00" & EX_MEM_latch.instr(imm_width),
    
        s3_r_wb         => not(Store_Not_Load(0)),
        s3_r_wb_data    => Load_Data,
    
        s3_br_wb            => '0',
        s3_br_wb_address    => x"0000",
    
        s3_mr_wr            => Store_Not_Load(0),
        s3_mr_wr_address    => Mem_Addr,
        s3_mr_wr_data       => Store_Data,
    
        s3_mr_rd            => '0',
        s3_mr_rd_address    => x"0000",
    --
    -- Stage 4 Memory
    --
        s4_pc => MEM_WB_latch.pc,
        s4_inst => MEM_WB_latch.instr,
        s4_reg_a => WB_Index_Select,
        s4_r_wb => WB_Enable,
        s4_r_wb_data => MEM_WB_latch.result(instr_width),
    --
    -- CPU registers
    --
        register_0 => debug_reg_0(instr_width),
        register_1 => debug_reg_1(instr_width),
        register_2 => debug_reg_2(instr_width),
        register_3 => debug_reg_3(instr_width),
        register_4 => debug_reg_4(instr_width),
        register_5 => debug_reg_5(instr_width),
        register_6 => debug_reg_6(instr_width),
        register_7 => debug_reg_7(instr_width),
    
        register_0_of => debug_reg_0(16),
        register_1_of => debug_reg_0(16),
        register_2_of => debug_reg_0(16),
        register_3_of => debug_reg_0(16),
        register_4_of => debug_reg_0(16),
        register_5_of => debug_reg_0(16),
        register_6_of => debug_reg_0(16),
        register_7_of => debug_reg_0(16),
    --
    -- CPU Flags
    --
        zero_flag       => flag_z,
        negative_flag   => flag_n,
        overflow_flag   => flag_OV,
    --
    -- Debug screen enable
    --
        debug => debug_console,
    --
    -- Text console display memory access signals ( clk is the processor clock )
    --
        clk => M_Clock,
        addr_write => Mem_Addr,
        data_in => Store_Data,
        en_write => Store_Not_Load(0),
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
