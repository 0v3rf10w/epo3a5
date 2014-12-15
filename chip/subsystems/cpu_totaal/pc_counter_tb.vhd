library ieee;
use ieee.std_logic_1164.all;

entity pc_counter_tb is
end entity pc_counter_tb;

architecture behaviour of pc_counter_tb is
component pc_counter
port ( pc_in  : in  std_logic_vector(7 downto 0);
      pc_inc  : in  std_logic;
      pc_ld   : in  std_logic;
      pc_rst  : in  std_logic;
      pc_clk  : in  std_logic;
      pc_out  : out std_logic_vector(7 downto 0));
end component;
signal pc_in	:	std_logic_vector(7 downto 0);
signal pc_inc	:	std_logic;
signal pc_ld	:	std_logic;
signal pc_rst	:	std_logic;
signal pc_clk	:	std_logic;
signal pc_out	:	std_logic_vector(7 downto 0);
begin
lbl1: pc_counter port map (pc_in, pc_inc, pc_ld, pc_rst, pc_clk, pc_out);
pc_clk <= '1' after 0 ns,
	'0' after 5 ns when pc_clk/= '0' else '1' after 5 ns;
pc_in <= "00000000" after 0 ns,
		"00000010" after 100 ns;
pc_inc <= '0' after 0 ns,
		'1' after 10 ns,
		'0' after 100 ns,
		'1' after 110 ns;
pc_ld <= '0' after 0 ns,
		'1' after 100 ns,
		'0' after 110 ns;
pc_rst <= '1' after 0 ns,
		'0' after 10 ns;
end architecture;