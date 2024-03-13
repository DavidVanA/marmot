----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2024 08:12:48 AM
-- Design Name: 
-- Module Name: instr_type_decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Marmot_Config.all;


entity instr_type_decoder is
  Port ( 
    instr           : IN    std_logic_vector(op_width);
    decoded_type    : OUT   std_logic_vector(2 downto 0);
  );
end instr_type_decoder;

architecture Behavioral of instr_type_decoder is

begin
    with instr select
        decoded_type <= type_A0 when op_nop  or op_op_rtn,
                        type_A1 when op_add  or op_sub   or op_mul   or op_nand,
                        type_A2 when op_bshl or op_bshr,
                        type_A3 when op_test or op_out   or op_in,
                        type_B1 when op_brr  or op_brr_n or op_brr_z or op_brr_ov,
                        type_B2 when op_br   or op_br_n  or op_br_z  or op_br_sub  or op_br_ov,
                        type_L1 when op_ld_imm,
                        type_L2 when op_ld   or op_sd    or op_mv;

end Behavioral;
