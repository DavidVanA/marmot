library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Marmot_Config.all;

entity ALU is

    PORT(
--        ALU_Ins     : IN    std_logic_vector(alu_mode_width);
        ALU_Mode    : IN    std_logic_vector(alu_mode_width);
        ALU_A,ALU_B : IN    std_logic_vector(reg_width);
        ALU_C       : OUT   std_logic_vector(reg_width);
        ALU_N       : OUT   std_logic;
        ALU_Z       : OUT   std_logic;
        ALU_Ov      : out   std_logic
    );
end ALU;

architecture Behavioral of ALU is

    signal  i_adder_A, i_adder_B            : std_logic_vector(instr_width);
    signal  o_adder_C                       : std_logic_vector(reg_width);
    signal  i_sub_B, neg_i_sub_B            : std_logic_vector(instr_width);
    signal  i_nand_A, i_nand_B, o_nand_C    : std_logic_vector(instr_width);
    signal  i_test_A                        : std_logic_vector(reg_width);
    signal  i_bshl_A, o_bshl_A              : std_logic_vector(instr_width);
    signal  i_bshl_B                        : std_logic_vector(cl_width);
    signal  i_bshr_A, o_bshr_A              : std_logic_vector(instr_width);
    signal  i_bshr_B                        : std_logic_vector(cl_width);
--    signal  i_NOP_A, i_NOP_B, o_NOP_C                       : std_logic_vector(reg_width);
    signal  i_mult_A, i_mult_B              : std_logic_vector(instr_width);
    signal  o_mult_C                        : std_logic_vector(reg_width);

begin

-- Input demux

    input_demux_A : for i in instr_width generate
        i_adder_A(i)    <= ALU_A(i) when ALU_Mode = op_add(alu_mode_width)
                                      or ALU_Mode = op_sub(alu_mode_width)  else '0';
        i_nand_A(i)     <= ALU_A(i) when ALU_Mode = op_nand(alu_mode_width) else '0';
        i_bshl_A(i)     <= ALU_A(i) when ALU_Mode = op_bshl(alu_mode_width) else '0';
        i_bshr_A(i)     <= ALU_A(i) when ALU_Mode = op_bshr(alu_mode_width) else '0';
        i_mult_A(i)     <= ALU_A(i) when ALU_Mode = op_mult(alu_mode_width) else '0';
    end generate input_demux_A;
    
    i_test_A     <= ALU_A when ALU_Mode = op_test(alu_mode_width) else (others => '0');

-- Input demux B

    input_demux_B : for i in instr_width generate
        i_nand_B(i)     <= ALU_B(i) when ALU_Mode = op_nand(alu_mode_width) else '0';
        i_mult_B(i)     <= ALU_B(i) when ALU_Mode = op_mult(alu_mode_width) else '0';
    end generate input_demux_B;

-- Adder input B demux

    i_sub_B <= ALU_B(15 downto 0) when ALU_Mode = op_sub(alu_mode_width) else x"0000";
    with ALU_Mode select
        i_adder_B <=
            neg_i_sub_B         when op_sub(alu_mode_width),
            ALU_B(instr_width)  when op_add(alu_mode_width),
            (others => '0')     when others;
            
    i_bshl_B <= ALU_B(cl_width) when ALU_Mode = op_bshl(alu_mode_width) else x"0";
    i_bshr_B <= ALU_B(cl_width) when ALU_Mode = op_bshr(alu_mode_width) else x"0";

-- Output Mux
    with ALU_Mode select 
        ALU_C <=
                   o_adder_C when op_add(alu_mode_width),
                   o_adder_C when op_sub(alu_mode_width),
             '0' & o_nand_C  when op_nand(alu_mode_width),
             '0' & o_bshl_A  when op_bshl(alu_mode_width),
             '0' & o_bshr_A  when op_bshr(alu_mode_width),
                   o_mult_C  when op_mult(alu_mode_width),
             (others => '0') when others;
    
    Adder_instance : entity work.Adder
    port map (
        Adder_A => i_adder_A,
        Adder_B => i_adder_B,
        Adder_C => o_adder_C
    );
    
    Nand_instance  : entity work.Nand_Component
    port map(
        Nand_A  => i_nand_A,
        Nand_B  => i_nand_B,
        Nand_C  => o_nand_C
    );
    
    Test_instance   : entity work.Test_Component
    port map(
        Test_A  => i_test_A,
        Test_N  => ALU_N,
        Test_Z  => ALU_Z,
        Test_Ov => ALU_Ov
    );
    
    BarrelShifterLeft_instance : entity work.BarrelShifterLeft
    port map(
        Sh_A    => i_bshl_A,
        Sh_B    => i_bshl_B,
        Sh_C    => o_bshl_A
    );    
    
    BarrelShifterRight_instance : entity work.BarrelShifterRight
    port map(
        Sh_A    => i_bshr_A,
        Sh_B    => i_bshr_B,
        Sh_C    => o_bshr_A
    );

    Mult_instance   : entity work.Mult
    port map(
        Mult_A  => i_mult_A(instr_width),
        Mult_B  => i_mult_B(instr_width),
        Mult_C  => o_Mult_C
    );
    
    TwosCompliment_instance : entity work.TwosComplement
    port map(
        input           => i_sub_B,
        twos_complement => neg_i_sub_B
    );
    
end Behavioral;
