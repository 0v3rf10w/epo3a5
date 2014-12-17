library IEEE;
use IEEE.std_logic_1164.all;

entity sdcard_tb is
end sdcard_tb;

architecture structural of sdcard_tb is

component sdcard is
port(	clk:			in std_logic;
		div_clk:		in std_logic; --between 100kHz and 400kHz
		reset:			in std_logic;
		address:		in std_logic_vector(7 downto 0);
		output:			out std_logic_vector(7 downto 0);
		busy:			out std_logic;
		
		sclk:			out std_logic;
		mosi:			out std_logic;
		miso:			in std_logic;
		ss:			out std_logic;

		state_debug:		out std_logic_vector(4 downto 0)
	);
end component sdcard;

signal clk: std_logic := '0';
signal div_clk: std_logic := '0';
signal reset: std_logic;
signal address: std_logic_vector(7 downto 0);
signal output: std_logic_vector(7 downto 0);
signal busy: std_logic;
signal sclk: std_logic;
signal mosi: std_logic;
signal miso: std_logic;
signal ss: std_logic;
signal debug_state: std_logic_vector(4 downto 0);
begin
sd1: sdcard port map (clk, div_clk, reset, address, output, busy, sclk, mosi, miso, ss, debug_state);

clk <= not clk after 50 ns;

div_clk <= not div_clk after 1250 ns;

reset <= '1' after 0 ns,
	 '0' after 3000 ns;
	 
address <= "00000010";

miso <= '1' after 0 ns,
	'0' after 398750 ns,
	'1' after 423750 ns,
	'0' after 432050 ns,
	'1' after 433050 ns,
	'0' after 435050 ns,
	'1' after 435150 ns,
	'0' after 435950 ns,
	'1' after 436050 ns;
				
end structural;
