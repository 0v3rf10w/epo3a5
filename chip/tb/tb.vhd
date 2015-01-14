library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb is
end tb;

architecture Behavioral of tb is

component calculator is
port(
		top_clk 		: 		in std_logic;
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

lib01: calculator port map( top_clk, top_reset, top_sclk, top_mosi, top_ss, top_out);


top_clk <= 	'0' after 0 ns, 
				'1' after 170 ns when top_clk /= '1' else '0' after 170 ns; 
				
top_mosi <= '0' after 0 ns;
top_sclk <= '0' after 0 ns;
top_reset <= 	'1' after 0 ns,
					'0' after 200 ns;
top_ss <= '0' after 0 ns;
	


end Behavioral;

