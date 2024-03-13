----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2024 05:03:13 PM
-- Design Name: 
-- Module Name: PC - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Marmot_Config.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
  Port ( 
    M_clock                 :   IN std_logic;
    Reset_and_Execute       :   IN std_logic;
    Reset_and_Load          :   IN std_logic;
    
    PCsrc                   :   IN std_logic;
    branch                  :   IN std_logic;
    FLAG_Z, FLAG_N, FLAG_OV :   IN std_logic
    
  );
end PC;

architecture Behavioral of PC is

    signal PC           : std_logic_vector(instr_width);
    signal NPC          : std_logic_vector(instr_width);
    signal branchAddr   : std_logic_vector(instr_width);
--    signal PCsrc        : std_logic;
    
    
begin
    PC_path : process(M_clock, Reset_and_Execute, Reset_and_Load)
        begin
            if Reset_and_Execute = '1' or Reset_and_Load = '1' then
                PC <= x"0000";
            elsif rising_edge(M_clock) then
                if PCsrc = '0' then
                    PC <= NPC;
                else
                    PC <= branchAddr;
                end if;
            end if;
        end process PC_path;

    NPC     <= std_logic_vector(unsigned(PC) + 4);
    PCsrc   <= branch AND 
    
end Behavioral;
