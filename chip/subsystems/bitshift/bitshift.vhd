library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bitshift is
port(	X : in std_logic_vector(5 downto 0);
		Y : in std_logic_vector(5 downto 0);
		Z : out std_logic_vector(11 downto 0)
	);
end entity bitshift;

architecture behavioural of bitshift is
	signal S : std_logic_vector(11 downto 0);
begin

	S(11) <= '0';
	S(10 downto 5) <= Y(5 downto 0);
	S(4 downto 0) <= "00000";
	
	Z <= std_logic_vector(unsigned(S) + resize(unsigned(X),12));


end behavioural;