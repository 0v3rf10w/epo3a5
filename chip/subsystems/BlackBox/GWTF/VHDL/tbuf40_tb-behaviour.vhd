library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tbuf40_tb is
component tbuf40 is
   port(SPI_in :in    std_logic_vector(3 downto 0);
        SPI_out:out   std_logic_vector(3 downto 0);
        E      :in    std_logic);
end component; 

signal SPI_in, SPI_out: std_logic_vector (3 downto 0);
signal E: std_logic;

begin
tbuf1: tbuf40 port map(SPI_in, SPI_out, E);

SPI_in <= 		"0000" after 0 ns,
		"1111" after 50 ns;
E <=		'0' after 0 ns,
		'1' after 20 ns,
		'0' after 40 ns,
		'1' after 70 ns;					
end behaviour;


