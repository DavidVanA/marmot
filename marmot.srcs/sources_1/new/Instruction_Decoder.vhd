library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Marmot_Config.all;

entity Instruction_Decoder is
  Port(
    Instr_Port      : IN  std_logic_vector(op_code);
    Instr_Type_Port : OUT std_logic_vector(instr_type_width)
    -- Instr_Operand1
    -- Instr_Operand2
    );

end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

  signal i_Instr_Op      : std_logic_vector(op_code);
  signal o_Instr_Type    : std_logic_vector(instr_type_width);
  -- Should this also output the reg_idx the instruction specifies?
  
begin

  i_Instr_Op <= Instr_Port;
  
  with i_Instr_Op select
    o_Instr_Type <=
                   a0_instr when op_nop,
                   a0_instr when op_return,
                   a1_instr when op_add,
                   a1_instr when op_sub,
                   a1_instr when op_mult,
                   a1_instr when op_nand,
                   a2_instr when op_bshl,
                   a2_instr when op_bshr,
                   a3_instr when op_test,
                   a3_instr when op_out,
                   a3_instr when op_in,
                   b1_instr when op_brr,
                   b1_instr when op_brr_n,
                   b1_instr when op_brr_z,
                   b1_instr when op_brr_ov,
                   b2_instr when op_br,
                   b2_instr when op_br_n,
                   b2_instr when op_br_z,
                   b2_instr when op_br_ov,
                   b2_instr when op_br_sub,
                   l1_instr when op_load_imm,
                   l2_instr when op_mov,
                   l2_instr when op_load,
                   l2_instr when op_store,
                   (others => '0') when others;

  instr_Type_Port <= o_Instr_Type;
  
end Behavioral;
