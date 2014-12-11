library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tbuf is
begin

process(E,A)
	begin
	if E = '0' then
		Y <= 'Z';
	else
		Y <= A;
	end if;
end process;
  
end behaviour;


