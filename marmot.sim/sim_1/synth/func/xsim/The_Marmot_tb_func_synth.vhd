-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Fri Mar 15 17:42:54 2024
-- Host        : david-pc-win running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/david/Documents/School/6y/2s/ece449/marmot/marmot.sim/sim_1/synth/func/xsim/The_Marmot_tb_func_synth.vhd
-- Design      : The_Marmot
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TwosComplement is
  port (
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \EX_MEM_latch_reg[result][15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \EX_MEM_latch_reg[result][15]_0\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    in_port_IBUF : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end TwosComplement;

architecture STRUCTURE of TwosComplement is
  signal \EX_MEM_latch[result][0]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][10]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][11]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][12]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][13]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][14]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][15]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][15]_i_3_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][15]_i_4_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][15]_i_5_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][15]_i_6_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][15]_i_7_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][15]_i_8_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][15]_i_9_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][1]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][2]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][3]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][4]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][5]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][6]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][7]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][8]_i_2_n_0\ : STD_LOGIC;
  signal \EX_MEM_latch[result][9]_i_2_n_0\ : STD_LOGIC;
  signal i_sub_B : STD_LOGIC_VECTOR ( 0 to 0 );
  signal neg_i_sub_B : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \plusOp_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_n_1\ : STD_LOGIC;
  signal \plusOp_carry__0_n_2\ : STD_LOGIC;
  signal \plusOp_carry__0_n_3\ : STD_LOGIC;
  signal \plusOp_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \plusOp_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \plusOp_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \plusOp_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \plusOp_carry__1_n_0\ : STD_LOGIC;
  signal \plusOp_carry__1_n_1\ : STD_LOGIC;
  signal \plusOp_carry__1_n_2\ : STD_LOGIC;
  signal \plusOp_carry__1_n_3\ : STD_LOGIC;
  signal \plusOp_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \plusOp_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \plusOp_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \plusOp_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \plusOp_carry__2_n_1\ : STD_LOGIC;
  signal \plusOp_carry__2_n_2\ : STD_LOGIC;
  signal \plusOp_carry__2_n_3\ : STD_LOGIC;
  signal plusOp_carry_i_1_n_0 : STD_LOGIC;
  signal plusOp_carry_i_2_n_0 : STD_LOGIC;
  signal plusOp_carry_i_3_n_0 : STD_LOGIC;
  signal plusOp_carry_i_5_n_0 : STD_LOGIC;
  signal plusOp_carry_n_0 : STD_LOGIC;
  signal plusOp_carry_n_1 : STD_LOGIC;
  signal plusOp_carry_n_2 : STD_LOGIC;
  signal plusOp_carry_n_3 : STD_LOGIC;
  signal \NLW_plusOp_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \EX_MEM_latch[result][0]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \EX_MEM_latch[result][15]_i_8\ : label is "soft_lutpair0";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of plusOp_carry : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_carry__2\ : label is 35;
begin
\EX_MEM_latch[result][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][0]_i_2_n_0\,
      I1 => neg_i_sub_B(0),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(0),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(0)
    );
\EX_MEM_latch[result][0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(0),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][0]_i_2_n_0\
    );
\EX_MEM_latch[result][10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][10]_i_2_n_0\,
      I1 => neg_i_sub_B(10),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(10),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(10)
    );
\EX_MEM_latch[result][10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(10),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][10]_i_2_n_0\
    );
\EX_MEM_latch[result][11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][11]_i_2_n_0\,
      I1 => neg_i_sub_B(11),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(11),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(11)
    );
\EX_MEM_latch[result][11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(11),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][11]_i_2_n_0\
    );
\EX_MEM_latch[result][12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][12]_i_2_n_0\,
      I1 => neg_i_sub_B(12),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(12),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(12)
    );
\EX_MEM_latch[result][12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(12),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][12]_i_2_n_0\
    );
\EX_MEM_latch[result][13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][13]_i_2_n_0\,
      I1 => neg_i_sub_B(13),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(13),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(13)
    );
\EX_MEM_latch[result][13]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(13),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][13]_i_2_n_0\
    );
\EX_MEM_latch[result][14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][14]_i_2_n_0\,
      I1 => neg_i_sub_B(14),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(14),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(14)
    );
\EX_MEM_latch[result][14]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(14),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][14]_i_2_n_0\
    );
\EX_MEM_latch[result][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][15]_i_2_n_0\,
      I1 => neg_i_sub_B(15),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(15),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(15)
    );
\EX_MEM_latch[result][15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(15),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][15]_i_2_n_0\
    );
\EX_MEM_latch[result][15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFDF"
    )
        port map (
      I0 => \EX_MEM_latch_reg[result][15]_0\(5),
      I1 => \EX_MEM_latch_reg[result][15]_0\(6),
      I2 => \EX_MEM_latch_reg[result][15]_0\(0),
      I3 => \EX_MEM_latch[result][15]_i_6_n_0\,
      I4 => plusOp_carry_i_5_n_0,
      I5 => \EX_MEM_latch[result][15]_i_7_n_0\,
      O => \EX_MEM_latch[result][15]_i_3_n_0\
    );
\EX_MEM_latch[result][15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0014001400140000"
    )
        port map (
      I0 => plusOp_carry_i_5_n_0,
      I1 => Q(5),
      I2 => Q(0),
      I3 => Q(1),
      I4 => \EX_MEM_latch[result][15]_i_8_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][15]_i_4_n_0\
    );
\EX_MEM_latch[result][15]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202000"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => \EX_MEM_latch[result][15]_i_9_n_0\,
      I3 => \EX_MEM_latch[result][15]_i_8_n_0\,
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][15]_i_5_n_0\
    );
\EX_MEM_latch[result][15]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \EX_MEM_latch_reg[result][15]_0\(2),
      I1 => \EX_MEM_latch_reg[result][15]_0\(1),
      I2 => \EX_MEM_latch_reg[result][15]_0\(4),
      I3 => \EX_MEM_latch_reg[result][15]_0\(3),
      O => \EX_MEM_latch[result][15]_i_6_n_0\
    );
\EX_MEM_latch[result][15]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => Q(5),
      I1 => Q(0),
      I2 => Q(1),
      O => \EX_MEM_latch[result][15]_i_7_n_0\
    );
\EX_MEM_latch[result][15]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \EX_MEM_latch_reg[result][15]_0\(5),
      I1 => \EX_MEM_latch_reg[result][15]_0\(6),
      I2 => \EX_MEM_latch_reg[result][15]_0\(0),
      O => \EX_MEM_latch[result][15]_i_8_n_0\
    );
\EX_MEM_latch[result][15]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => Q(5),
      I1 => Q(0),
      I2 => Q(3),
      I3 => Q(4),
      I4 => Q(6),
      O => \EX_MEM_latch[result][15]_i_9_n_0\
    );
\EX_MEM_latch[result][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][1]_i_2_n_0\,
      I1 => neg_i_sub_B(1),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(1),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(1)
    );
\EX_MEM_latch[result][1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(1),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][1]_i_2_n_0\
    );
\EX_MEM_latch[result][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][2]_i_2_n_0\,
      I1 => neg_i_sub_B(2),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(2),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(2)
    );
\EX_MEM_latch[result][2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(2),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][2]_i_2_n_0\
    );
\EX_MEM_latch[result][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][3]_i_2_n_0\,
      I1 => neg_i_sub_B(3),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(3),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(3)
    );
\EX_MEM_latch[result][3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(3),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][3]_i_2_n_0\
    );
\EX_MEM_latch[result][4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][4]_i_2_n_0\,
      I1 => neg_i_sub_B(4),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(4),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(4)
    );
\EX_MEM_latch[result][4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(4),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][4]_i_2_n_0\
    );
\EX_MEM_latch[result][5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][5]_i_2_n_0\,
      I1 => neg_i_sub_B(5),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(5),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(5)
    );
\EX_MEM_latch[result][5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(5),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][5]_i_2_n_0\
    );
\EX_MEM_latch[result][6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][6]_i_2_n_0\,
      I1 => neg_i_sub_B(6),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(6),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(6)
    );
\EX_MEM_latch[result][6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(6),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][6]_i_2_n_0\
    );
\EX_MEM_latch[result][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][7]_i_2_n_0\,
      I1 => neg_i_sub_B(7),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(7),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(7)
    );
\EX_MEM_latch[result][7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(7),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][7]_i_2_n_0\
    );
\EX_MEM_latch[result][8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][8]_i_2_n_0\,
      I1 => neg_i_sub_B(8),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(8),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(8)
    );
\EX_MEM_latch[result][8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(8),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][8]_i_2_n_0\
    );
\EX_MEM_latch[result][9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \EX_MEM_latch[result][9]_i_2_n_0\,
      I1 => neg_i_sub_B(9),
      I2 => \EX_MEM_latch[result][15]_i_3_n_0\,
      I3 => \EX_MEM_latch_reg[result][15]\(9),
      I4 => \EX_MEM_latch[result][15]_i_4_n_0\,
      I5 => \EX_MEM_latch[result][15]_i_5_n_0\,
      O => D(9)
    );
\EX_MEM_latch[result][9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => in_port_IBUF(9),
      I1 => \EX_MEM_latch_reg[result][15]_0\(5),
      I2 => \EX_MEM_latch_reg[result][15]_0\(6),
      I3 => \EX_MEM_latch_reg[result][15]_0\(0),
      I4 => \EX_MEM_latch[result][15]_i_6_n_0\,
      O => \EX_MEM_latch[result][9]_i_2_n_0\
    );
plusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => plusOp_carry_n_0,
      CO(2) => plusOp_carry_n_1,
      CO(1) => plusOp_carry_n_2,
      CO(0) => plusOp_carry_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3 downto 0) => neg_i_sub_B(3 downto 0),
      S(3) => plusOp_carry_i_1_n_0,
      S(2) => plusOp_carry_i_2_n_0,
      S(1) => plusOp_carry_i_3_n_0,
      S(0) => i_sub_B(0)
    );
\plusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => plusOp_carry_n_0,
      CO(3) => \plusOp_carry__0_n_0\,
      CO(2) => \plusOp_carry__0_n_1\,
      CO(1) => \plusOp_carry__0_n_2\,
      CO(0) => \plusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => neg_i_sub_B(7 downto 4),
      S(3) => \plusOp_carry__0_i_1_n_0\,
      S(2) => \plusOp_carry__0_i_2_n_0\,
      S(1) => \plusOp_carry__0_i_3_n_0\,
      S(0) => \plusOp_carry__0_i_4_n_0\
    );
\plusOp_carry__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(7),
      O => \plusOp_carry__0_i_1_n_0\
    );
\plusOp_carry__0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(6),
      O => \plusOp_carry__0_i_2_n_0\
    );
\plusOp_carry__0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(5),
      O => \plusOp_carry__0_i_3_n_0\
    );
\plusOp_carry__0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(4),
      O => \plusOp_carry__0_i_4_n_0\
    );
\plusOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__0_n_0\,
      CO(3) => \plusOp_carry__1_n_0\,
      CO(2) => \plusOp_carry__1_n_1\,
      CO(1) => \plusOp_carry__1_n_2\,
      CO(0) => \plusOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => neg_i_sub_B(11 downto 8),
      S(3) => \plusOp_carry__1_i_1_n_0\,
      S(2) => \plusOp_carry__1_i_2_n_0\,
      S(1) => \plusOp_carry__1_i_3_n_0\,
      S(0) => \plusOp_carry__1_i_4_n_0\
    );
\plusOp_carry__1_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(11),
      O => \plusOp_carry__1_i_1_n_0\
    );
\plusOp_carry__1_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(10),
      O => \plusOp_carry__1_i_2_n_0\
    );
\plusOp_carry__1_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(9),
      O => \plusOp_carry__1_i_3_n_0\
    );
\plusOp_carry__1_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(8),
      O => \plusOp_carry__1_i_4_n_0\
    );
\plusOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__1_n_0\,
      CO(3) => \NLW_plusOp_carry__2_CO_UNCONNECTED\(3),
      CO(2) => \plusOp_carry__2_n_1\,
      CO(1) => \plusOp_carry__2_n_2\,
      CO(0) => \plusOp_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => neg_i_sub_B(15 downto 12),
      S(3) => \plusOp_carry__2_i_1_n_0\,
      S(2) => \plusOp_carry__2_i_2_n_0\,
      S(1) => \plusOp_carry__2_i_3_n_0\,
      S(0) => \plusOp_carry__2_i_4_n_0\
    );
\plusOp_carry__2_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(15),
      O => \plusOp_carry__2_i_1_n_0\
    );
\plusOp_carry__2_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(14),
      O => \plusOp_carry__2_i_2_n_0\
    );
\plusOp_carry__2_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(13),
      O => \plusOp_carry__2_i_3_n_0\
    );
\plusOp_carry__2_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(12),
      O => \plusOp_carry__2_i_4_n_0\
    );
plusOp_carry_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(3),
      O => plusOp_carry_i_1_n_0
    );
plusOp_carry_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(2),
      O => plusOp_carry_i_2_n_0
    );
plusOp_carry_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(1),
      O => plusOp_carry_i_3_n_0
    );
plusOp_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(5),
      I3 => plusOp_carry_i_5_n_0,
      I4 => \EX_MEM_latch_reg[result][15]\(0),
      O => i_sub_B(0)
    );
plusOp_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => Q(3),
      I1 => Q(4),
      I2 => Q(6),
      I3 => Q(2),
      O => plusOp_carry_i_5_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity register_file is
  port (
    \MEM_WB_latch_reg[instr][13]\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \reg_file_reg[7][15]_0\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    M_clock_IBUF_BUFG : in STD_LOGIC;
    \i_ALU_B_reg[0]\ : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
end register_file;

architecture STRUCTURE of register_file is
  signal \^mem_wb_latch_reg[instr][13]\ : STD_LOGIC;
  signal \i_ALU_B[0]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[0]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[10]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[10]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[11]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[11]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[12]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[12]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[13]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[13]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[14]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[14]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[15]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[15]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[1]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[1]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[2]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[2]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[3]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[3]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[4]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[4]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[5]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[5]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[6]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[6]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[7]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[7]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[8]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[8]_i_3_n_0\ : STD_LOGIC;
  signal \i_ALU_B[9]_i_2_n_0\ : STD_LOGIC;
  signal \i_ALU_B[9]_i_3_n_0\ : STD_LOGIC;
  signal \reg_file[0][15]_i_2_n_0\ : STD_LOGIC;
  signal \reg_file[0]_7\ : STD_LOGIC;
  signal \reg_file[1][15]_i_2_n_0\ : STD_LOGIC;
  signal \reg_file[1]_3\ : STD_LOGIC;
  signal \reg_file[2]_6\ : STD_LOGIC;
  signal \reg_file[3]_2\ : STD_LOGIC;
  signal \reg_file[4]_5\ : STD_LOGIC;
  signal \reg_file[5]_1\ : STD_LOGIC;
  signal \reg_file[6]_4\ : STD_LOGIC;
  signal \reg_file[7]_0\ : STD_LOGIC;
  signal \reg_file_reg[0]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \reg_file_reg[1]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \reg_file_reg[2]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \reg_file_reg[3]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \reg_file_reg[4]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \reg_file_reg[5]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \reg_file_reg[6]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \reg_file_reg[7]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  \MEM_WB_latch_reg[instr][13]\ <= \^mem_wb_latch_reg[instr][13]\;
\i_ALU_B[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(0),
      I1 => \reg_file_reg[2]\(0),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(0),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(0),
      O => \i_ALU_B[0]_i_2_n_0\
    );
\i_ALU_B[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(0),
      I1 => \reg_file_reg[6]\(0),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(0),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(0),
      O => \i_ALU_B[0]_i_3_n_0\
    );
\i_ALU_B[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(10),
      I1 => \reg_file_reg[2]\(10),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(10),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(10),
      O => \i_ALU_B[10]_i_2_n_0\
    );
\i_ALU_B[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(10),
      I1 => \reg_file_reg[6]\(10),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(10),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(10),
      O => \i_ALU_B[10]_i_3_n_0\
    );
\i_ALU_B[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(11),
      I1 => \reg_file_reg[2]\(11),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(11),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(11),
      O => \i_ALU_B[11]_i_2_n_0\
    );
\i_ALU_B[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(11),
      I1 => \reg_file_reg[6]\(11),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(11),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(11),
      O => \i_ALU_B[11]_i_3_n_0\
    );
\i_ALU_B[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(12),
      I1 => \reg_file_reg[2]\(12),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(12),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(12),
      O => \i_ALU_B[12]_i_2_n_0\
    );
\i_ALU_B[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(12),
      I1 => \reg_file_reg[6]\(12),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(12),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(12),
      O => \i_ALU_B[12]_i_3_n_0\
    );
\i_ALU_B[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(13),
      I1 => \reg_file_reg[2]\(13),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(13),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(13),
      O => \i_ALU_B[13]_i_2_n_0\
    );
\i_ALU_B[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(13),
      I1 => \reg_file_reg[6]\(13),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(13),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(13),
      O => \i_ALU_B[13]_i_3_n_0\
    );
\i_ALU_B[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(14),
      I1 => \reg_file_reg[2]\(14),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(14),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(14),
      O => \i_ALU_B[14]_i_2_n_0\
    );
\i_ALU_B[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(14),
      I1 => \reg_file_reg[6]\(14),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(14),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(14),
      O => \i_ALU_B[14]_i_3_n_0\
    );
\i_ALU_B[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(15),
      I1 => \reg_file_reg[2]\(15),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(15),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(15),
      O => \i_ALU_B[15]_i_2_n_0\
    );
\i_ALU_B[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(15),
      I1 => \reg_file_reg[6]\(15),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(15),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(15),
      O => \i_ALU_B[15]_i_3_n_0\
    );
\i_ALU_B[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(1),
      I1 => \reg_file_reg[2]\(1),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(1),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(1),
      O => \i_ALU_B[1]_i_2_n_0\
    );
\i_ALU_B[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(1),
      I1 => \reg_file_reg[6]\(1),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(1),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(1),
      O => \i_ALU_B[1]_i_3_n_0\
    );
\i_ALU_B[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(2),
      I1 => \reg_file_reg[2]\(2),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(2),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(2),
      O => \i_ALU_B[2]_i_2_n_0\
    );
\i_ALU_B[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(2),
      I1 => \reg_file_reg[6]\(2),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(2),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(2),
      O => \i_ALU_B[2]_i_3_n_0\
    );
\i_ALU_B[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(3),
      I1 => \reg_file_reg[2]\(3),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(3),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(3),
      O => \i_ALU_B[3]_i_2_n_0\
    );
\i_ALU_B[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(3),
      I1 => \reg_file_reg[6]\(3),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(3),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(3),
      O => \i_ALU_B[3]_i_3_n_0\
    );
\i_ALU_B[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(4),
      I1 => \reg_file_reg[2]\(4),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(4),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(4),
      O => \i_ALU_B[4]_i_2_n_0\
    );
\i_ALU_B[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(4),
      I1 => \reg_file_reg[6]\(4),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(4),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(4),
      O => \i_ALU_B[4]_i_3_n_0\
    );
\i_ALU_B[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(5),
      I1 => \reg_file_reg[2]\(5),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(5),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(5),
      O => \i_ALU_B[5]_i_2_n_0\
    );
\i_ALU_B[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(5),
      I1 => \reg_file_reg[6]\(5),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(5),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(5),
      O => \i_ALU_B[5]_i_3_n_0\
    );
\i_ALU_B[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(6),
      I1 => \reg_file_reg[2]\(6),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(6),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(6),
      O => \i_ALU_B[6]_i_2_n_0\
    );
\i_ALU_B[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(6),
      I1 => \reg_file_reg[6]\(6),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(6),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(6),
      O => \i_ALU_B[6]_i_3_n_0\
    );
\i_ALU_B[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(7),
      I1 => \reg_file_reg[2]\(7),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(7),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(7),
      O => \i_ALU_B[7]_i_2_n_0\
    );
\i_ALU_B[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(7),
      I1 => \reg_file_reg[6]\(7),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(7),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(7),
      O => \i_ALU_B[7]_i_3_n_0\
    );
\i_ALU_B[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(8),
      I1 => \reg_file_reg[2]\(8),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(8),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(8),
      O => \i_ALU_B[8]_i_2_n_0\
    );
\i_ALU_B[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(8),
      I1 => \reg_file_reg[6]\(8),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(8),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(8),
      O => \i_ALU_B[8]_i_3_n_0\
    );
\i_ALU_B[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[3]\(9),
      I1 => \reg_file_reg[2]\(9),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[1]\(9),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[0]\(9),
      O => \i_ALU_B[9]_i_2_n_0\
    );
\i_ALU_B[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \reg_file_reg[7]\(9),
      I1 => \reg_file_reg[6]\(9),
      I2 => \i_ALU_B_reg[0]\(1),
      I3 => \reg_file_reg[5]\(9),
      I4 => \i_ALU_B_reg[0]\(0),
      I5 => \reg_file_reg[4]\(9),
      O => \i_ALU_B[9]_i_3_n_0\
    );
\i_ALU_B_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[0]_i_2_n_0\,
      I1 => \i_ALU_B[0]_i_3_n_0\,
      O => D(0),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[10]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[10]_i_2_n_0\,
      I1 => \i_ALU_B[10]_i_3_n_0\,
      O => D(10),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[11]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[11]_i_2_n_0\,
      I1 => \i_ALU_B[11]_i_3_n_0\,
      O => D(11),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[12]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[12]_i_2_n_0\,
      I1 => \i_ALU_B[12]_i_3_n_0\,
      O => D(12),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[13]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[13]_i_2_n_0\,
      I1 => \i_ALU_B[13]_i_3_n_0\,
      O => D(13),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[14]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[14]_i_2_n_0\,
      I1 => \i_ALU_B[14]_i_3_n_0\,
      O => D(14),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[15]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[15]_i_2_n_0\,
      I1 => \i_ALU_B[15]_i_3_n_0\,
      O => D(15),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[1]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[1]_i_2_n_0\,
      I1 => \i_ALU_B[1]_i_3_n_0\,
      O => D(1),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[2]_i_2_n_0\,
      I1 => \i_ALU_B[2]_i_3_n_0\,
      O => D(2),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[3]_i_2_n_0\,
      I1 => \i_ALU_B[3]_i_3_n_0\,
      O => D(3),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[4]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[4]_i_2_n_0\,
      I1 => \i_ALU_B[4]_i_3_n_0\,
      O => D(4),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[5]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[5]_i_2_n_0\,
      I1 => \i_ALU_B[5]_i_3_n_0\,
      O => D(5),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[6]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[6]_i_2_n_0\,
      I1 => \i_ALU_B[6]_i_3_n_0\,
      O => D(6),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[7]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[7]_i_2_n_0\,
      I1 => \i_ALU_B[7]_i_3_n_0\,
      O => D(7),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[8]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[8]_i_2_n_0\,
      I1 => \i_ALU_B[8]_i_3_n_0\,
      O => D(8),
      S => \i_ALU_B_reg[0]\(2)
    );
\i_ALU_B_reg[9]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \i_ALU_B[9]_i_2_n_0\,
      I1 => \i_ALU_B[9]_i_3_n_0\,
      O => D(9),
      S => \i_ALU_B_reg[0]\(2)
    );
\out_port_reg[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => Q(7),
      I1 => Q(6),
      I2 => Q(9),
      O => \^mem_wb_latch_reg[instr][13]\
    );
\reg_file[0][15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => \reg_file[0][15]_i_2_n_0\,
      O => \reg_file[0]_7\
    );
\reg_file[0][15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000047E0000"
    )
        port map (
      I0 => Q(4),
      I1 => Q(3),
      I2 => Q(5),
      I3 => Q(8),
      I4 => \^mem_wb_latch_reg[instr][13]\,
      I5 => Q(0),
      O => \reg_file[0][15]_i_2_n_0\
    );
\reg_file[1][15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => \reg_file[1][15]_i_2_n_0\,
      O => \reg_file[1]_3\
    );
\reg_file[1][15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"047E000000000000"
    )
        port map (
      I0 => Q(4),
      I1 => Q(3),
      I2 => Q(5),
      I3 => Q(8),
      I4 => \^mem_wb_latch_reg[instr][13]\,
      I5 => Q(0),
      O => \reg_file[1][15]_i_2_n_0\
    );
\reg_file[2][15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => \reg_file[0][15]_i_2_n_0\,
      O => \reg_file[2]_6\
    );
\reg_file[3][15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => \reg_file[1][15]_i_2_n_0\,
      O => \reg_file[3]_2\
    );
\reg_file[4][15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => \reg_file[0][15]_i_2_n_0\,
      O => \reg_file[4]_5\
    );
\reg_file[5][15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => Q(1),
      I1 => Q(2),
      I2 => \reg_file[1][15]_i_2_n_0\,
      O => \reg_file[5]_1\
    );
\reg_file[6][15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => \reg_file[0][15]_i_2_n_0\,
      O => \reg_file[6]_4\
    );
\reg_file[7][15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => \reg_file[1][15]_i_2_n_0\,
      O => \reg_file[7]_0\
    );
\reg_file_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(0),
      Q => \reg_file_reg[0]\(0),
      R => SR(0)
    );
\reg_file_reg[0][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(10),
      Q => \reg_file_reg[0]\(10),
      R => SR(0)
    );
\reg_file_reg[0][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(11),
      Q => \reg_file_reg[0]\(11),
      R => SR(0)
    );
\reg_file_reg[0][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(12),
      Q => \reg_file_reg[0]\(12),
      R => SR(0)
    );
\reg_file_reg[0][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(13),
      Q => \reg_file_reg[0]\(13),
      R => SR(0)
    );
\reg_file_reg[0][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(14),
      Q => \reg_file_reg[0]\(14),
      R => SR(0)
    );
\reg_file_reg[0][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(15),
      Q => \reg_file_reg[0]\(15),
      R => SR(0)
    );
\reg_file_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(1),
      Q => \reg_file_reg[0]\(1),
      R => SR(0)
    );
\reg_file_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(2),
      Q => \reg_file_reg[0]\(2),
      R => SR(0)
    );
\reg_file_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(3),
      Q => \reg_file_reg[0]\(3),
      R => SR(0)
    );
\reg_file_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(4),
      Q => \reg_file_reg[0]\(4),
      R => SR(0)
    );
\reg_file_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(5),
      Q => \reg_file_reg[0]\(5),
      R => SR(0)
    );
\reg_file_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(6),
      Q => \reg_file_reg[0]\(6),
      R => SR(0)
    );
\reg_file_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(7),
      Q => \reg_file_reg[0]\(7),
      R => SR(0)
    );
\reg_file_reg[0][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(8),
      Q => \reg_file_reg[0]\(8),
      R => SR(0)
    );
\reg_file_reg[0][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[0]_7\,
      D => \reg_file_reg[7][15]_0\(9),
      Q => \reg_file_reg[0]\(9),
      R => SR(0)
    );
\reg_file_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(0),
      Q => \reg_file_reg[1]\(0),
      R => SR(0)
    );
\reg_file_reg[1][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(10),
      Q => \reg_file_reg[1]\(10),
      R => SR(0)
    );
\reg_file_reg[1][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(11),
      Q => \reg_file_reg[1]\(11),
      R => SR(0)
    );
\reg_file_reg[1][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(12),
      Q => \reg_file_reg[1]\(12),
      R => SR(0)
    );
\reg_file_reg[1][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(13),
      Q => \reg_file_reg[1]\(13),
      R => SR(0)
    );
\reg_file_reg[1][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(14),
      Q => \reg_file_reg[1]\(14),
      R => SR(0)
    );
\reg_file_reg[1][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(15),
      Q => \reg_file_reg[1]\(15),
      R => SR(0)
    );
\reg_file_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(1),
      Q => \reg_file_reg[1]\(1),
      R => SR(0)
    );
\reg_file_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(2),
      Q => \reg_file_reg[1]\(2),
      R => SR(0)
    );
\reg_file_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(3),
      Q => \reg_file_reg[1]\(3),
      R => SR(0)
    );
\reg_file_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(4),
      Q => \reg_file_reg[1]\(4),
      R => SR(0)
    );
\reg_file_reg[1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(5),
      Q => \reg_file_reg[1]\(5),
      R => SR(0)
    );
\reg_file_reg[1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(6),
      Q => \reg_file_reg[1]\(6),
      R => SR(0)
    );
\reg_file_reg[1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(7),
      Q => \reg_file_reg[1]\(7),
      R => SR(0)
    );
\reg_file_reg[1][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(8),
      Q => \reg_file_reg[1]\(8),
      R => SR(0)
    );
\reg_file_reg[1][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[1]_3\,
      D => \reg_file_reg[7][15]_0\(9),
      Q => \reg_file_reg[1]\(9),
      R => SR(0)
    );
\reg_file_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(0),
      Q => \reg_file_reg[2]\(0),
      R => SR(0)
    );
\reg_file_reg[2][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(10),
      Q => \reg_file_reg[2]\(10),
      R => SR(0)
    );
\reg_file_reg[2][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(11),
      Q => \reg_file_reg[2]\(11),
      R => SR(0)
    );
\reg_file_reg[2][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(12),
      Q => \reg_file_reg[2]\(12),
      R => SR(0)
    );
\reg_file_reg[2][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(13),
      Q => \reg_file_reg[2]\(13),
      R => SR(0)
    );
\reg_file_reg[2][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(14),
      Q => \reg_file_reg[2]\(14),
      R => SR(0)
    );
\reg_file_reg[2][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(15),
      Q => \reg_file_reg[2]\(15),
      R => SR(0)
    );
\reg_file_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(1),
      Q => \reg_file_reg[2]\(1),
      R => SR(0)
    );
\reg_file_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(2),
      Q => \reg_file_reg[2]\(2),
      R => SR(0)
    );
\reg_file_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(3),
      Q => \reg_file_reg[2]\(3),
      R => SR(0)
    );
\reg_file_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(4),
      Q => \reg_file_reg[2]\(4),
      R => SR(0)
    );
\reg_file_reg[2][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(5),
      Q => \reg_file_reg[2]\(5),
      R => SR(0)
    );
\reg_file_reg[2][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(6),
      Q => \reg_file_reg[2]\(6),
      R => SR(0)
    );
\reg_file_reg[2][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(7),
      Q => \reg_file_reg[2]\(7),
      R => SR(0)
    );
\reg_file_reg[2][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(8),
      Q => \reg_file_reg[2]\(8),
      R => SR(0)
    );
\reg_file_reg[2][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[2]_6\,
      D => \reg_file_reg[7][15]_0\(9),
      Q => \reg_file_reg[2]\(9),
      R => SR(0)
    );
\reg_file_reg[3][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(0),
      Q => \reg_file_reg[3]\(0),
      R => SR(0)
    );
\reg_file_reg[3][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(10),
      Q => \reg_file_reg[3]\(10),
      R => SR(0)
    );
\reg_file_reg[3][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(11),
      Q => \reg_file_reg[3]\(11),
      R => SR(0)
    );
\reg_file_reg[3][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(12),
      Q => \reg_file_reg[3]\(12),
      R => SR(0)
    );
\reg_file_reg[3][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(13),
      Q => \reg_file_reg[3]\(13),
      R => SR(0)
    );
\reg_file_reg[3][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(14),
      Q => \reg_file_reg[3]\(14),
      R => SR(0)
    );
\reg_file_reg[3][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(15),
      Q => \reg_file_reg[3]\(15),
      R => SR(0)
    );
\reg_file_reg[3][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(1),
      Q => \reg_file_reg[3]\(1),
      R => SR(0)
    );
\reg_file_reg[3][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(2),
      Q => \reg_file_reg[3]\(2),
      R => SR(0)
    );
\reg_file_reg[3][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(3),
      Q => \reg_file_reg[3]\(3),
      R => SR(0)
    );
\reg_file_reg[3][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(4),
      Q => \reg_file_reg[3]\(4),
      R => SR(0)
    );
\reg_file_reg[3][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(5),
      Q => \reg_file_reg[3]\(5),
      R => SR(0)
    );
\reg_file_reg[3][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(6),
      Q => \reg_file_reg[3]\(6),
      R => SR(0)
    );
\reg_file_reg[3][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(7),
      Q => \reg_file_reg[3]\(7),
      R => SR(0)
    );
\reg_file_reg[3][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(8),
      Q => \reg_file_reg[3]\(8),
      R => SR(0)
    );
\reg_file_reg[3][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[3]_2\,
      D => \reg_file_reg[7][15]_0\(9),
      Q => \reg_file_reg[3]\(9),
      R => SR(0)
    );
\reg_file_reg[4][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(0),
      Q => \reg_file_reg[4]\(0),
      R => SR(0)
    );
\reg_file_reg[4][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(10),
      Q => \reg_file_reg[4]\(10),
      R => SR(0)
    );
\reg_file_reg[4][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(11),
      Q => \reg_file_reg[4]\(11),
      R => SR(0)
    );
\reg_file_reg[4][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(12),
      Q => \reg_file_reg[4]\(12),
      R => SR(0)
    );
\reg_file_reg[4][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(13),
      Q => \reg_file_reg[4]\(13),
      R => SR(0)
    );
\reg_file_reg[4][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(14),
      Q => \reg_file_reg[4]\(14),
      R => SR(0)
    );
\reg_file_reg[4][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(15),
      Q => \reg_file_reg[4]\(15),
      R => SR(0)
    );
\reg_file_reg[4][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(1),
      Q => \reg_file_reg[4]\(1),
      R => SR(0)
    );
\reg_file_reg[4][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(2),
      Q => \reg_file_reg[4]\(2),
      R => SR(0)
    );
\reg_file_reg[4][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(3),
      Q => \reg_file_reg[4]\(3),
      R => SR(0)
    );
\reg_file_reg[4][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(4),
      Q => \reg_file_reg[4]\(4),
      R => SR(0)
    );
\reg_file_reg[4][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(5),
      Q => \reg_file_reg[4]\(5),
      R => SR(0)
    );
\reg_file_reg[4][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(6),
      Q => \reg_file_reg[4]\(6),
      R => SR(0)
    );
\reg_file_reg[4][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(7),
      Q => \reg_file_reg[4]\(7),
      R => SR(0)
    );
\reg_file_reg[4][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(8),
      Q => \reg_file_reg[4]\(8),
      R => SR(0)
    );
\reg_file_reg[4][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[4]_5\,
      D => \reg_file_reg[7][15]_0\(9),
      Q => \reg_file_reg[4]\(9),
      R => SR(0)
    );
\reg_file_reg[5][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(0),
      Q => \reg_file_reg[5]\(0),
      R => SR(0)
    );
\reg_file_reg[5][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(10),
      Q => \reg_file_reg[5]\(10),
      R => SR(0)
    );
\reg_file_reg[5][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(11),
      Q => \reg_file_reg[5]\(11),
      R => SR(0)
    );
\reg_file_reg[5][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(12),
      Q => \reg_file_reg[5]\(12),
      R => SR(0)
    );
\reg_file_reg[5][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(13),
      Q => \reg_file_reg[5]\(13),
      R => SR(0)
    );
\reg_file_reg[5][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(14),
      Q => \reg_file_reg[5]\(14),
      R => SR(0)
    );
\reg_file_reg[5][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(15),
      Q => \reg_file_reg[5]\(15),
      R => SR(0)
    );
\reg_file_reg[5][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(1),
      Q => \reg_file_reg[5]\(1),
      R => SR(0)
    );
\reg_file_reg[5][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(2),
      Q => \reg_file_reg[5]\(2),
      R => SR(0)
    );
\reg_file_reg[5][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(3),
      Q => \reg_file_reg[5]\(3),
      R => SR(0)
    );
\reg_file_reg[5][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(4),
      Q => \reg_file_reg[5]\(4),
      R => SR(0)
    );
\reg_file_reg[5][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(5),
      Q => \reg_file_reg[5]\(5),
      R => SR(0)
    );
\reg_file_reg[5][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(6),
      Q => \reg_file_reg[5]\(6),
      R => SR(0)
    );
\reg_file_reg[5][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(7),
      Q => \reg_file_reg[5]\(7),
      R => SR(0)
    );
\reg_file_reg[5][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(8),
      Q => \reg_file_reg[5]\(8),
      R => SR(0)
    );
\reg_file_reg[5][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[5]_1\,
      D => \reg_file_reg[7][15]_0\(9),
      Q => \reg_file_reg[5]\(9),
      R => SR(0)
    );
\reg_file_reg[6][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(0),
      Q => \reg_file_reg[6]\(0),
      R => SR(0)
    );
\reg_file_reg[6][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(10),
      Q => \reg_file_reg[6]\(10),
      R => SR(0)
    );
\reg_file_reg[6][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(11),
      Q => \reg_file_reg[6]\(11),
      R => SR(0)
    );
\reg_file_reg[6][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(12),
      Q => \reg_file_reg[6]\(12),
      R => SR(0)
    );
\reg_file_reg[6][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(13),
      Q => \reg_file_reg[6]\(13),
      R => SR(0)
    );
\reg_file_reg[6][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(14),
      Q => \reg_file_reg[6]\(14),
      R => SR(0)
    );
\reg_file_reg[6][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(15),
      Q => \reg_file_reg[6]\(15),
      R => SR(0)
    );
\reg_file_reg[6][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(1),
      Q => \reg_file_reg[6]\(1),
      R => SR(0)
    );
\reg_file_reg[6][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(2),
      Q => \reg_file_reg[6]\(2),
      R => SR(0)
    );
\reg_file_reg[6][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(3),
      Q => \reg_file_reg[6]\(3),
      R => SR(0)
    );
\reg_file_reg[6][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(4),
      Q => \reg_file_reg[6]\(4),
      R => SR(0)
    );
\reg_file_reg[6][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(5),
      Q => \reg_file_reg[6]\(5),
      R => SR(0)
    );
\reg_file_reg[6][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(6),
      Q => \reg_file_reg[6]\(6),
      R => SR(0)
    );
\reg_file_reg[6][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(7),
      Q => \reg_file_reg[6]\(7),
      R => SR(0)
    );
\reg_file_reg[6][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(8),
      Q => \reg_file_reg[6]\(8),
      R => SR(0)
    );
\reg_file_reg[6][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[6]_4\,
      D => \reg_file_reg[7][15]_0\(9),
      Q => \reg_file_reg[6]\(9),
      R => SR(0)
    );
\reg_file_reg[7][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(0),
      Q => \reg_file_reg[7]\(0),
      R => SR(0)
    );
\reg_file_reg[7][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(10),
      Q => \reg_file_reg[7]\(10),
      R => SR(0)
    );
\reg_file_reg[7][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(11),
      Q => \reg_file_reg[7]\(11),
      R => SR(0)
    );
\reg_file_reg[7][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(12),
      Q => \reg_file_reg[7]\(12),
      R => SR(0)
    );
\reg_file_reg[7][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(13),
      Q => \reg_file_reg[7]\(13),
      R => SR(0)
    );
\reg_file_reg[7][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(14),
      Q => \reg_file_reg[7]\(14),
      R => SR(0)
    );
\reg_file_reg[7][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(15),
      Q => \reg_file_reg[7]\(15),
      R => SR(0)
    );
\reg_file_reg[7][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(1),
      Q => \reg_file_reg[7]\(1),
      R => SR(0)
    );
\reg_file_reg[7][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(2),
      Q => \reg_file_reg[7]\(2),
      R => SR(0)
    );
\reg_file_reg[7][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(3),
      Q => \reg_file_reg[7]\(3),
      R => SR(0)
    );
\reg_file_reg[7][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(4),
      Q => \reg_file_reg[7]\(4),
      R => SR(0)
    );
\reg_file_reg[7][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(5),
      Q => \reg_file_reg[7]\(5),
      R => SR(0)
    );
\reg_file_reg[7][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(6),
      Q => \reg_file_reg[7]\(6),
      R => SR(0)
    );
\reg_file_reg[7][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(7),
      Q => \reg_file_reg[7]\(7),
      R => SR(0)
    );
\reg_file_reg[7][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(8),
      Q => \reg_file_reg[7]\(8),
      R => SR(0)
    );
\reg_file_reg[7][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \reg_file[7]_0\,
      D => \reg_file_reg[7][15]_0\(9),
      Q => \reg_file_reg[7]\(9),
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ALU is
  port (
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \EX_MEM_latch_reg[result][15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \EX_MEM_latch_reg[result][15]_0\ : in STD_LOGIC_VECTOR ( 6 downto 0 );
    in_port_IBUF : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end ALU;

architecture STRUCTURE of ALU is
begin
TwosCompliment_instance: entity work.TwosComplement
     port map (
      D(15 downto 0) => D(15 downto 0),
      \EX_MEM_latch_reg[result][15]\(15 downto 0) => \EX_MEM_latch_reg[result][15]\(15 downto 0),
      \EX_MEM_latch_reg[result][15]_0\(6 downto 0) => \EX_MEM_latch_reg[result][15]_0\(6 downto 0),
      Q(6 downto 0) => Q(6 downto 0),
      in_port_IBUF(15 downto 0) => in_port_IBUF(15 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity The_Marmot is
  port (
    in_port : in STD_LOGIC_VECTOR ( 15 downto 0 );
    M_clock : in STD_LOGIC;
    Reset_and_Execute : in STD_LOGIC;
    Reset_and_Load : in STD_LOGIC;
    out_port : out STD_LOGIC_VECTOR ( 15 downto 0 );
    INS_port : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of The_Marmot : entity is true;
end The_Marmot;

architecture STRUCTURE of The_Marmot is
  signal \EX_MEM_latch_reg[instr]\ : STD_LOGIC_VECTOR ( 15 downto 6 );
  signal \EX_MEM_latch_reg[result]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \ID_EX_latch_reg[instr]\ : STD_LOGIC_VECTOR ( 15 downto 6 );
  signal \IF_ID_latch[instr][15]_i_1_n_0\ : STD_LOGIC;
  signal \IF_ID_latch_reg[instr_n_0_][0]\ : STD_LOGIC;
  signal \IF_ID_latch_reg[instr_n_0_][1]\ : STD_LOGIC;
  signal \IF_ID_latch_reg[instr_n_0_][2]\ : STD_LOGIC;
  signal INS_port_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \MEM_WB_latch_reg[instr_n_0_][10]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[instr_n_0_][11]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[instr_n_0_][12]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[instr_n_0_][13]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[instr_n_0_][14]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[instr_n_0_][15]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[instr_n_0_][6]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[instr_n_0_][7]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[instr_n_0_][8]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[instr_n_0_][9]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][0]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][10]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][11]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][12]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][13]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][14]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][15]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][1]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][2]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][3]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][4]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][5]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][6]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][7]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][8]\ : STD_LOGIC;
  signal \MEM_WB_latch_reg[result_n_0_][9]\ : STD_LOGIC;
  signal M_clock_IBUF : STD_LOGIC;
  signal M_clock_IBUF_BUFG : STD_LOGIC;
  signal Registers_Latches_instance_n_0 : STD_LOGIC;
  signal Registers_Latches_instance_n_1 : STD_LOGIC;
  signal Registers_Latches_instance_n_10 : STD_LOGIC;
  signal Registers_Latches_instance_n_11 : STD_LOGIC;
  signal Registers_Latches_instance_n_12 : STD_LOGIC;
  signal Registers_Latches_instance_n_13 : STD_LOGIC;
  signal Registers_Latches_instance_n_14 : STD_LOGIC;
  signal Registers_Latches_instance_n_15 : STD_LOGIC;
  signal Registers_Latches_instance_n_16 : STD_LOGIC;
  signal Registers_Latches_instance_n_2 : STD_LOGIC;
  signal Registers_Latches_instance_n_3 : STD_LOGIC;
  signal Registers_Latches_instance_n_4 : STD_LOGIC;
  signal Registers_Latches_instance_n_5 : STD_LOGIC;
  signal Registers_Latches_instance_n_6 : STD_LOGIC;
  signal Registers_Latches_instance_n_7 : STD_LOGIC;
  signal Registers_Latches_instance_n_8 : STD_LOGIC;
  signal Registers_Latches_instance_n_9 : STD_LOGIC;
  signal Reset_and_Execute_IBUF : STD_LOGIC;
  signal Reset_and_Load_IBUF : STD_LOGIC;
  signal data1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal i_ALU_B : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal in_port_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal out_port_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \out_port_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 6 to 6 );
  signal \p_0_in__0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sel0 : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \out_port_reg[0]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[0]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[10]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[10]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[11]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[11]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[12]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[12]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[13]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[13]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[14]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[14]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[15]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[15]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[1]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[1]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[2]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[2]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[3]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[3]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[4]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[4]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[5]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[5]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[6]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[6]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[7]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[7]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[8]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[8]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \out_port_reg[9]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \out_port_reg[9]\ : label is "VCC:GE GND:CLR";
begin
ALU_instance: entity work.ALU
     port map (
      D(15 downto 0) => p_1_in(15 downto 0),
      \EX_MEM_latch_reg[result][15]\(15 downto 0) => i_ALU_B(15 downto 0),
      \EX_MEM_latch_reg[result][15]_0\(6 downto 0) => \EX_MEM_latch_reg[instr]\(15 downto 9),
      Q(6) => p_0_in(6),
      Q(5 downto 0) => sel0(5 downto 0),
      in_port_IBUF(15 downto 0) => in_port_IBUF(15 downto 0)
    );
\EX_MEM_latch_reg[instr][10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \ID_EX_latch_reg[instr]\(10),
      Q => \EX_MEM_latch_reg[instr]\(10)
    );
\EX_MEM_latch_reg[instr][11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \ID_EX_latch_reg[instr]\(11),
      Q => \EX_MEM_latch_reg[instr]\(11)
    );
\EX_MEM_latch_reg[instr][12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \ID_EX_latch_reg[instr]\(12),
      Q => \EX_MEM_latch_reg[instr]\(12)
    );
\EX_MEM_latch_reg[instr][13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \ID_EX_latch_reg[instr]\(13),
      Q => \EX_MEM_latch_reg[instr]\(13)
    );
\EX_MEM_latch_reg[instr][14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \ID_EX_latch_reg[instr]\(14),
      Q => \EX_MEM_latch_reg[instr]\(14)
    );
\EX_MEM_latch_reg[instr][15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \ID_EX_latch_reg[instr]\(15),
      Q => \EX_MEM_latch_reg[instr]\(15)
    );
\EX_MEM_latch_reg[instr][6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \ID_EX_latch_reg[instr]\(6),
      Q => \EX_MEM_latch_reg[instr]\(6)
    );
\EX_MEM_latch_reg[instr][7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \ID_EX_latch_reg[instr]\(7),
      Q => \EX_MEM_latch_reg[instr]\(7)
    );
\EX_MEM_latch_reg[instr][8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \ID_EX_latch_reg[instr]\(8),
      Q => \EX_MEM_latch_reg[instr]\(8)
    );
\EX_MEM_latch_reg[instr][9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \ID_EX_latch_reg[instr]\(9),
      Q => \EX_MEM_latch_reg[instr]\(9)
    );
\EX_MEM_latch_reg[result][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(0),
      Q => \EX_MEM_latch_reg[result]\(0)
    );
\EX_MEM_latch_reg[result][10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(10),
      Q => \EX_MEM_latch_reg[result]\(10)
    );
\EX_MEM_latch_reg[result][11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(11),
      Q => \EX_MEM_latch_reg[result]\(11)
    );
\EX_MEM_latch_reg[result][12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(12),
      Q => \EX_MEM_latch_reg[result]\(12)
    );
\EX_MEM_latch_reg[result][13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(13),
      Q => \EX_MEM_latch_reg[result]\(13)
    );
\EX_MEM_latch_reg[result][14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(14),
      Q => \EX_MEM_latch_reg[result]\(14)
    );
\EX_MEM_latch_reg[result][15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(15),
      Q => \EX_MEM_latch_reg[result]\(15)
    );
\EX_MEM_latch_reg[result][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(1),
      Q => \EX_MEM_latch_reg[result]\(1)
    );
\EX_MEM_latch_reg[result][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(2),
      Q => \EX_MEM_latch_reg[result]\(2)
    );
\EX_MEM_latch_reg[result][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(3),
      Q => \EX_MEM_latch_reg[result]\(3)
    );
\EX_MEM_latch_reg[result][4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(4),
      Q => \EX_MEM_latch_reg[result]\(4)
    );
\EX_MEM_latch_reg[result][5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(5),
      Q => \EX_MEM_latch_reg[result]\(5)
    );
\EX_MEM_latch_reg[result][6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(6),
      Q => \EX_MEM_latch_reg[result]\(6)
    );
\EX_MEM_latch_reg[result][7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(7),
      Q => \EX_MEM_latch_reg[result]\(7)
    );
\EX_MEM_latch_reg[result][8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(8),
      Q => \EX_MEM_latch_reg[result]\(8)
    );
\EX_MEM_latch_reg[result][9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_1_in(9),
      Q => \EX_MEM_latch_reg[result]\(9)
    );
\ID_EX_latch_reg[instr][10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => sel0(1),
      Q => \ID_EX_latch_reg[instr]\(10)
    );
\ID_EX_latch_reg[instr][11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => sel0(2),
      Q => \ID_EX_latch_reg[instr]\(11)
    );
\ID_EX_latch_reg[instr][12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => sel0(3),
      Q => \ID_EX_latch_reg[instr]\(12)
    );
\ID_EX_latch_reg[instr][13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => sel0(4),
      Q => \ID_EX_latch_reg[instr]\(13)
    );
\ID_EX_latch_reg[instr][14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => sel0(5),
      Q => \ID_EX_latch_reg[instr]\(14)
    );
\ID_EX_latch_reg[instr][15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => p_0_in(6),
      Q => \ID_EX_latch_reg[instr]\(15)
    );
\ID_EX_latch_reg[instr][6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => data1(0),
      Q => \ID_EX_latch_reg[instr]\(6)
    );
\ID_EX_latch_reg[instr][7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => data1(1),
      Q => \ID_EX_latch_reg[instr]\(7)
    );
\ID_EX_latch_reg[instr][8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => data1(2),
      Q => \ID_EX_latch_reg[instr]\(8)
    );
\ID_EX_latch_reg[instr][9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => sel0(0),
      Q => \ID_EX_latch_reg[instr]\(9)
    );
\IF_ID_latch[instr][15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => Reset_and_Execute_IBUF,
      I1 => Reset_and_Load_IBUF,
      O => \IF_ID_latch[instr][15]_i_1_n_0\
    );
\IF_ID_latch_reg[instr][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(0),
      Q => \IF_ID_latch_reg[instr_n_0_][0]\
    );
\IF_ID_latch_reg[instr][10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(10),
      Q => sel0(1)
    );
\IF_ID_latch_reg[instr][11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(11),
      Q => sel0(2)
    );
\IF_ID_latch_reg[instr][12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(12),
      Q => sel0(3)
    );
\IF_ID_latch_reg[instr][13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(13),
      Q => sel0(4)
    );
\IF_ID_latch_reg[instr][14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(14),
      Q => sel0(5)
    );
\IF_ID_latch_reg[instr][15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(15),
      Q => p_0_in(6)
    );
\IF_ID_latch_reg[instr][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(1),
      Q => \IF_ID_latch_reg[instr_n_0_][1]\
    );
\IF_ID_latch_reg[instr][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(2),
      Q => \IF_ID_latch_reg[instr_n_0_][2]\
    );
\IF_ID_latch_reg[instr][6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(6),
      Q => data1(0)
    );
\IF_ID_latch_reg[instr][7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(7),
      Q => data1(1)
    );
\IF_ID_latch_reg[instr][8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(8),
      Q => data1(2)
    );
\IF_ID_latch_reg[instr][9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => INS_port_IBUF(9),
      Q => sel0(0)
    );
\INS_port_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(0),
      O => INS_port_IBUF(0)
    );
\INS_port_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(10),
      O => INS_port_IBUF(10)
    );
\INS_port_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(11),
      O => INS_port_IBUF(11)
    );
\INS_port_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(12),
      O => INS_port_IBUF(12)
    );
\INS_port_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(13),
      O => INS_port_IBUF(13)
    );
\INS_port_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(14),
      O => INS_port_IBUF(14)
    );
\INS_port_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(15),
      O => INS_port_IBUF(15)
    );
\INS_port_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(1),
      O => INS_port_IBUF(1)
    );
\INS_port_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(2),
      O => INS_port_IBUF(2)
    );
\INS_port_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(6),
      O => INS_port_IBUF(6)
    );
\INS_port_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(7),
      O => INS_port_IBUF(7)
    );
\INS_port_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(8),
      O => INS_port_IBUF(8)
    );
\INS_port_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => INS_port(9),
      O => INS_port_IBUF(9)
    );
\MEM_WB_latch[instr][15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Reset_and_Load_IBUF,
      I1 => Reset_and_Execute_IBUF,
      O => \p_0_in__0\
    );
\MEM_WB_latch_reg[instr][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => \EX_MEM_latch_reg[instr]\(10),
      Q => \MEM_WB_latch_reg[instr_n_0_][10]\,
      R => '0'
    );
\MEM_WB_latch_reg[instr][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => \EX_MEM_latch_reg[instr]\(11),
      Q => \MEM_WB_latch_reg[instr_n_0_][11]\,
      R => '0'
    );
\MEM_WB_latch_reg[instr][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => \EX_MEM_latch_reg[instr]\(12),
      Q => \MEM_WB_latch_reg[instr_n_0_][12]\,
      R => '0'
    );
\MEM_WB_latch_reg[instr][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => \EX_MEM_latch_reg[instr]\(13),
      Q => \MEM_WB_latch_reg[instr_n_0_][13]\,
      R => '0'
    );
\MEM_WB_latch_reg[instr][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => \EX_MEM_latch_reg[instr]\(14),
      Q => \MEM_WB_latch_reg[instr_n_0_][14]\,
      R => '0'
    );
\MEM_WB_latch_reg[instr][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => \EX_MEM_latch_reg[instr]\(15),
      Q => \MEM_WB_latch_reg[instr_n_0_][15]\,
      R => '0'
    );
\MEM_WB_latch_reg[instr][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => \EX_MEM_latch_reg[instr]\(6),
      Q => \MEM_WB_latch_reg[instr_n_0_][6]\,
      R => '0'
    );
\MEM_WB_latch_reg[instr][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => \EX_MEM_latch_reg[instr]\(7),
      Q => \MEM_WB_latch_reg[instr_n_0_][7]\,
      R => '0'
    );
\MEM_WB_latch_reg[instr][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => \EX_MEM_latch_reg[instr]\(8),
      Q => \MEM_WB_latch_reg[instr_n_0_][8]\,
      R => '0'
    );
\MEM_WB_latch_reg[instr][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => \EX_MEM_latch_reg[instr]\(9),
      Q => \MEM_WB_latch_reg[instr_n_0_][9]\,
      R => '0'
    );
\MEM_WB_latch_reg[result][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(0),
      Q => \MEM_WB_latch_reg[result_n_0_][0]\
    );
\MEM_WB_latch_reg[result][10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(10),
      Q => \MEM_WB_latch_reg[result_n_0_][10]\
    );
\MEM_WB_latch_reg[result][11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(11),
      Q => \MEM_WB_latch_reg[result_n_0_][11]\
    );
\MEM_WB_latch_reg[result][12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(12),
      Q => \MEM_WB_latch_reg[result_n_0_][12]\
    );
\MEM_WB_latch_reg[result][13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(13),
      Q => \MEM_WB_latch_reg[result_n_0_][13]\
    );
\MEM_WB_latch_reg[result][14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(14),
      Q => \MEM_WB_latch_reg[result_n_0_][14]\
    );
\MEM_WB_latch_reg[result][15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(15),
      Q => \MEM_WB_latch_reg[result_n_0_][15]\
    );
\MEM_WB_latch_reg[result][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(1),
      Q => \MEM_WB_latch_reg[result_n_0_][1]\
    );
\MEM_WB_latch_reg[result][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(2),
      Q => \MEM_WB_latch_reg[result_n_0_][2]\
    );
\MEM_WB_latch_reg[result][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(3),
      Q => \MEM_WB_latch_reg[result_n_0_][3]\
    );
\MEM_WB_latch_reg[result][4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(4),
      Q => \MEM_WB_latch_reg[result_n_0_][4]\
    );
\MEM_WB_latch_reg[result][5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(5),
      Q => \MEM_WB_latch_reg[result_n_0_][5]\
    );
\MEM_WB_latch_reg[result][6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(6),
      Q => \MEM_WB_latch_reg[result_n_0_][6]\
    );
\MEM_WB_latch_reg[result][7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(7),
      Q => \MEM_WB_latch_reg[result_n_0_][7]\
    );
\MEM_WB_latch_reg[result][8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(8),
      Q => \MEM_WB_latch_reg[result_n_0_][8]\
    );
\MEM_WB_latch_reg[result][9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => '1',
      CLR => \IF_ID_latch[instr][15]_i_1_n_0\,
      D => \EX_MEM_latch_reg[result]\(9),
      Q => \MEM_WB_latch_reg[result_n_0_][9]\
    );
M_clock_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => M_clock_IBUF,
      O => M_clock_IBUF_BUFG
    );
M_clock_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => M_clock,
      O => M_clock_IBUF
    );
Registers_Latches_instance: entity work.register_file
     port map (
      D(15) => Registers_Latches_instance_n_1,
      D(14) => Registers_Latches_instance_n_2,
      D(13) => Registers_Latches_instance_n_3,
      D(12) => Registers_Latches_instance_n_4,
      D(11) => Registers_Latches_instance_n_5,
      D(10) => Registers_Latches_instance_n_6,
      D(9) => Registers_Latches_instance_n_7,
      D(8) => Registers_Latches_instance_n_8,
      D(7) => Registers_Latches_instance_n_9,
      D(6) => Registers_Latches_instance_n_10,
      D(5) => Registers_Latches_instance_n_11,
      D(4) => Registers_Latches_instance_n_12,
      D(3) => Registers_Latches_instance_n_13,
      D(2) => Registers_Latches_instance_n_14,
      D(1) => Registers_Latches_instance_n_15,
      D(0) => Registers_Latches_instance_n_16,
      \MEM_WB_latch_reg[instr][13]\ => Registers_Latches_instance_n_0,
      M_clock_IBUF_BUFG => M_clock_IBUF_BUFG,
      Q(9) => \MEM_WB_latch_reg[instr_n_0_][15]\,
      Q(8) => \MEM_WB_latch_reg[instr_n_0_][14]\,
      Q(7) => \MEM_WB_latch_reg[instr_n_0_][13]\,
      Q(6) => \MEM_WB_latch_reg[instr_n_0_][12]\,
      Q(5) => \MEM_WB_latch_reg[instr_n_0_][11]\,
      Q(4) => \MEM_WB_latch_reg[instr_n_0_][10]\,
      Q(3) => \MEM_WB_latch_reg[instr_n_0_][9]\,
      Q(2) => \MEM_WB_latch_reg[instr_n_0_][8]\,
      Q(1) => \MEM_WB_latch_reg[instr_n_0_][7]\,
      Q(0) => \MEM_WB_latch_reg[instr_n_0_][6]\,
      SR(0) => Reset_and_Execute_IBUF,
      \i_ALU_B_reg[0]\(2) => \IF_ID_latch_reg[instr_n_0_][2]\,
      \i_ALU_B_reg[0]\(1) => \IF_ID_latch_reg[instr_n_0_][1]\,
      \i_ALU_B_reg[0]\(0) => \IF_ID_latch_reg[instr_n_0_][0]\,
      \reg_file_reg[7][15]_0\(15) => \MEM_WB_latch_reg[result_n_0_][15]\,
      \reg_file_reg[7][15]_0\(14) => \MEM_WB_latch_reg[result_n_0_][14]\,
      \reg_file_reg[7][15]_0\(13) => \MEM_WB_latch_reg[result_n_0_][13]\,
      \reg_file_reg[7][15]_0\(12) => \MEM_WB_latch_reg[result_n_0_][12]\,
      \reg_file_reg[7][15]_0\(11) => \MEM_WB_latch_reg[result_n_0_][11]\,
      \reg_file_reg[7][15]_0\(10) => \MEM_WB_latch_reg[result_n_0_][10]\,
      \reg_file_reg[7][15]_0\(9) => \MEM_WB_latch_reg[result_n_0_][9]\,
      \reg_file_reg[7][15]_0\(8) => \MEM_WB_latch_reg[result_n_0_][8]\,
      \reg_file_reg[7][15]_0\(7) => \MEM_WB_latch_reg[result_n_0_][7]\,
      \reg_file_reg[7][15]_0\(6) => \MEM_WB_latch_reg[result_n_0_][6]\,
      \reg_file_reg[7][15]_0\(5) => \MEM_WB_latch_reg[result_n_0_][5]\,
      \reg_file_reg[7][15]_0\(4) => \MEM_WB_latch_reg[result_n_0_][4]\,
      \reg_file_reg[7][15]_0\(3) => \MEM_WB_latch_reg[result_n_0_][3]\,
      \reg_file_reg[7][15]_0\(2) => \MEM_WB_latch_reg[result_n_0_][2]\,
      \reg_file_reg[7][15]_0\(1) => \MEM_WB_latch_reg[result_n_0_][1]\,
      \reg_file_reg[7][15]_0\(0) => \MEM_WB_latch_reg[result_n_0_][0]\
    );
Reset_and_Execute_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Reset_and_Execute,
      O => Reset_and_Execute_IBUF
    );
Reset_and_Load_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => Reset_and_Load,
      O => Reset_and_Load_IBUF
    );
\i_ALU_B_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_16,
      Q => i_ALU_B(0),
      R => '0'
    );
\i_ALU_B_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_6,
      Q => i_ALU_B(10),
      R => '0'
    );
\i_ALU_B_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_5,
      Q => i_ALU_B(11),
      R => '0'
    );
\i_ALU_B_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_4,
      Q => i_ALU_B(12),
      R => '0'
    );
\i_ALU_B_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_3,
      Q => i_ALU_B(13),
      R => '0'
    );
\i_ALU_B_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_2,
      Q => i_ALU_B(14),
      R => '0'
    );
\i_ALU_B_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_1,
      Q => i_ALU_B(15),
      R => '0'
    );
\i_ALU_B_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_15,
      Q => i_ALU_B(1),
      R => '0'
    );
\i_ALU_B_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_14,
      Q => i_ALU_B(2),
      R => '0'
    );
\i_ALU_B_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_13,
      Q => i_ALU_B(3),
      R => '0'
    );
\i_ALU_B_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_12,
      Q => i_ALU_B(4),
      R => '0'
    );
\i_ALU_B_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_11,
      Q => i_ALU_B(5),
      R => '0'
    );
\i_ALU_B_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_10,
      Q => i_ALU_B(6),
      R => '0'
    );
\i_ALU_B_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_9,
      Q => i_ALU_B(7),
      R => '0'
    );
\i_ALU_B_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_8,
      Q => i_ALU_B(8),
      R => '0'
    );
\i_ALU_B_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => M_clock_IBUF_BUFG,
      CE => \p_0_in__0\,
      D => Registers_Latches_instance_n_7,
      Q => i_ALU_B(9),
      R => '0'
    );
\in_port_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(0),
      O => in_port_IBUF(0)
    );
\in_port_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(10),
      O => in_port_IBUF(10)
    );
\in_port_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(11),
      O => in_port_IBUF(11)
    );
\in_port_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(12),
      O => in_port_IBUF(12)
    );
\in_port_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(13),
      O => in_port_IBUF(13)
    );
\in_port_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(14),
      O => in_port_IBUF(14)
    );
\in_port_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(15),
      O => in_port_IBUF(15)
    );
\in_port_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(1),
      O => in_port_IBUF(1)
    );
\in_port_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(2),
      O => in_port_IBUF(2)
    );
\in_port_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(3),
      O => in_port_IBUF(3)
    );
\in_port_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(4),
      O => in_port_IBUF(4)
    );
\in_port_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(5),
      O => in_port_IBUF(5)
    );
\in_port_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(6),
      O => in_port_IBUF(6)
    );
\in_port_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(7),
      O => in_port_IBUF(7)
    );
\in_port_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(8),
      O => in_port_IBUF(8)
    );
\in_port_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => in_port(9),
      O => in_port_IBUF(9)
    );
\out_port_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(0),
      O => out_port(0)
    );
\out_port_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(10),
      O => out_port(10)
    );
\out_port_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(11),
      O => out_port(11)
    );
\out_port_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(12),
      O => out_port(12)
    );
\out_port_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(13),
      O => out_port(13)
    );
\out_port_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(14),
      O => out_port(14)
    );
\out_port_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(15),
      O => out_port(15)
    );
\out_port_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(1),
      O => out_port(1)
    );
\out_port_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(2),
      O => out_port(2)
    );
\out_port_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(3),
      O => out_port(3)
    );
\out_port_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(4),
      O => out_port(4)
    );
\out_port_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(5),
      O => out_port(5)
    );
\out_port_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(6),
      O => out_port(6)
    );
\out_port_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(7),
      O => out_port(7)
    );
\out_port_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(8),
      O => out_port(8)
    );
\out_port_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => out_port_OBUF(9),
      O => out_port(9)
    );
\out_port_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][0]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(0)
    );
\out_port_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][10]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(10)
    );
\out_port_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][11]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(11)
    );
\out_port_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][12]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(12)
    );
\out_port_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][13]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(13)
    );
\out_port_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][14]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(14)
    );
\out_port_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][15]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(15)
    );
\out_port_reg[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \MEM_WB_latch_reg[instr_n_0_][14]\,
      I1 => \MEM_WB_latch_reg[instr_n_0_][11]\,
      I2 => \MEM_WB_latch_reg[instr_n_0_][9]\,
      I3 => \MEM_WB_latch_reg[instr_n_0_][10]\,
      I4 => Registers_Latches_instance_n_0,
      O => \out_port_reg[15]_i_1_n_0\
    );
\out_port_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][1]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(1)
    );
\out_port_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][2]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(2)
    );
\out_port_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][3]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(3)
    );
\out_port_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][4]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(4)
    );
\out_port_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][5]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(5)
    );
\out_port_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][6]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(6)
    );
\out_port_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][7]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(7)
    );
\out_port_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][8]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(8)
    );
\out_port_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \MEM_WB_latch_reg[result_n_0_][9]\,
      G => \out_port_reg[15]_i_1_n_0\,
      GE => '1',
      Q => out_port_OBUF(9)
    );
end STRUCTURE;
