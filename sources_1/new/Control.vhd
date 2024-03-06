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
    INS_port            : IN std_logic_vector(INSTR_width-1 downto 0);
    ALU_Mode            : OUT std_logic_vector(ALU_Op_width-1 downto 0);
    MEM_Op              : OUT std_logic_vector(MEM_Op_width-1 downto 0);
    WB_Op               : OUT std_logic_vector(WB_Op_width-1 downto 0)
  );
end Controller;

architecture Behavioral of Controller is

    signal INS          : std_logic_vector(15 downto 0);
    
begin
-----------------------------------   IF/ID     -------------------------------------------------        
    INS <= INS_PORT;
    with INS(15 downto 9) select
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
-----------------------------------   ID/EX   -------------------------------------------------   
-----------------------------------   EX/MEM   -------------------------------------------------   
-----------------------------------   MEM/WB   -------------------------------------------------   
-----------------------------------   OUT Port   -------------------------------------------------   
    
end Behavioral;
