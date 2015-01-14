library IEEE;
use IEEE.std_logic_1164.ALL;

entity gate is
port( 	input : in std_logic;
		output : out std_logic;
		sw	: in std_logic);
end gate;

architecture Behavioral of gate is
begin

output <= input when (sw = '1') else '0';

end Behavioral;

