
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.Marmot_Config.all;

entity register_file is
port(
    rst                : in    std_logic; 
    clk                : in    std_logic;
    --read signals
    Reg_Idx_1_Select   : in    std_logic_vector(reg_idx_width); 
    Reg_Idx_2_Select   : in    std_logic_vector(reg_idx_width); 
    rd_data1           : out   std_logic_vector(reg_width); 
    rd_data2           : out   std_logic_vector(reg_width);
    --write signals
    wr_index           : in    std_logic_vector(reg_idx_width); 
    wr_data            : in    std_logic_vector(reg_width); 
    wr_enable          : in    std_logic;
    -- regs                   
	reg_0		       : out	std_logic_vector(reg_width);
	reg_1		       : out	std_logic_vector(reg_width);
	reg_2		       : out	std_logic_vector(reg_width);
	reg_3		       : out	std_logic_vector(reg_width);
	reg_4		       : out	std_logic_vector(reg_width);
	reg_5		       : out	std_logic_vector(reg_width);
	reg_6		       : out	std_logic_vector(reg_width);
	reg_7		       : out	std_logic_vector(reg_width)
);

end register_file;

architecture behavioural of register_file is

type reg_array is array (integer range 0 to 7) of std_logic_vector(reg_width);
--internals signals
signal reg_file : reg_array; begin
--write operation 
process(clk)
begin
   if(clk='1' and clk'event) then if(rst='1') then
      for i in 0 to 7 loop
         reg_file(i)<= (others => '0'); 
      end loop;
   elsif(wr_enable = '1') then
      case wr_index(2 downto 0) is
      when "000" => reg_file(0) <= wr_data;
      when "001" => reg_file(1) <= wr_data;
      when "010" => reg_file(2) <= wr_data;
      when "011" => reg_file(3) <= wr_data;
      when "100" => reg_file(4) <= wr_data;
      when "101" => reg_file(5) <= wr_data;
      when "110" => reg_file(6) <= wr_data;
      when "111" => reg_file(7) <= wr_data;
      
      --fill this part
      
      when others => NULL; end case;
    end if; 
    end if;
end process;

--read operation
    rd_data1 <=	
        reg_file(0) when(Reg_Idx_1_Select="000") else
        reg_file(1) when(Reg_Idx_1_Select="001") else
        reg_file(2) when(Reg_Idx_1_Select="010") else
        reg_file(3) when(Reg_Idx_1_Select="011") else
        reg_file(4) when(Reg_Idx_1_Select="100") else
        reg_file(5) when(Reg_Idx_1_Select="101") else
        reg_file(6) when(Reg_Idx_1_Select="110") else 
        reg_file(7);
    
    rd_data2 <=
        reg_file(0) when(Reg_Idx_2_Select="000") else
        reg_file(1) when(Reg_Idx_2_Select="001") else
        reg_file(2) when(Reg_Idx_2_Select="010") else
        reg_file(3) when(Reg_Idx_2_Select="011") else
        reg_file(4) when(Reg_Idx_2_Select="100") else
        reg_file(5) when(Reg_Idx_2_Select="101") else
        reg_file(6) when(Reg_Idx_2_Select="110") else 
        reg_file(7);

	reg_0 <= reg_file(0);
	reg_1 <= reg_file(1);
	reg_2 <= reg_file(2);
	reg_3 <= reg_file(3);
	reg_4 <= reg_file(4);
	reg_5 <= reg_file(5);
	reg_6 <= reg_file(6);
	reg_7 <= reg_file(7);

end behavioural;
