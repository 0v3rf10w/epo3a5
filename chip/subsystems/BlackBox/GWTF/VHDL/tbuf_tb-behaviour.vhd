library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tbuf_tb is

component tbuf is
   port(A :in    std_logic;
        Y:out   std_logic;
        E      :in    std_logic);
end component;

signal As, Ys, Es: std_logic;

begin
tbuf1: tbuf port map (As, Ys, Es);

As <= '0' after 0 ns, '1' after 30 ns;
Es <= '0' after 0 ns, '1' after 20 ns;
end behaviour;


