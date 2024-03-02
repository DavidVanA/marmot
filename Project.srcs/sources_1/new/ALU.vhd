library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is

    generic(address_adder   : std_logic_vector := "001";
            address_nand    : std_logic_vector := "010";
            address_bshl    : std_logic_vector := "101";
            address_bshr    : std_logic_vector := "110";
            address_test    : std_logic_vector := "111";
            address_mult    : std_logic_vector := "011";
            alu_mode_a0     : std_logic_vector := "000";
            alu_mode_a1     : std_logic_vector := "001";
            alu_mode_a2     : std_logic_vector := "010";
            alu_mode_a3     : std_logic_vector := "011"
    );
    
    PORT(
        
        ALU_Ins     : IN    std_logic_vector(15 downto 0);
--        ALU_Mode    : IN    std_logic_vector(2 downto 0);
        ALU_A,ALU_B : IN    std_logic_vector(16 downto 0);
        ALU_C       : OUT   std_logic_vector(16 downto 0) 
    );
end ALU;

architecture Behavioral of ALU is

    signal  i_adder_A, i_adder_B, o_adder_C : std_logic_vector(15 downto 0);
    signal  i_nand_A, i_nand_B, o_nand_C    : std_logic_vector(15 downto 0);
    signal  i_test_A                        : std_logic_vector(16 downto 0);
    signal  o_test_Z, o_test_N,o_test_O     : std_logic;
    signal  i_bshl_A, o_bshl_A              : std_logic_vector(15 downto 0);
    signal  i_bshl_B                        : std_logic_vector(3 downto 0);
    signal  i_bshr_A, o_bshr_A              : std_logic_vector(15 downto 0);
    signal  i_bshr_B                        : std_logic_vector(3 downto 0);
--    signal  i_NOP_A, i_NOP_B, o_NOP_C                       : std_logic_vector(16 downto 0);
    signal  i_mult_A, i_mult_B              : std_logic_vector(15 downto 0);
    signal  o_mult_C                        : std_logic_vector(16 downto 0);

begin

    input_demux_A : for i in 15 downto 0 generate
        i_adder_A(i)    <= ALU_A(i) when ALU_ins(11 downto 9) = address_adder else '0';
        i_nand_A(i)     <= ALU_A(i) when ALU_ins(11 downto 9) = address_nand else '0';
        i_test_A(i)     <= ALU_A(i) when ALU_ins(11 downto 9) = address_test else '0';
        i_bshl_A(i)     <= ALU_A(i) when ALU_ins(11 downto 9) = address_bshl else '0';
        i_bshr_A(i)     <= ALU_A(i) when ALU_ins(11 downto 9) = address_bshr else '0';
        i_mult_A(i)     <= ALU_A(i) when ALU_ins(11 downto 9) = address_mult else '0';
    end generate input_demux_A;
    
    input_demux_B : for i in 15 downto 0 generate
        i_adder_B(i)    <= ALU_B(i) when ALU_ins(11 downto 9) = address_adder else '0';
        i_nand_B(i)     <= ALU_B(i) when ALU_ins(11 downto 9) = address_nand else '0';
        i_mult_B(i)     <= ALU_B(i) when ALU_ins(11 downto 9) = address_mult else '0';
    end generate input_demux_B;
    i_bshl_B            <= ALU_ins(3 downto 0) when ALU_ins(11 downto 9) = address_bshl else x"0";
    i_bshr_B            <= ALU_ins(3 downto 0) when ALU_ins(11 downto 9) = address_bshr else x"0";

    -- Output Mux
    with ALU_ins(11 downto 9) select 
        ALU_C <=
            '0' & o_adder_C when address_adder,
            '0' & o_nand_C  when address_nand,
            '0' & o_bshl_A when address_bshl,
            '0' & o_bshr_A when address_bshr,
            o_mult_C  when address_mult,
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
        Test_N  => o_test_Z,
        Test_Z  => o_test_N,
        Test_O  => o_test_O
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
        Mult_A  => i_mult_A(15 downto 0),
        Mult_B  => i_mult_B(15 downto 0),
        Mult_C  => o_mult_C
    );
    
end Behavioral;
