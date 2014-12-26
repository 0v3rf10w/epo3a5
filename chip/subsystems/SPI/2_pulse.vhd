library IEEE;
use IEEE.std_logic_1164.all;

entity pulse_2 is
	port (	
		clk		: in	std_logic;
		input	: in 	std_logic;
		output	: out	std_logic
	);
end entity pulse_2;

architecture behavioral of pulse_2 is
	signal delay1,delay2,pulse_delay : std_logic;
begin

	output <= input and (not pulse_delay);

process(clk)
begin
	if(rising_edge(clk)) then
		delay1 <= input;
		delay2 <= delay1;
		pulse_delay <= delay2;
	end if;
end process;

end behavioral;