library IEEE;
use ieee.std_logic_1164.all;

entity reg_top is
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end entity reg_top;

architecture behaviour of reg_top is
component reg_2
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_3
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_4
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_5
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_6
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_7
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_8
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_9
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

component reg_10
port (  reg_in  : in  std_logic_vector(7 downto 0);
        reg_clk : in  std_logic;
        reg_rst : in  std_logic;
        reg_ld  : in  std_logic_vector(4 downto 0);
        reg_out : out std_logic_vector(7 downto 0));
end component;

begin
r2:		reg_2 port map (
				reg_in => reg_in,
				reg_clk => reg_clk,
				reg_rst => reg_rst,
				reg_ld => reg_ld,
				reg_out => reg_out);

r3:		reg_3 port map (
				reg_in => reg_in,
				reg_clk => reg_clk,
				reg_rst => reg_rst,
				reg_ld => reg_ld,
				reg_out => reg_out);
r4:		reg_4 port map (
				reg_in => reg_in,
				reg_clk => reg_clk,
				reg_rst => reg_rst,
				reg_ld => reg_ld,
				reg_out => reg_out);
r5:		reg_5 port map (
				reg_in => reg_in,
				reg_clk => reg_clk,
				reg_rst => reg_rst,
				reg_ld => reg_ld,
				reg_out => reg_out);
r6:		reg_6 port map (
				reg_in => reg_in,
				reg_clk => reg_clk,
				reg_rst => reg_rst,
				reg_ld => reg_ld,
				reg_out => reg_out);
r7:		reg_7 port map (
				reg_in => reg_in,
				reg_clk => reg_clk,
				reg_rst => reg_rst,
				reg_ld => reg_ld,
				reg_out => reg_out);
r8:		reg_8 port map (
				reg_in => reg_in,
				reg_clk => reg_clk,
				reg_rst => reg_rst,
				reg_ld => reg_ld,
				reg_out => reg_out);
r9:		reg_9 port map (
				reg_in => reg_in,
				reg_clk => reg_clk,
				reg_rst => reg_rst,
				reg_ld => reg_ld,
				reg_out => reg_out);
r10:	reg_10 port map (
				reg_in => reg_in,
				reg_clk => reg_clk,
				reg_rst => reg_rst,
				reg_ld => reg_ld,
				reg_out => reg_out);
end architecture;