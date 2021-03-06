library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behavioural of dff is
type out_state is (stateoff, stateeen);
signal state, newstate: out_state;

begin
lbl1: process(clk,reset) is
begin
if(reset = '1') then
state <= stateoff;
else
if rising_edge(clk) then
state <= newstate;
end if;
end if;
end process;

lbl2: process(state) is
begin
case state is
when stateoff =>
q <= '1';
qbar <= '0';
newstate <= stateeen;
when stateeen =>
q<= '0';
qbar<='1';
newstate <= stateoff;
end case;
end process;
end behavioural;





























