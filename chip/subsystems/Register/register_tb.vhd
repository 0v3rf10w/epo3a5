library IEEE;
use IEEE.std_logic_1164.ALL;

entity register_tb is
end entity register_tb;

architecture behaviour of register_tb is
component reg_A
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic;
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_10
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

signal reg_in	:	std_logic_vector(7 downto 0);
signal reg_clk	:	std_logic;
signal reg_rst	:	std_logic;
signal reg_ld_A	:	std_logic;
signal reg_ld	:	std_logic_vector(4 downto 0);
signal reg_out_A:	std_logic_vector(7 downto 0);
signal reg_out	:	std_logic_vector(7 downto 0);

begin
lbl1: reg_A port map (reg_in, reg_clk, reg_rst, reg_ld_A, reg_out_A);
lbl2: reg_10 port map (reg_in, reg_clk, reg_rst, reg_ld, reg_out);

reg_clk <= '1' after 0 ns,
	'0' after 5 ns when reg_clk/= '0' else '1' after 5 ns;
reg_in <= "00000000" after 0 ns,
	"00000001" after 10 ns,
	"10101010" after 50 ns;
reg_rst <= '1' after 0 ns,
	'0' after 10 ns;

reg_ld_A <= '0' after 0 ns,
	'1' after 15 ns;
reg_ld <= "00000" after 0 ns,
	"00010" after 15 ns,
	"10010" after 20 ns,
	"00001" after 25 ns,
	"10001" after 30 ns,
	"00010" after 50 ns,
	"10010" after 65 ns,
	"01010" after 75 ns,
	"11010" after 85 ns;
end architecture;
