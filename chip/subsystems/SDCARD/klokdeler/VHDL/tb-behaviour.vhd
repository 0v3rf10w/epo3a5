library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tb is
begin
clk <= '1' after 0ns, 
	'0' after 100ns when clk/='0' else '1'after 100ns;
end behaviour;


