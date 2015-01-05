library IEEE;
use IEEE.std_logic_1164.ALL;

entity dff_capabel is
   port(
			clk :in    std_logic;
			d   :in    std_logic;
			reset : 	in std_logic;
			q   :out   std_logic;
			qbar:out   std_logic);
end dff_capabel;

architecture behavioural of dff_capabel is

signal sig_q : std_logic;

begin

q <= sig_q;
qbar <= not sig_q;

lbl1: process(clk,reset) is
begin
	if(reset = '1') then
		sig_q <= '0';
	else
		if rising_edge(clk) then
			sig_q <= d;
		end if;
	end if;
end process;

end behavioural;