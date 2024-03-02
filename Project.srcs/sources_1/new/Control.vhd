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


entity Controller is

  generic(
    ALU_Op_width    :   integer         := 3;
    MEM_Op_width    :   integer         := 2;
    WB_Op_width     :   integer         := 2;

    op_nop      : std_logic_vector := "0000000";
    op_add      : std_logic_vector := "0000001";
    op_sub      : std_logic_vector := "0000010";
    op_mult     : std_logic_vector := "0000011";
    op_nand     : std_logic_vector := "0000100";
    op_bshl     : std_logic_vector := "0000101";
    op_bshr     : std_logic_vector := "0000110";
    op_test     : std_logic_vector := "0000111";
    op_out      : std_logic_vector := "0100000";
    op_in       : std_logic_vector := "0100001"
  );

  port (    
    INS_port            : IN std_logic_vector(15 downto 0);
    
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
