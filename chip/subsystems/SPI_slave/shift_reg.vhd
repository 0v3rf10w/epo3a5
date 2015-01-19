library IEEE;
use IEEE.std_logic_1164.ALL;

entity shift_reg is
port(	clk: 		in std_logic;
	reset:	 	in std_logic;
	shift_in:		in std_logic;
	output: 		out std_logic_vector (7 downto 0)
	);
end shift_reg;

architecture behaviour of shift_reg is

signal reg_shift,shifted_reg: std_logic_vector (7 downto 0);

begin

	shifted_reg(7 downto 1) <= reg_shift(6 downto 0);
	shifted_reg(0) <= shift_in;
	
	process(clk,reset)
	begin
	if(reset = '1') then
		reg_shift <= (others => '0');
	else
		if(falling_edge(clk)) then
			reg_shift <= shifted_reg;						
		end if;
	end if;
	end process;

	output <= reg_shift;
end behaviour;














