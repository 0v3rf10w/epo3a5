library IEEE;
use IEEE.std_logic_1164.ALL;

entity vga is
   port(clk     :in    std_logic;
	reset	:in	std_logic;
        hsync_out   :out   std_logic;
	vsync_out   :out   std_logic;
--	counter_out_out :out std_logic_vector(5 downto 0);
	ssync_out_out :out std_logic;
	input_top :in std_logic;
        rgb_out     :out   std_logic_vector(2 downto 0));

end vga;


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
	counter_out : out std_logic_vector (5 downto 0)
--	counter_out_out : out std_logic_vector (5 downto 0)
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
nline_out_in : in std_logic; --nline_in : in std_logic; 
reset : in std_logic; 
vidcount_out : out std_logic_vector (9 downto 0) ); --9downto0
end component vidcounter;

component vsync is
port(
reset : in std_logic; 
vidcount_in : in std_logic_vector (9 downto 0);
deler_out_in : in std_logic; 
line_on_out: out   std_logic;
ssync_out : out std_logic; 
vsync_out	: out std_logic 
);
end component;

--component deler2 is
--   port(von_in : in    std_logic;
--        deler2_out: out   std_logic);
--end component;

--component counter2 is
--   port(
--	counter2_in : in std_logic; 
--	reset : in std_logic; 
--	counter2_out : out std_logic_vector (5 downto 0));
--end component;


component rgb is
port(
deler_out_in : in std_logic; --vertraagde klok van de deler
von : in std_logic; --signaal naar rgb om aan te geven dat er vid geschreven mag worden
reset : in std_logic;
counter_out_in : in std_logic_vector (5 downto 0);
line_on_in : in std_logic;
--counter2_in : in std_logic_vector (5 downto 0);
vidcount_out_in : in std_logic_vector (9 downto 0);
input : in std_logic;
rgb_out : out std_logic_vector (2 downto 0)
);
end component;

component scount is
port(
clk_in : in std_logic; 
reset : in std_logic; 
ssync_in_in : in std_logic;
scount_out : out std_logic_vector (5 downto 0) 
);
end component;

component ssync is
port(
ssync_in: in std_logic_vector (5 downto 0); --Komt van de counter
deler_out_in : in std_logic; --vertraagde klok van de deler
reset : in std_logic; --algemene reset
ssync_out_out : out std_logic --ssync naar buiten
);
end component;


signal s1 : std_logic;
signal s2 : std_logic_vector (5 downto 0);
signal s3 : std_logic_vector (5 downto 0);
signal line_on : std_logic;
signal nline : std_logic;
signal vidcount : std_logic_vector (9 downto 0);
signal vo : std_logic;
signal ssync_in : std_logic;
--signal deler2_sig : std_logic;
--signal counter2_sig : std_logic_vector (5 downto 0);


begin
cmp1: deler port map (				clk => clk,
				deler_out => s1);

cmp2: counter port map (				clk_in => s1,
				reset => reset,
				counter_out => s2);
--				counter_out_out => counter_out_out);


cmp3: hsync port map (				hsync_in => s2,
				reset => reset,
				deler_out_in => s1,
				line_on_in => line_on,
				nline_out => nline,
				hsync_out => hsync_out,
				von => vo);

cmp4: vidcounter port map (				nline_out_in => nline,
				reset => reset,
				vidcount_out => vidcount);

cmp5: vsync port map (				reset => reset,
				vidcount_in => vidcount,
				deler_out_in => s1,
				line_on_out => line_on,
				ssync_out => ssync_in,
				vsync_out => vsync_out);



--cmp7: deler2 port map (
--				von_in => vo,
--       				deler2_out => deler2_sig);
				
cmp6: rgb port map (				deler_out_in => s1,
				von => vo,
				reset => reset,
				counter_out_in => s2,
				line_on_in => line_on,
--				counter2_in => counter2_sig,
				vidcount_out_in => vidcount,
				input => input_top,
				rgb_out => rgb_out);		

--cmp8: counter2 port map (				counter2_in	=> deler2_sig,
--				reset => reset,
--				counter2_out => counter2_sig);

cmp9: scount port map (				
				clk_in => s1,
				reset => reset,
				ssync_in_in => ssync_in,
				scount_out => s3);

cmp10: ssync port map (
				ssync_in => s3,
				deler_out_in => s1,
				reset => reset,
				ssync_out_out => ssync_out_out);

end architecture;

























