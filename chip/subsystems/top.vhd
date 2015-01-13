library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
port (	


		h_sync	:	out 	std_logic;
		v_sync	:	out 	std_logic;
		vga_rgb	:	out 	std_logic;
		);
end entity;

architecture behaviour of top is
component cpu
port(	cpu_clk	:	in	std_logic;
		cpu_rst	:	in	std_logic;
		cpu_en	:	in	std_logic;
		cpu_in	:	in	std_logic_vector(7 downto 0);
		cpu_instr:	in	std_logic_vector(11 downto 0);
		cpu_pc	:	out	std_logic_vector(7 downto 0);
		cpu_out	:	out	std_logic_vector(7 downto 0);
		cpu_test_inc : out std_logic;
		cpu_test_ld : out std_logic;
		cpu_test_data : out std_logic_vector(7 downto 0));
end component;

component gpu
port (	clk : in std_logic;
		gpu_in : std_logic_vector(7 downto 0);
		reset : in std_logic;
		gpu_out : out std_logic_vector(7 downto 0));
end component;

component spi
port (	clk			: in	std_logic;
		send		: in	std_logic;
		reset		: in	std_logic;
		write_enable : in 	std_logic;
		write_in	: in	std_logic_vector (7 downto 0);
		read_out	: out	std_logic_vector (7 downto 0);
		busy		: out	std_logic;
		sclk		: out	std_logic;
		mosi		: out	std_logic;
		miso		: in	std_logic;
		ss			: out	std_logic
	);