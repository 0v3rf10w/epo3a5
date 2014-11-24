library IEEE;
use IEEE.std_logic_1164.ALL;

entity pwm is
port(
	clk, reset : in std_logic;
	pwm : out std_logic;
	control : in std_logic_vector(9 downto 0);
	zero, eq : out std_logic
);
end pwm;
