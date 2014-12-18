library ieee;
use ieee.std_logic_1164.all;

entity reg_tb is
end entity reg_tb;

architecture behaviour of reg_tb is
  component reg_cluster
    port (  reg_in      : in std_logic_vector(7 downto 0);
        reg_clk     : in std_logic;
        reg_rst     : in std_logic;
        reg_select  : in std_logic_vector(4 downto 0);
        buf_select  : in std_logic_vector(4 downto 0);
        buf_out     : out std_logic_vector(7 downto 0));
end component;

signal reg_in     : std_logic_vector(7 downto 0);
signal reg_clk    : std_logic;
signal reg_rst    : std_logic;
signal reg_select : std_logic_vector(4 downto 0);
signal buf_select : std_logic_vector(4 downto 0);
signal buf_out    : std_logic_vector(7 downto 0);

begin
  lbl1: reg_cluster port map (reg_in, reg_clk, reg_rst, reg_select, buf_select, buf_out);
    reg_clk <= '1' after 0 ns,
	             '0' after 5 ns when reg_clk/= '0' else '1' after 5 ns;
	             
	  reg_rst <= '1' after 0 ns, '0' after 10 ns;
	  
	  reg_in  <= "01000110" after 0 ns, "00000001" after 50 ns, "10000010" after 100 ns;
	  
	  reg_select <= "10011" after 0 ns, "11010" after 50 ns, "10010" after 100 ns, "10000" after 150 ns;
	  
	  buf_select <= "00000" after 0 ns, "00100" after 20 ns, "10011" after 30 ns, "10100" after 50 ns, "10011" after 100 ns, "11010" after 150 ns, "10010" after 200 ns;
	  
end architecture;	  