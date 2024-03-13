----------------------------------------------------------------------------------
-- Engineer: David Van Acken
-- 
-- Create Date: 03/2/2024
-- Design Name: 
-- Module Name: Controller - Behavioral
-- Project Name: The Marmot
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Marmot_Config.all;


entity Controller is

  port (    
    Reset_Execute_Port  : IN  std_logic;
    Reset_Load_Port     : IN  std_logic;
    IF_ID_PORT          : IN  std_logic_vector(instr_width);
    ID_EX_PORT          : IN  std_logic_vector(instr_width);
    EX_MEM_PORT         : IN  std_logic_vector(instr_width);
    MEM_WB_PORT         : IN  std_logic_vector(instr_width);
    ALU_Mode            : OUT std_logic_vector(alu_mode_width);
    Reset_IF_ID         : OUT std_logic;
    Reset_ID_EX         : OUT std_logic;
    Reset_EX_MEM        : OUT std_logic;
    Reset_MEM_WB        : OUT std_logic
--    MEM_Op              : OUT std_logic_vector(MEM_Op_width-1 downto 0);
--    WB_Op               : OUT std_logic_vector(WB_Op_width-1 downto 0)
    
    );
end Controller;

architecture Behavioral of Controller is

    signal Reset_Execute      : std_logic;
    signal Reset_Load         : std_logic;
    signal IF_ID_INS          : std_logic_vector(instr_width);
    signal ID_EX_INS          : std_logic_vector(instr_width);
    signal EX_MEM_INS         : std_logic_vector(instr_width);
    signal MEM_WB_INS         : std_logic_vector(instr_width);
    signal IF_ID_INS_type     : std_logic_vector(instr_type_width);
    signal ID_EX_INS_type     : std_logic_vector(instr_type_width);
    signal EX_MEM_INS_type    : std_logic_vector(instr_type_width);
    signal MEM_WB_INS_type    : std_logic_vector(instr_type_width);
                                                 
begin
    
    Reset_Execute <= Reset_Execute_Port;
    Reset_Load <= Reset_Load_Port;

-----------------------------------   Hazards    ------------------------------------------------

    -- Data Hazards
    -- Check relative positions of A instructions
    -- Check operands
    -- Set forwarding signals
    
    -- Control Hazards
    
    
-----------------------------------   IF/ID     -------------------------------------------------        
    Reset_IF_ID <= Reset_Execute or Reset_Load; -- OR whatever else
    IF_ID_INS   <= IF_ID_PORT;

    -- Should this become an entity?
    with IF_ID_INS(op_width) select
        ALU_Mode <= 
        "000" when op_nop,
        "001" when op_add,
        "010" when op_sub,
        "011" when op_mult,
        "100" when op_nand,
        "101" when op_bshl,
        "110" when op_bshr,
        "111" when op_test,
        "000" when op_in,
        "001" when op_out,
        (others => '0') when others;

     IF_ID_Instr_Decode_instance: entity work.Instruction_Decoder
       port map(
        Instr_Port      => IF_ID_INS(op_width),
        Instr_Type_Port => IF_ID_INS_type
       );
    

-- TODO: rd_index_1 selector 
-----------------------------------   ID/EX   -------------------------------------------------   
      Reset_ID_EX <= Reset_Execute or Reset_Load; -- OR whatever else

      ID_EX_INS <= ID_EX_PORT;
    
      ID_EX_Instr_Decode_instance: entity work.Instruction_Decoder
       port map(
        Instr_Port      => ID_EX_INS(op_width),
        Instr_Type_Port => ID_EX_INS_type
       );

      
-----------------------------------   EX/MEM   -------------------------------------------------   
      Reset_EX_MEM <= Reset_Execute or Reset_Load; -- OR whatever else

      EX_MEM_INS <= EX_MEM_PORT;

      EX_MEM_Instr_Decode_instance: entity work.Instruction_Decoder
       port map(
        Instr_Port      => EX_MEM_INS(op_width),
        Instr_Type_Port => EX_MEM_INS_type
       );
    
-----------------------------------   MEM/WB   -------------------------------------------------   
      Reset_MEM_WB <= Reset_Execute or Reset_Load; -- OR whatever else 

      MEM_WB_INS <= MEM_WB_PORT;

       
    
-----------------------------------   OUT Port   -------------------------------------------------   
    
end Behavioral;
