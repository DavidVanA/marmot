-------------------------------------------------------------------------------------
-- Author: Joseph Letang V00889620
-- Contact info: joseph_letang@outlook.com
--
-- Acknowledgements: this code is based in part on the given RCA code provided
--	by the ECE Department from the University of Victoria, 
--	ECE441, David Capson, 2022
--
--	As well as the generate example provided by
--	https://www.ics.uci.edu/~jmoorkan/vhdlref/generate.html
--	accessed 2022-06-15
--	
--
-- Module Name: top_level - Adder4bits
--
-- Description: Demonstration of keywords generic and generate
--		applied to an RCA
--
-- Course: ECE 441/ ECE543
-- Department of Electrical and Computer Engineering
-- University of Victoria
--
-- Date: June 15, 2022
--
-------------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use work.Marmot_Config.all;

entity Adder4bits is
generic( bitWidth   : integer := 16);
port (
        A,B  : in std_logic_vector (bitWidth-1 downto 0); -- -1 for zero indx
        S    : out std_logic_vector (bitWidth-1 downto 0);
        Cin  : in std_logic;        
        Cout : out std_logic                 
	);  
end Adder4bits;

architecture RCA of Adder4bits is
    
    --Component and Signal Initialization
    component FullAdder is
        port (
              x    : in STD_LOGIC;
              y    : in STD_LOGIC;
              Cin  : in STD_LOGIC;
              sum  : out STD_LOGIC;
              Cout : out STD_LOGIC
              );
    end component;        
    
    signal C : std_logic_vector(bitWidth-1 downto 0);
    
    
    begin
        -- Zeroth bit Half Adder
        S(0) <= A(0) xor B(0);
        C(0) <= A(0) and B(0);
    
        -- Generated Full Adders
        FA: for I in 1 to bitWidth-1 generate
                      UX: FullAdder port map
                         (x=>A(I),y=>B(I),Cin=>C(I-1),sum=>S(I),Cout=>C(I));
        end generate FA;   
        
        Cout <= C(bitWidth-1);

end architecture RCA;