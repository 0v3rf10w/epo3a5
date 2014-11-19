library IEEE;
use IEEE.std_logic_1164.all;

entity spi is
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
end entity spi;

architecture structural of spi is

component counter is
	port (	clk		: in	std_logic;
		reset		: in	std_logic;
		count_out	: out	std_logic_vector (3 downto 0)
	);
end component counter;

component shift_reg is
port(	clk: 			in std_logic;
	reset:	 		in std_logic;
	enable: 		in std_logic;
	shift_in:		in std_logic;
	reg_set:		in std_logic;
	reg_write: 		in std_logic_vector (7 downto 0);
	output: 		out std_logic_vector (7 downto 0)
	);
end component shift_reg;

component control is
port(	clk:			in std_logic;
		reset:		in std_logic;
		send:		in std_logic;
		count:		in std_logic_vector(3 downto 0);
		shift_reset:	out std_logic;
		shift:		out std_logic;
		sclk:		out std_logic;
		c_reset:	out std_logic
	);
end component control;

signal count : std_logic_vector(3 downto 0);
signal output : std_logic_vector(7 downto 0);
signal count_reset,switch_clk : std_logic;
signal shift_reset,shift : std_logic;

begin
	sclk <= switch_clk;
	read_out <= output;
	mosi <= output(7);
cnt1:  counter port map (switch_clk,count_reset,count);
shft1: shift_reg port map (clk,reset,shift,miso,write_enable,write_in,output);
ctrl1: control port map (clk,reset,send,count,shift_reset,shift,switch_clk,count_reset);

end structural;
