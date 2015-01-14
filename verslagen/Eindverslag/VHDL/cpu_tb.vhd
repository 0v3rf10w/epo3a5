library IEEE;
use IEEE.std_logic_1164.ALL;

entity cpu_tb is
end cpu_tb;

architecture behaviour of cpu_tb is
component cpu
port(cpu_rst:	in	std_logic;
	cpu_en:	in	std_logic;
	cpu_in:	in	std_logic_vector(7 downto 0);
	cpu_instr:	in	std_logic_vector(11 downto 0);
	cpu_pc:	out	std_logic_vector(7 downto 0);
	cpu_out:	out	std_logic_vector(7 downto 0));
end component;

signal	cpu_rst, cpu_en: std_logic;
signal	cpu_in, cpu_pc, cpu_out	:	std_logic_vector(7 downto 0);
signal	cpu_instr	:	std_logic_vector(11 downto 0);

begin
lbl1:	cpu port map (cpu_rst, cpu_en, cpu_in, cpu_instr, cpu_pc, cpu_out);
cpu_rst <= '1' after 0 ns,
	'0' after 50 ns;
cpu_en <= '1' after 0 ns,
	'0' after 10 ns when cpu_en/='0' else '1' after 40 ns;
cpu_in <= "00000000" after 0 ns,
	"00000010" after 950 ns;
cpu_instr <= "000000000000" after 0 ns,
	"010100001100" after 50 ns,
	"011100000001" after 100 ns,
	"010100001100" after 150 ns,
	"011100000010" after 200 ns,
	"010100000110" after 250 ns,
	"011100000011" after 300 ns,
	"010100001100" after 350 ns,
	"011100000100" after 400 ns,
	"010100010000" after 450 ns,
	"011100000101" after 500 ns,
	"010100000001" after 550 ns,
	"011100000110" after 600 ns,
	"010100000001" after 650 ns,
	"011100000111" after 700 ns,
	"010111111111" after 750 ns,
	"011100001010" after 800 ns,
	"000100010001" after 850 ns,
	"111100000000" after 900 ns,
	"011000000001" after 950 ns,
	"101000001000" after 1000 ns,
	"100011111000" after 1050 ns,
	"011100000001" after 1100 ns,
	"010000010111" after 1150 ns,
	"000100010001" after 1200 ns;

end architecture;




