library IEEE;
use IEEE.std_logic_1164.all;

entity spi_tb is
end spi_tb;

architecture structural of spi_tb is

component spi is
	port (	clk		: in	std_logic;
		send		: in	std_logic;
		reset		: in	std_logic;
		write_enable	: in 	std_logic;
		write_in	: in	std_logic_vector (7 downto 0);
		read_out	: out	std_logic_vector (7 downto 0);
		sclk		: out	std_logic;
		mosi		: out	std_logic;
		miso		: in	std_logic
	);
end component spi;

signal clk: std_logic := '0';
signal reset: std_logic;
signal send: std_logic;
signal write_enable : std_logic;
signal write_in: std_logic_vector(7 downto 0);
signal read_out: std_logic_vector(7 downto 0);
signal sclk: std_logic;
signal mosi: std_logic;
signal miso: std_logic;
begin
spi1: spi port map (clk, send, reset, write_enable,write_in,read_out,sclk,
					mosi,miso);

clk <= not clk after 50 ns;

reset <= '1' after 0 ns,
	 '0' after 100 ns;
	 
write_enable <= '0' after 0 ns,
				'1' after 200 ns,
				'0' after 300 ns;
				
write_in <= "11111111";

miso <= '0';

send <= '0' after 0 ns,
		'1' after 500 ns,
		'0' after 700 ns,
		'1' after 2600 ns,
		'0' after 2700 ns;

end structural;
