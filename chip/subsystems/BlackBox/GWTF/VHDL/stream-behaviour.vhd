library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of stream is

begin
process(IN_0, IN_1, E)
begin
	if E = '0' then
		OUT_0 <= IN_0;
		OUT_1 <= IN_1;
	else
		OUT_0 <= IN_1;
		OUT_1 <= IN_0;
	end if;
end process;
end behaviour;


