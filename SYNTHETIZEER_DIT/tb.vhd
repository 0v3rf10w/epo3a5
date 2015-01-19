library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb is
end tb;


architecture Behavioral of tb is

component calculator is
port(
		XI		: 		in std_logic;
		XO		:		inout std_logic;
		top_reset 	: 		in std_logic;
		top_sclk 	: 		in std_logic;
		top_mosi 	: 		in std_logic;
		top_ss		:		in std_logic;
		top_out		: 		out std_logic_vector(7 downto 0)
		);
end component;

signal top_clk, top_reset, top_sclk, top_mosi, top_ss : std_logic;
signal top_out : std_logic_vector(7 downto 0);

begin

lib01: calculator port map( top_clk,open , top_reset, top_sclk, top_mosi, top_ss, top_out);


top_clk <= 	'0' after 0 ns, 
				'1' after 170 ns when top_clk /= '1' else '0' after 170 ns; 
				
top_reset <= 	'1' after 0 ns,
				'0' after 400 ns;

top_sclk <= 	'0' after 0 ns, 
				'1' after 550 ns,
				'0' after 700 ns,
				'1' after 850 ns,
				'0' after 1000 ns,
				'1' after 1150 ns,
				'0' after 1300 ns,
				'1' after 1450 ns,
				'0' after 1600 ns,
				'1' after 1750 ns,
				'0' after 1900 ns,
				'1' after 2050 ns,
				'0' after 2200 ns,
				'1' after 2350 ns,
				'0' after 2500 ns,
				'1' after 2650 ns,
				'0' after 2800 ns,
				
				'1' after 13200 ns,
				'0' after 13350 ns,
				'1' after 13500 ns,
				'0' after 13650 ns,
				'1' after 13800 ns,
				'0' after 13950 ns,
				'1' after 14100 ns,
				'0' after 14250 ns,
				'1' after 14400 ns,
				'0' after 14550 ns,
				'1' after 14700 ns,
				'0' after 14850 ns,
				'1' after 15000 ns,
				'0' after 15150 ns,
				'1' after 15300 ns,
				'0' after 15450 ns;
				
top_mosi <= '1' after 0 ns,
			'0' after 1600 ns,
			'1' after 2800 ns,

			'0' after 13050 ns,
			'1' after 13350 ns,
			'1' after 13650 ns,
			'0' after 13950 ns,
			'0' after 14250 ns,
			'1' after 14550 ns,
			'1' after 14850 ns,
			'0' after 15150 ns,

			'1' after 15450 ns;
			
top_ss <= 	'1' after 0 ns,
			'0' after 500 ns,
			'1' after 3060 ns,
			'0' after 12750 ns,
			'1' after 15810 ns;
	


end Behavioral;





