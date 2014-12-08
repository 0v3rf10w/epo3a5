library IEEE;
use IEEE.std_logic_1164.all;

entity bitshift_tb is
end bitshift_tb;

architecture structural of bitshift_tb is

component bitshift is
port(	X : in std_logic_vector(5 downto 0);
		Y : in std_logic_vector(5 downto 0);
		Z : out std_logic_vector(11 downto 0)
	);
end component bitshift;

signal X,Y : std_logic_vector(5 downto 0);
signal Z : std_logic_vector(11 downto 0);
begin
bs1: bitshift port map (X,Y,Z);

	X <= "000101";
	Y <= "000111";
end structural;