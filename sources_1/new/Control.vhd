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


entity Control is

  port (    
    IF_ID_PORT          : IN std_logic_vector(instr_range);
    ID_EX_PORT          : IN std_logic_vector(instr_range);
    EX_MEM_PORT         : IN std_logic_vector(instr_range);
    MEM_WB_PORT         : IN std_logic_vector(instr_range);
--    INS_port            : IN std_logic_vector(INSTR_width-1 downto 0);
    ALU_Mode            : OUT std_logic_vector(ALU_Op_width-1 downto 0);
    MEM_Op              : OUT std_logic_vector(MEM_Op_width-1 downto 0);
    WB_Op               : OUT std_logic_vector(WB_Op_width-1 downto 0)
    
    );
end Control;

architecture Behavioral of Control is

    signal IF_ID_INS          : std_logic_vector(INSTR_range);
    signal ID_EX_INS          : std_logic_vector(INSTR_range);
    signal EX_MEM_INS         : std_logic_vector(INSTR_range);
    signal MEM_WB_INS         : std_logic_vector(INSTR_range);
    
begin
-----------------------------------   IF/ID     -------------------------------------------------        
    IF_ID_INS <= IF_ID_PORT;
    with IF_ID_INS(15 downto 9) select
        ALU_Mode <= 
        "000" when op_nop,
        "001" when op_add,
        "001" when op_sub,
        "001" when op_mult,
        "001" when op_nand,
        "010" when op_bshl,
        "010" when op_bshr,
        "011" when op_test,
        "011" when op_in,
        "011" when op_out,
        (others => '0') when others;
    
-- TODO: ALU input selector?
-- TODO: rd_index_1 selector 
-----------------------------------   ID/EX   -------------------------------------------------   
    ID_EX_INS <= ID_EX_PORT;
-----------------------------------   EX/MEM   -------------------------------------------------   
    EX_MEM_INS <= EX_MEM_PORT;
-----------------------------------   MEM/WB   -------------------------------------------------   
    MEM_WB_INS <= MEM_WB_PORT;
-----------------------------------   OUT Port   -------------------------------------------------   
    
end Behavioral;
