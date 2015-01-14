LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity gate is
port(		input : in std_logic;
			output : out std_logic;
			sw	: in std_logic
		);
end gate;

architecture Behavioral of gate is

begin


process(sw, input)
begin
if (sw = '1') then
output <= input;
else
output <= '0';
end if;
end process;

end Behavioral;

