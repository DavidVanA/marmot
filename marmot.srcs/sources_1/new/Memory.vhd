Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library xpm;
use xpm.vcomponents.all;
use work.Marmot_Config.all;

entity Memory is
    port(
        Reset           : IN  std_logic;
        Clk             : IN  std_logic;
        -- Port B (fetch)
        Fetch_Addr      : IN  std_logic_vector(instr_width); -- instruction counter in
        Fetch_Instr     : OUT std_logic_vector(instr_width); -- store or load, instr out
        -- Port A (memory)
        Mem_Addr        : IN  std_logic_vector(instr_width); -- if store is data. if load is location
        Load_Data       : OUT std_logic_vector(instr_width);
        Store_Data      : IN  std_logic_vector(instr_width); 
        Store_Not_Load  : IN  std_logic_vector(1 downto 0) -- store not load
        );
end Memory;
    
architecture Behavioral of Memory is

    signal RAM_Not_ROM : std_logic;
    signal RAM_clka    : std_logic;
    signal RAM_clkb    : std_logic;
    signal RAM_addrb   : std_logic_vector(instr_mem_width);
    signal RAM_doutb   : std_logic_vector(instr_width);
    signal RAM_enb     : std_logic;
    signal RAM_rstb    : std_logic;
         
    signal ROM_clka    : std_logic;
    signal ROM_ena     : std_logic;
    signal ROM_addra   : std_logic_vector(instr_mem_width);
    signal ROM_douta   : std_logic_vector(instr_width); 
    signal ROM_rsta    : std_logic;
    signal ROM_sleep   : std_logic;

    signal RAM_addra   : std_logic_vector(instr_mem_width);
    signal RAM_wea     : std_logic_vector(1 downto 0);
    signal RAM_dina    : std_logic_vector(instr_width);
    signal RAM_douta   : std_logic_vector(instr_width);
    signal RAM_ena     : std_logic;
    signal Mem_op      : std_logic;
    signal RAM_rsta    : std_logic;

    
begin
    
-----------------------------------    PC    -------------------------------------------------   
        -- RAM/ROM Selector for Fetch
        RAM_Not_ROM <= Fetch_Addr(15) OR
                       Fetch_Addr(14) OR
                       Fetch_Addr(13) OR
                       Fetch_Addr(12) OR
                       Fetch_Addr(11) OR
                       Fetch_Addr(10) OR
                       Fetch_Addr(9);
    
        RAM_clka   <= Clk;
        RAM_clkb   <= Clk;
        RAM_addrb  <= Fetch_Addr(instr_mem_width); -- 10 bits wide  
        RAM_enb    <= RAM_not_ROM;
        RAM_rstb   <= Reset;

        ROM_clka   <= Clk;
        ROM_ena    <= not RAM_not_ROM;
        ROM_rsta   <= Reset;
        ROM_addra  <= '0' & Fetch_Addr(9 downto 1);
        Fetch_Instr<= RAM_doutb when RAM_not_ROM = '1' else ROM_douta;
        
 
-----------------------------------   IF/ID   -------------------------------------------------   

        with Store_Not_Load select
            Mem_op <= '1' when mem_store,
                      '1' when mem_load,
                      '0' when others;

        RAM_addra  <= Mem_Addr(10 downto 1);
        RAM_wea    <= Store_Not_Load;
        RAM_dina   <= Store_Data;   
        Load_Data  <= RAM_douta;    
        RAM_ena    <= Mem_op;
        RAM_rsta   <= Reset;

            
-----------------------------------   MEM/WB   -------------------------------------------------   
    
-- xpm_memory_dpdistram: Dual Port Distributed RAM
-- Xilinx Parameterized Macro, Version 2017.4
xpm_memory_dpdistram_inst : xpm_memory_dpdistram
  generic map (

    -- Common module generics
    MEMORY_SIZE             => 16384,           --positive integer
    CLOCKING_MODE           => "common_clock", --string; "common_clock", "independent_clock" 
    MEMORY_INIT_FILE        => "none",         --string; "none" or "<filename>.mem" 
    MEMORY_INIT_PARAM       => "0",         --string;
    USE_MEM_INIT            => 0,              --integer; 0,1
    MESSAGE_CONTROL         => 0,              --integer; 0,1
    USE_EMBEDDED_CONSTRAINT => 0,              --integer: 0,1
    MEMORY_OPTIMIZATION     => "true",         --string; "true", "false" 

    -- Port A module generics
    WRITE_DATA_WIDTH_A      => 16,             --positive integer
    READ_DATA_WIDTH_A       => 16,             --positive integer
    BYTE_WRITE_WIDTH_A      => 8,              --integer; 8, 9, or WRITE_DATA_WIDTH_A value
    ADDR_WIDTH_A            => 10,             --positive integer --> 2^10 = 1024
    READ_RESET_VALUE_A      => "0",            --string
    READ_LATENCY_A          => 1,              --non-negative integer

    -- Port B module generics
    READ_DATA_WIDTH_B       => 16,             --positive integer
    ADDR_WIDTH_B            => 10,             --positive integer
    READ_RESET_VALUE_B      => "0",            --string
    READ_LATENCY_B          => 1               --non-negative integer
  )

  port map (

    -- Port A module ports
    clka                    => RAM_clka,
    rsta                    => RAM_rsta,
    ena                     => RAM_ena,
    regcea                  => '1',   --do not change
    wea                     => RAM_wea,
    addra                   => RAM_addra,
    dina                    => RAM_dina,
    douta                   => RAM_douta,

    -- Port B module ports
    clkb                    => RAM_clkb,
    rstb                    => RAM_rstb,
    enb                     => RAM_enb,
    regceb                  => '1',   --do not change
    addrb                   => RAM_addrb,
    doutb                   => RAM_doutb
  );


xpm_memory_sprom_inst : xpm_memory_sprom
  generic map (

    -- Common module generics
    MEMORY_SIZE             => 16384,            --positive integer
    MEMORY_PRIMITIVE        => "auto",          --string; "auto", "distributed", or "block";
    MEMORY_INIT_FILE        => "storeTest.mem",     --string; "none" or "<filename>.mem" 
    MEMORY_INIT_PARAM       => "",              --string;
    USE_MEM_INIT            => 1,               --integer; 0,1
    WAKEUP_TIME             => "disable_sleep", --string; "disable_sleep" or "use_sleep_pin" 
    MESSAGE_CONTROL         => 0,               --integer; 0,1
    ECC_MODE                => "no_ecc",        --string; "no_ecc", "encode_only", "decode_only" or "both_encode_and_decode" 
    AUTO_SLEEP_TIME         => 0,               --Do not Change
    MEMORY_OPTIMIZATION     => "true",          --string; "true", "false" 

    -- Port A module generics
    READ_DATA_WIDTH_A       => 16,              --positive integer
    ADDR_WIDTH_A            => 10,               --positive integer
    READ_RESET_VALUE_A      => "0",             --string
    READ_LATENCY_A          => 0                --non-negative integer
  )
  port map (

    -- Common module ports
    sleep                   => '0',

    -- Port A module ports
    clka                    => ROM_clka,
    rsta                    => ROM_rsta,
    ena                     => ROM_ena,
    regcea                  => '1',
    addra                   => ROM_addra,
    injectsbiterra          => '0',   --do not change
    injectdbiterra          => '0',   --do not change
    douta                   => ROM_douta,
    sbiterra                => open,  --do not change
    dbiterra                => open   --do not change
  );

-- End of xpm_memory_sprom_inst instance declaration
        
end Behavioral;
