library IEEE;
use IEEE.std_logic_1164.ALL;

entity dff_haat is
   port(clk :in    std_logic;
        d   :in    std_logic;
reset : in std_logic;
        q   :out   std_logic;
        qbar:out   std_logic);
end dff_haat;

architecture behavioural of dff_haat is
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





































