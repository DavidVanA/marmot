library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library xpm;
use xpm.vcomponents.all;
use work.Marmot_Config.all;

entity Memory is
  Port (
        M_clock         : IN std_logic;
        Reset           : IN  std_logic;
        
        -- Fetch 
        Fetch_Addr      : IN  std_logic_vector(instr_width);-- The instruction to fetch
        Fetch_Instr     : OUT std_logic_vector(instr_width); -- The fetched instruction
        
        -- Memory
        Store_Not_Load   : IN std_logic_vector(1 downto 0);
        
        Mem_Addr       : IN  std_logic_vector(instr_width);
        Load_Data       : OUT std_logic_vector(instr_width);
        Store_Data      : IN  std_logic_vector(instr_width)
   );
end Memory;

architecture Behavioral of Memory is

    signal RAM_Not_ROM : std_logic;

    signal RAM_ena     : std_logic;
    signal RAM_enb     : std_logic;
    signal ROM_en      : std_logic;
    signal RAM_douta   : std_logic_vector(instr_width);
    signal RAM_doutb   : std_logic_vector(instr_width);
    signal ROM_douta   : std_logic_vector(instr_width); 
    signal RAM_wea     : std_logic_vector(1 downto 0);


begin
    
    
    RAM_not_ROM <= Fetch_Addr(15) OR
                   Fetch_Addr(14) OR
                   Fetch_Addr(13) OR
                   Fetch_Addr(12) OR
                   Fetch_Addr(11);

    Fetch_Instr <= RAM_doutb when RAM_not_ROM = '1' else ROM_douta;
    
    ROM_en      <= not RAM_not_ROM;

    Load_Data   <= RAM_douta;
    
    RAM_ena     <= '0' when Mem_Addr(15 downto 11) /= "00001" else
				   '1' when Store_Not_Load = mem_load     else
                   '1' when Store_Not_Load = mem_store    else
                   '0';
    RAM_wea     <= Store_Not_Load;
    
xpm_memory_dpdistram_inst : xpm_memory_dpdistram
  generic map (

    -- Common module generics
    MEMORY_SIZE             => 8192,           --positive integer
    CLOCKING_MODE           => "common_clock", --string; "common_clock", "independent_clock" 
    MEMORY_INIT_FILE        => "in_fact.mem",         --string; "none" or "<filename>.mem" 
    MEMORY_INIT_PARAM       => "0",         --string;
    USE_MEM_INIT            => 0,              --integer; 0,1
    MESSAGE_CONTROL         => 0,              --integer; 0,1
    USE_EMBEDDED_CONSTRAINT => 0,              --integer: 0,1
    MEMORY_OPTIMIZATION     => "true",         --string; "true", "false" 

    -- Port A module generics
    WRITE_DATA_WIDTH_A      => 16,             --positive integer
    READ_DATA_WIDTH_A       => 16,             --positive integer
    BYTE_WRITE_WIDTH_A      => 8,              --integer; 8, 9, or WRITE_DATA_WIDTH_A value
    ADDR_WIDTH_A            => 9,             --positive integer --> 2^10 = 1024
    READ_RESET_VALUE_A      => "0",            --string
    READ_LATENCY_A          => 0,              --non-negative integer

    -- Port B module generics
    READ_DATA_WIDTH_B       => 16,             --positive integer
    ADDR_WIDTH_B            => 9,             --positive integer
    READ_RESET_VALUE_B      => "0",            --string
    READ_LATENCY_B          => 0               --non-negative integer
  )

  port map (
    regcea                  => '1',   --do not change
    regceb                  => '1',   --do not change

    -- Port A module ports
    clka                    => M_clock,
    rsta                    => Reset,
    ena                     => RAM_ena,
    wea                     => RAM_wea,
    addra                   => Mem_Addr(9 downto 1),
    dina                    => Store_Data,
    douta                   => RAM_douta,


    -- Port B module ports
    clkb                    => M_clock,
    rstb                    => Reset,
    enb                     => RAM_not_ROM,
    addrb                   => Fetch_Addr(9 downto 1),
    doutb                   => RAM_doutb
    
  );
  
  
xpm_memory_sprom_inst : xpm_memory_sprom
  generic map (

    MEMORY_SIZE             => 8192,            --positive integer
    MEMORY_PRIMITIVE        => "auto",          --string; "auto", "distributed", or "block";
    MEMORY_INIT_FILE        => "newboots.mem",     --string; "none" or "<filename>.mem" 
    MEMORY_INIT_PARAM       => "",              --string;
    USE_MEM_INIT            => 1,               --integer; 0,1
    WAKEUP_TIME             => "disable_sleep", --string; "disable_sleep" or "use_sleep_pin" 
    MESSAGE_CONTROL         => 0,               --integer; 0,1
    ECC_MODE                => "no_ecc",        --string; "no_ecc", "encode_only", "decode_only" or "both_encode_and_decode" 
    AUTO_SLEEP_TIME         => 0,               --Do not Change
    MEMORY_OPTIMIZATION     => "true",          --string; "true", "false" 

    -- Port A module generics
    READ_DATA_WIDTH_A       => 16,              --positive integer
    ADDR_WIDTH_A            => 9,               --positive integer
    READ_RESET_VALUE_A      => "0",             --string
    READ_LATENCY_A          => 0                --non-negative integer
  )
  port map (
    sleep                   => '0',
    injectsbiterra          => '0',   --do not change
    injectdbiterra          => '0',   --do not change
    sbiterra                => open,  --do not change
    dbiterra                => open,   --do not change
    regcea                  => '1',
    
    -- ROM ports
    clka                    => M_clock,
    rsta                    => Reset,
    ena                     => ROM_en, -- not Ram_not_ROM
    addra                   => Fetch_Addr(9 downto 1),
    douta                   => ROM_douta
  );

-- End of xpm_memory_sprom_inst instance declaration
end Behavioral;
