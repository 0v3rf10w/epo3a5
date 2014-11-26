library IEEE;
use IEEE.std_logic_1164.ALL;

entity comperator is
port( 
	comperator_counter_in : in std_logic_vector(9 downto 0);
	comperator_control_in : in std_logic_vector(9 downto 0);
	zero, eq : out std_logic;
	clk : in std_logic
);
end comperator;

architecture behavoural of comperator is

begin


process(comperator_counter_in, comperator_control_in, clk)
begin


if(rising_edge(clk)) then
if (comperator_counter_in = "0000000000") then
	zero <= '1';
else
	zero <= '0';
end if;
else
end if;

end process;

process(comperator_counter_in, clk)
begin

if(rising_edge(clk)) then
if (comperator_counter_in = comperator_control_in) then
if (comperator_control_in = "1111111111") then
	eq <= '0';
else
	eq <= '1';
end if;
else
	eq <= '0';

end if;
else
end if;

end process;



end architecture;

