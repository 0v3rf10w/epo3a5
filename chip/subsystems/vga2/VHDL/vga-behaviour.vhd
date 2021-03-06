library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of vga is
component deler is
port( 
clk : in std_logic; 
deler_out : out std_logic); 
end component;

component counter is
port(
	clk_in : in std_logic;
	reset : in std_logic;
	counter_out : out std_logic_vector (5 downto 0);
	counter_out_out : out std_logic_vector (5 downto 0)
);
end component;

component hsync is
port(
hsync_in: in std_logic_vector(5 downto 0);
reset : in std_logic;
deler_out_in : in std_logic;

line_on_in : in std_logic;
nline_out : out std_logic;
hsync_out : out std_logic;
von : out std_logic
);
end component;

component vidcounter is 
port ( 
nline_in : in std_logic; 
reset : in std_logic; 
vidcount_out : out std_logic_vector (9 downto 0) ); 
end component vidcounter;

component vsync is
port(
reset : in std_logic; 
vidcount_in : in std_logic_vector (9 downto 0);
deler_out_in : in std_logic; 
line_on_out: out   std_logic; 
vsync_out	: out std_logic 
);
end component;

component rgb is
port(
deler_out_in : in std_logic; --vertraagde klok van de deler
von : in std_logic; --signaal naar rgb om aan te geven dat er vid geschreven mag worden
counter_out_in : in std_logic_vector (5 downto 0);
rgb_out : out std_logic_vector (2 downto 0)
);
end component;

signal s1 : std_logic;
signal s2 : std_logic_vector (5 downto 0);
signal line_on : std_logic;
signal nline : std_logic;
signal vidcount : std_logic_vector (9 downto 0);
signal vo : std_logic;


begin
cmp1: deler port map (				clk => clk,
				deler_out => s1);

cmp2: counter port map (				clk_in => s1,
				reset => reset,
				counter_out => s2,
				counter_out_out => counter_out_out);


cmp3: hsync port map (				hsync_in => s2,
				reset => reset,
				deler_out_in => s1,
				line_on_in => line_on,
				nline_out => nline,
				hsync_out => hsync_out,
				von => vo);

cmp4: vidcounter port map (				nline_in => nline,
				reset => reset,
				vidcount_out => vidcount);

cmp5: vsync port map (				reset => reset,
				vidcount_in => vidcount,
				deler_out_in => s1,
				line_on_out => line_on,
				vsync_out => vsync_out);

cmp6: rgb port map (				deler_out_in => s1,
				von => vo,
				counter_out_in => s2,
				rgb_out => rgb_out);
				
				
				

end architecture;
















