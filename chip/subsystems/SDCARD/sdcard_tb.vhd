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
		output:			out std_logic_vector(11 downto 0);
		busy:			out std_logic;
		
		sclk:			out std_logic;
		mosi:			out std_logic;
		miso:			in std_logic;
		ss:				out std_logic;
		
		state_debug:	out std_logic_vector(6 downto 0);
		next_state:		in std_logic;
		spi_output_debug: out std_logic_vector(7 downto 0)
		
	);
end component sdcard;

signal clk: std_logic := '0';
signal div_clk: std_logic := '0';
signal reset: std_logic;
signal address: std_logic_vector(7 downto 0);
signal output: std_logic_vector(11 downto 0);
signal busy: std_logic;
signal sclk: std_logic;
signal mosi: std_logic;
signal miso: std_logic;
signal ss: std_logic;
signal debug_state: std_logic_vector(6 downto 0);
signal state_next: std_logic;
signal spi_debug_output: std_logic_vector(7 downto 0);
begin
sd1: sdcard port map (clk, div_clk, reset, address, output, busy, sclk, mosi, miso, ss, debug_state,state_next,spi_debug_output);

clk <= not clk after 50 ns;

div_clk <= not div_clk after 1250 ns;

reset <= '1' after 0 ns,
	 '0' after 3000 ns;
	 
address <=	"00001100" after 0 ns,
		"00001000" after 1040000 ns;

miso <= '1' after 0 ns,
	'0' after 508750 ns,
	'1' after 527500 ns,
	'0' after 733750 ns,
	'1' after 755000 ns,
	'0' after 958750 ns,
	'1' after 980000 ns,
	'0' after 994150 ns,
	'1' after 995000 ns,
	'0' after 1003250 ns,
	'1' after 1004100 ns,
	'0' after 1007300 ns,
	'1' after 1007400 ns,
	'0' after 1007800 ns,
	'1' after 1007900 ns,
	'0' after 1008200 ns,
	'1' after 1008300 ns,
	'0' after 1009000 ns,
	'1' after 1009100 ns,
	'0' after 1009400 ns,
	'1' after 1009500 ns;
				
end structural;
