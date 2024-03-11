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
    IF_ID_PORT          : IN std_logic_vector(instr_width);
    ID_EX_PORT          : IN std_logic_vector(instr_width);
    EX_MEM_PORT         : IN std_logic_vector(instr_width);
    MEM_WB_PORT         : IN std_logic_vector(instr_width);
--    INS_port            : IN std_logic_vector(instr_width);
    ALU_Mode            : OUT std_logic_vector(alu_mode_width)
--    MEM_Op              : OUT std_logic_vector(MEM_Op_width-1 downto 0);
--    WB_Op               : OUT std_logic_vector(WB_Op_width-1 downto 0)
    
    );
end Controller;

architecture Behavioral of Controller is

    signal IF_ID_INS          : std_logic_vector(instr_width);
    signal ID_EX_INS          : std_logic_vector(instr_width);
    signal EX_MEM_INS         : std_logic_vector(instr_width);
    signal MEM_WB_INS         : std_logic_vector(instr_width);
    
begin
-----------------------------------   IF/ID     -------------------------------------------------        
    IF_ID_INS   <= IF_ID_PORT;
    ALU_Mode    <= IF_ID_INS(11 downto 9);
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
