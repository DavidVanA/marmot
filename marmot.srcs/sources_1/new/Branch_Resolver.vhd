library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Marmot_Config.all;

entity Branch_Resolver is
  Port ( 
  	Clk			  : IN  std_logic;
    Status        : IN  Status_Flags_rec;
    Opcode        : IN  std_logic_vector(op_code); 
    PCSrc_Port    : OUT std_logic  
  );
end Branch_Resolver;

architecture Behavioral of Branch_Resolver is

begin

	BR_RES: process(clk)

		case Opcode is
			when op_brr 	=> PCSrc_Port <= '1';
			when op_br  	=> PCSrc_Port <= '1';
			when op_br_sub	=> PCSrc_Port <= '1';
			when op_return	=> PCSrc_Port <= '1';
			when op_brr_n	=> PCSrc_Port <= Status.neg;
			when op_br_n	=> PCSrc_Port <= Status.neg;
			when op_brr_z	=> PCSrc_Port <= Status.zero;
			when op_br_z	=> PCSrc_Port <= Status.zero;
			when op_brr_ov	=> PCSrc_Port <= Status.overflow;
			when op_br_ov	=> PCSrc_Port <= Status.overflow;
			when others		=> PCSrc_Port <= '0';
		end case;

	end process BR_RES;
    
end Behavioral;
