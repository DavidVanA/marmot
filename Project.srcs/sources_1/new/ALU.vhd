library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is

    generic(address_adder   : std_logic_vector := "001";
            address_nand    : std_logic_vector := "010";
            address_test    : std_logic_vector := "111");
    
    PORT(
        ALU_Op      : IN    std_logic_vector( 2 downto 0);
        ALU_A,ALU_B : IN    std_logic_vector(15 downto 0);
        ALU_C       : OUT   std_logic_vector(15 downto 0) 
    );
end ALU;

architecture Behavioral of ALU is

    signal  i_adder_A, i_adder_B, o_adder_C : std_logic_vector(15 downto 0);
    signal  i_nand_A, i_nand_B, o_nand_C    : std_logic_vector(15 downto 0);
    signal  i_test_A                        : std_logic_vector(15 downto 0);
    signal  o_test_Z, o_test_N              : std_logic;

begin

    input_demux_A : for i in 15 downto 0 generate
        i_adder_A(i)    <= ALU_A(i) when ALU_Op = address_adder else '0';
        i_nand_A(i)     <= ALU_A(i) when ALU_Op = address_nand else '0';
        i_test_A(i)     <= ALU_A(i) when ALU_Op = address_test else '0';
    end generate input_demux_A;
    
    input_demux_B : for i in 15 downto 0 generate
        i_adder_B(i)    <= ALU_B(i) when ALU_Op = address_adder else '0';
        i_nand_B(i)     <= ALU_B(i) when ALU_Op = address_nand else '0';
    end generate input_demux_B;
    
    -- Output Mux
    with ALU_Op select 
        ALU_C <=
            o_adder_C when address_adder,
            o_nand_C  when address_nand,
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
        Test_Z  => o_test_N
    );
    
end Behavioral;
