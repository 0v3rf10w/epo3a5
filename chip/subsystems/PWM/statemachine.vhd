library IEEE;
use IEEE.std_logic_1164.ALL;

entity statemachine is
port(
	clk, reset, zero_in, eq_in : in std_logic;
	pwm_out : out std_logic
);
end statemachine;


architecture behavoural of statemachine is
type state_type is (pwm1, pwm0);
signal current_state, next_state : state_type;


begin
process(clk, reset) 
begin
if (rising_edge (clk)) then
	if (reset = '1') then
	current_state <= pwm0;
	else
	current_state <= next_state;
	end if;
end if;
end process;

process(zero_in, eq_in, clk)
begin
case current_state is 
when pwm0 =>
	if (zero_in = '1' AND eq_in = '0') then
	next_state <= pwm1;
	elsif (zero_in = '1' AND eq_in = '1') then
	next_state <= pwm0;
	else
	next_state <= pwm0;	
	end if;
	pwm_out <= '0';

when pwm1 =>
	pwm_out <= '1';
	if (zero_in = '1' OR eq_in = '1') then
	next_state <= pwm0;
	else
	next_state <= pwm1;
	end if;

when others =>
	next_state <= pwm0;
	pwm_out <= '0';
end case;
end process;

end behavoural;
