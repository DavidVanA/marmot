library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Marmot_Config.all;

entity Branch_Resolver is
  Port ( 
    Status        : IN  Status_Flags_rec;
    Opcode        : IN  std_logic_vector(op_code); 
    PCSrc_Port    : OUT std_logic  
  );
end Branch_Resolver;

architecture Behavioral of Branch_Resolver is

    signal PCSrc_res : std_logic;
    
begin

    with Opcode select
         PCSrc_res   <=  '1' when op_brr,
                     '1' when op_br,
                     '1' when op_br_sub,
                    Status.neg  when op_brr_n,
                    Status.neg  when op_br_n,
                    Status.zero when op_brr_z,
                    Status.zero when op_br_z,
                    --Status.overflow when op_br_ov,
                    --Status.overflow when op_brr_ov,
                   '0' when others; 

    PCSrc_Port <= PCSrc_res;
    
end Behavioral;
