library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of stream_tb is

component stream is
   port(IN_0 :in    std_logic;
        IN_1 :in    std_logic;
        OUT_0:out   std_logic;
        OUT_1:out   std_logic;
        E    :in    std_logic;
	notE :in	   std_logic);
end component;

signal control, ncontrol, in1, in2, out1, out2: std_logic;

begin
stream1: stream port map (in1, in2, out1, out2, control, ncontrol);

control <= '0' after 0 ns, '1' after 50 ns;
ncontrol <= not control;

in1 <= '0';
in2 <= '1';

end behaviour;


