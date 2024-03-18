library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Marmot_Config.ALL;

entity Branch_Calculator is
  port (
    signal Instr_Port   : IN  std_logic_vector(instr_width);
    signal NPC          : IN  std_logic_vector(instr_width);
    signal Ra           : IN std_logic_vector(instr_width);
    signal Disp_Selector  : IN  std_logic_vector(instr_type_width);
    signal Br_Addr_Port : OUT std_logic_vector(instr_width)
    );
  end Branch_Calculator;

  architecture Behavioral of Branch_Calculator is

    signal IF_ID_INS    : std_logic_vector(instr_width);
    signal disp_l       : std_logic_vector(disp_l_width);
    signal disp_s       : std_logic_vector(disp_s_width);
    signal sign_ex_l    : std_logic_vector(instr_width);
    signal sign_ex_s    : std_logic_vector(instr_width);
    signal shft_l       : std_logic_vector(instr_width);
    signal shft_s       : std_logic_vector(instr_width);
    signal br_addr      : std_logic_vector(instr_width);
    signal br_addr_s    : std_logic_vector(instr_width);
    signal br_addr_s_int: std_logic_vector(instr_width);
    signal br_addr_l    : std_logic_vector(instr_width);
    
    begin
    
    IF_ID_INS <= Instr_Port;
      
    -- sign extend
    disp_l      <= IF_ID_INS(disp_l_width);
    disp_s      <= IF_ID_INS(disp_s_width);
    sign_ex_l   <= std_logic_vector(resize(signed(disp_l), 16));
    sign_ex_s   <= std_logic_vector(resize(signed(disp_s), 16));

    -- shift left one
    shft_l      <= sign_ex_l(14 downto 0) & '0';
    shft_s      <= sign_ex_s(14 downto 0) & '0';
    
    -- add NPC and shift left
    br_addr_s_int <= std_logic_vector(signed(Ra) + signed(shft_s));
    
    br_addr_l <= std_logic_vector(signed(NPC) + signed(shft_l));
    br_addr_s <= br_addr_s_int(15 downto 1) & '0';
    
    with Disp_Selector select
      br_addr <= br_addr_l when b1_instr,
                 br_addr_s when b2_instr,
                 
                 (others => '0') when others; 

    Br_Addr_Port <= br_addr;
      
    end Behavioral;
