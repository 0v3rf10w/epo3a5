library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

entity vsync is
port(
reset : in std_logic; --algemene reset
vidcount_in : in std_logic_vector(9 downto 0); --tel signaal van vidcount
line_on_out: out   std_logic; --signaal naar hsync om von te vertellen dat er geschreven mag worden
deler_out_in : in std_logic; --vertraagde klok van de deler
vsync_out	:	out std_logic;
ssync_out : out std_logic); --vsync voor de vga
end vsync;

architecture behaviour of vsync is
begin

process(vidcount_in, deler_out_in, reset)
begin
if(rising_edge(deler_out_in)) then
if(reset = '1') then
	vsync_out <='0';
	line_on_out <='0';
	ssync_out <= '0';
else

if (vidcount_in = "0000000000") then --Vsync hoog | schrijven laag (0)
	vsync_out <= '1'; --0
	line_on_out <= '0';
	ssync_out <= '0';
elsif (vidcount_in = "0000001011") then --Vsync hoog | schrijven laag (540)
	vsync_out <= '0'; --front proch
	line_on_out <= '0';
elsif (vidcount_in = "0000001101") then --Vsync laag| schrijven laag (617)
	vsync_out <= '1'; --sync
	line_on_out <= '0';
elsif (vidcount_in = "0000101100") then--Vsync hoog | schrijven hoog
	vsync_out <= '1';	 --back porch		
	line_on_out  <= '1';
elsif (vidcount_in = "1000001100") then--Vsync hoog | schrijven hoog
	ssync_out <= '1';		
end if;

end if;
end if;

end process;
end behaviour;





























