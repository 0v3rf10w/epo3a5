library IEEE;
use IEEE.std_logic_1164.ALL;

entity shift_reg is
port(	clk: 		in std_logic;
	reset:	 	in std_logic;
	shift_in:		in std_logic;
	output: 		out std_logic_vector (7 downto 0)
	);
end shift_reg;





