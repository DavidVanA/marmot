library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Marmot_Config.all;

entity ALU is

    PORT(
        ALU_Ins        : IN    std_logic_vector(instr_width);
        ALU_A,ALU_B    : IN    std_logic_vector(reg_width);
        ALU_C          : OUT   std_logic_vector(reg_width);
        ALU_N          : OUT   std_logic;
        ALU_Z          : OUT   std_logic;
        ALU_Ov         : out   std_logic
    );
end ALU;

architecture Behavioral of ALU is

    signal  adder_A    : std_logic_vector(instr_width);
    signal  adder_B    : std_logic_vector(instr_width);
    signal  adder_C    : std_logic_vector(reg_width);
    
    signal  sub_B      : std_logic_vector(instr_width);
    signal  neg_sub_B  : std_logic_vector(instr_width);

    signal  nand_A     : std_logic_vector(instr_width);
    signal  nand_B     : std_logic_vector(instr_width);
    signal  nand_C     : std_logic_vector(instr_width);

    signal  test_A     : std_logic_vector(reg_width);

    signal  bshl_A     : std_logic_vector(instr_width);
    signal  bshl_C : std_logic_vector(instr_width);
    signal  bshl_B     : std_logic_vector(cl_width);

    signal  bshr_A     : std_logic_vector(instr_width);
    signal  bshr_C : std_logic_vector(instr_width);
    signal  bshr_B     : std_logic_vector(cl_width);
    signal  mult_A     : std_logic_vector(instr_width);

    signal  mult_B     : std_logic_vector(instr_width);
    signal  mult_C     : std_logic_vector(reg_width);

    signal  imm_C      : std_logic_vector(instr_width);

begin

-- Input demux

    input_demux_A : for i in instr_width generate
        adder_A(i)    <= ALU_A(i) when ALU_Ins(op_width) = op_add
                                  or ALU_Ins(op_width)   = op_sub  else '0';
        nand_A(i)     <= ALU_A(i) when ALU_Ins(op_width) = op_nand else '0';
        bshl_A(i)     <= ALU_A(i) when ALU_Ins(op_width) = op_bshl else '0';
        bshr_A(i)     <= ALU_A(i) when ALU_Ins(op_width) = op_bshr else '0';
        mult_A(i)     <= ALU_A(i) when ALU_Ins(op_width) = op_mult else '0';
    end generate input_demux_A;
    
    test_A <= ALU_A when ALU_Ins(op_width) = op_test else (others => '0');

-- Input demux B

    input_demux_B : for i in instr_width generate
        nand_B(i)     <= ALU_B(i) when ALU_Ins(op_width) = op_nand else '0';
        mult_B(i)     <= ALU_B(i) when ALU_Ins(op_width) = op_mult else '0';
    end generate input_demux_B;

-- Adder input B demux

    sub_B <= ALU_B(15 downto 0) when ALU_Ins(op_width) = op_sub else x"0000";
    with ALU_Ins(op_width) select
        adder_B <=
                  neg_sub_B         when op_sub,
                  ALU_B(instr_width)  when op_add,
                  (others => '0')     when others;
            
    bshl_B <= ALU_B(cl_width) when ALU_Ins(op_width) = op_bshl else x"0";
    bshr_B <= ALU_B(cl_width) when ALU_Ins(op_width) = op_bshr else x"0";

    imm_C <= ALU_Ins(imm_width) & ALU_A(7 downto 0) when ALU_Ins(op_width) = op_load_imm and ALU_Ins(8) = '1' else
             ALU_A(15 downto 8) & ALU_Ins(imm_width) when ALU_Ins(op_width) = op_load_imm and ALU_Ins(8) = '0' else
             (others => '0');

-- Output Mux
    with ALU_Ins(op_width) select 
        ALU_C <=
                   adder_C when op_add,
                   adder_C when op_sub,
             '0' & nand_C  when op_nand,
             '0' & bshl_C  when op_bshl,
             '0' & bshr_C  when op_bshr,
                   mult_C  when op_mult,
             '0' & imm_C   when op_load_imm,
                   ALU_B     when op_mov,
             (others => '0') when others;
    
    Adder_instance : entity work.Adder
    port map (
        Adder_A => adder_A,
        Adder_B => adder_B,
        Adder_C => adder_C
    );
    
    Nand_instance  : entity work.Nand_Component
    port map(
        Nand_A  => nand_A,
        Nand_B  => nand_B,
        Nand_C  => nand_C
    );
    
    Test_instance   : entity work.Test_Component
    port map(
        Test_A  => test_A,
        Test_N  => ALU_N,
        Test_Z  => ALU_Z,
        Test_Ov => ALU_Ov
    );
    
    BarrelShifterLeft_instance : entity work.BarrelShifterLeft
    port map(
        Sh_A    => bshl_A,
        Sh_B    => bshl_B,
        Sh_C    => bshl_C
    );    
    
    BarrelShifterRight_instance : entity work.BarrelShifterRight
    port map(
        Sh_A    => bshr_A,
        Sh_B    => bshr_B,
        Sh_C    => bshr_C
    );

    Mult_instance   : entity work.Mult
    port map(
        Mult_A  => mult_A(instr_width),
        Mult_B  => mult_B(instr_width),
        Mult_C  => Mult_C
    );
    
    TwosCompliment_instance : entity work.TwosComplement
    port map(
        input           => sub_B,
        twos_complement => neg_sub_B
    );
    
end Behavioral;
