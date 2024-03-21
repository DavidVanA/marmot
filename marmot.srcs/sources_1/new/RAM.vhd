Library xpm;
use xpm.vcomponents.all;

entity RAM is
    port(
        Reset           : IN  std_logic;
        Clk             : IN  std_logic;
        Instr_Addr      : IN  std_logic_vector(instr_width);
        Instr           : OUT std_logic_vector(instr_width);
        Data_Addr       : IN  std_logic_vector(instr_width);
        Read_Data       : OUT std_logic_vector(instr_width);
        Write_Data      : IN  std_logic_vector(instr_width); -- <TODO>:
        Write_Not_Read  : IN  std_logic_vector(1..0); -- 2 bits for byte addressability                                                            
                                                            
        );
    
architecture Behavioral of RAM is

    signal ROM_Not_RAM std_logic;

    
begin
    
-----------------------------------    PC    -------------------------------------------------   
        -- RAM/ROM Selector for Fetch
        ROM_Not_RAM <= Instr_Addr(15) OR
                       Instr_Addr(14) OR
                       Instr_Addr(13) OR
                       Instr_Addr(12) OR
                       Instr_Addr(11) OR
                       Instr_Addr(10) OR
                       Instr_Addr(9);
    
        RAM_clka  <= Clk;
        RAM_clkb  <= Clk;
        RAM_addrb <= Instr_Addr(instr_mem_width);  
        RAM_doutb <= Instr;
        RAM_enb   <= not ROM_Not_RAM;
        RAM_rstb  <= Reset;

        ROM_clka  <= Clk;
        ROM_ena   <= ROM_Not_RAM;
        ROM_douta <= Instr;
        ROM_rsta  <= Reset;
        ROM_sleep <= ;
-----------------------------------   IF/ID   -------------------------------------------------   

        RAM_addra <= Data_Addr;
        RAM_wea   <= Write_Not_Read;
        RAM_dina  <= Write_Data;
        RAM_douta <= Read_Data;
        RAM_ena   <= not ROM_Not_RAM;
        RAM_rsta  <= Reset;

-----------------------------------   MEM/WB   -------------------------------------------------   
    
>>>>>>> memory
-- xpm_memory_dpdistram: Dual Port Distributed RAM
-- Xilinx Parameterized Macro, Version 2017.4
xpm_memory_dpdistram_inst : xpm_memory_dpdistram
  generic map (

    -- Common module generics
    MEMORY_SIZE             => 8192,           --positive integer
    CLOCKING_MODE           => "common_clock", --string; "common_clock", "independent_clock" 
    MEMORY_INIT_FILE        => "none",         --string; "none" or "<filename>.mem" 
    MEMORY_INIT_PARAM       => "none",         --string;
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
     ADDR_WIDTH_A               => 9,               -- DECIMAL
     AUTO_SLEEP_TIME            => 0,               -- DECIMAL
     ECC_MODE                   => "no_ecc",        -- String
     MEMORY_INIT_FILE           => "none",          -- String
     MEMORY_INIT_PARAM          => "0",             -- String
     MEMORY_OPTIMIZATION        => "true",          -- String
     MEMORY_PRIMITIVE           => "auto",          -- String
     MEMORY_SIZE                => 8192,            -- DECIMAL
     MESSAGE_CONTROL            => 0,               -- DECIMAL
     READ_DATA_WIDTH_A          => 16,              -- DECIMAL
     READ_LATENCY_A             => 2,               -- DECIMAL
     READ_RESET_VALUE_A         => "0",             -- String
     RST_MODE_A                 => "SYNC",          -- String
     USE_MEM_INIT               => 1,               -- DECIMAL
     WAKEUP_TIME                => "disable_sleep"  -- String
)
port map (
     dbiterra           => dbiterra,    -- 1-bit output: Leave open.
     douta              => ROM_douta,       -- READ_DATA_WIDTH_A-bit output: Data output for port A read operations.
     sbiterra           => sbiterra,    -- 1-bit output: Leave open.
     
     addra              => ROM_addra,       -- ADDR_WIDTH_A-bit input: Address for port A read operations.
     clka               => ROM_clka,        -- 1-bit input: Clock signal for port A.
     ena                => ROM_ena,         -- 1-bit input: Memory enable signal for port A. Must be high on clock
     -- cycles when read operations are initiated. Pipelined internally.
     injectdbiterra     => injectdbiterra, -- 1-bit input: Do not change from the provided value.
     injectsbiterra     => injectsbiterra, -- 1-bit input: Do not change from the provided value.
     regcea             => regcea,      -- 1-bit input: Do not change from the provided value.
     rsta               => rsta,        -- 1-bit input: Reset signal for the final port A output register
                                        -- stage. Synchronously resets output port douta to the value specified
                                        -- by parameter READ_RESET_VALUE_A.
     sleep              => ROM_sleep    -- 1-bit input: sleep signal to enable the dynamic power saving feature.
);

        
end Behavioral;
