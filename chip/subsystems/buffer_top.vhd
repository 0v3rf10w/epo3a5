library ieee;
use ieee.std_logic_1164.all;

entity buf_top is
port ( 	buf_in	:	in	std_logic_vector(7 downto 0);
		buf_oe	:	in	std_logic_vector(4 downto 0);
		buf_out	:	out	std_logic_vector(7 downto 0));
end buf_top;

architecture behaviour of buf_top is
component buf_2
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_3
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_4
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_5
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_6
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_7
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_8
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_9
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;

component buf_10
port( buf_in  : in  std_logic_vector(7 downto 0);
      buf_oe  : in  std_logic_vector(4 downto 0);
      buf_out : out std_logic_vector(7 downto 0));
end component;


begin
b2:		buf_2 port map (
				buf_in => buf_in,
				buf_oe => buf_oe,
				buf_out => buf_out);
b3:		buf_3 port map (
				buf_in => buf_in,
				buf_oe => buf_oe,
				buf_out => buf_out);
b4:		buf_4 port map (
				buf_in => buf_in,
				buf_oe => buf_oe,
				buf_out => buf_out);
b5:		buf_5 port map (
				buf_in => buf_in,
				buf_oe => buf_oe,
				buf_out => buf_out);
b6:		buf_6 port map (
				buf_in => buf_in,
				buf_oe => buf_oe,
				buf_out => buf_out);
b7:		buf_7 port map (
				buf_in => buf_in,
				buf_oe => buf_oe,
				buf_out => buf_out);
b8:		buf_8 port map (
				buf_in => buf_in,
				buf_oe => buf_oe,
				buf_out => buf_out);
b9:		buf_9 port map (
				buf_in => buf_in,
				buf_oe => buf_oe,
				buf_out => buf_out);
b10:	buf_10 port map (
				buf_in => buf_in,
				buf_oe => buf_oe,
				buf_out => buf_out);
end architecture;