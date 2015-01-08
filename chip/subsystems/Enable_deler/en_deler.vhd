library IEEE;
use IEEE.std_logic_1164.all;

entity en_deler is
	port (	
		clk		: in	std_logic;
		input	: in 	std_logic;
		output	: out	std_logic
	);
end entity en_deler;

architecture behavioral of en_deler is
	signal delay1,pulse_delay : std_logic;
begin

	output <= input and (not pulse_delay);

process(clk)
begin
	if(rising_edge(clk)) then
		delay1 <= input;
		pulse_delay <= delay1;
	end if;
end process;

end behavioral;