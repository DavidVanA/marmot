library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Marmot_Config.all;

entity Branch_Resolver is
  Port ( 
    Status        : IN  Status_Flags_rec;
    Opcode        : IN  std_logic_vector(op_code); -- Rename to Opcode?
    Branch_Timing : IN  std_logic;
    PCsrc         : OUT std_logic  
  );
end Branch_Resolver;

architecture Behavioral of Branch_Resolver is

    signal is_flag      : std_logic;
    signal is_test      : std_logic_vector(1 downto 0);
    
begin

    with Opcode select
        is_flag <=  '1'         when (op_brr    OR  op_br),
                    Status.neg  when (op_brr_n  OR  op_br_n),
                    Status.zero when (op_brr_z  OR  op_br_z),
-- '1' when (((Instr = op_brr_ov) OR (Instr = op_br_ov))) AND (Status.overflow = '1') AND (Branch_Timing = '1'),
                   '0' when others; 
      
    PCsrc <= Branch_Timing AND is_flag;

end Behavioral;
