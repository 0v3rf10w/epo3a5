library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of top_level is
signal div_clk,busy : std_logic;
signal playerdata : std_logic_vector(7 downto 0);
signal cpu_pc: std_logic_vector(7 downto 0);
signal gpu_in : std_logic_vector(7 downto 0);
signal cpu_instr : std_logic_vector(11 downto 0);
signal gpu_out : std_logic;
signal uitleesselect : std_logic;
signal von : std_logic;
signal output : std_logic_vector(11 downto 0);
component sdcard 
port(	clk:			in std_logic;
		div_clk:		in std_logic; --between 100kHz and 400kHz
		reset:			in std_logic;
		address:		in std_logic_vector(7 downto 0);
		output:			out std_logic_vector(11 downto 0);
		busy:			out std_logic;
		
		sclk:			out std_logic;
		mosi:			out std_logic;
		miso:			in std_logic;
		ss:				out std_logic
	);
end component sdcard;

component cpu 
port(	cpu_clk	:	in	std_logic;
	cpu_rst	:	in	std_logic;
	cpu_en	:	in	std_logic;
	cpu_in	:	in	std_logic_vector(7 downto 0);
	cpu_instr:	in	std_logic_vector(11 downto 0);
	cpu_pc	:	out	std_logic_vector(7 downto 0);
	cpu_out	:	out	std_logic_vector(7 downto 0));
end component cpu;


component blackbox 
   port(sclk_m_0:in    std_logic;
        mosi_m_0:in    std_logic;
        miso_m_0:out   std_logic;
        ss_m_0  :in    std_logic;
	
	sclk_m_1:in    std_logic;
        mosi_m_1:in    std_logic;
        miso_m_1:out   std_logic;
        ss_m_1  :in    std_logic;

	sclk_s_0:out    std_logic;
        mosi_s_0:out    std_logic;
        miso_s_0:in   std_logic;
        ss_s_0  :out    std_logic;

	sclk_s_1:out    std_logic;
        mosi_s_1:out    std_logic;
        miso_s_1:in   std_logic;
        ss_s_1  :out    std_logic;

	s:	in	std_logic);
end component blackbox;

component gpu 
port (
clk : in std_logic;
gpu_in : in std_logic_vector(7 downto 0);
reset : in std_logic;
sclk : out std_logic;
mosi : out std_logic;
);
end component gpu;

component vga 
port (
vga_in : in std_logic;
clk : in std_logic;
reset: in std_logic;
von : out std_logic;
hsync_out : out std_logic;
vsync_out : out std_logic;
rgb_out : out std_logic_vector(2 downto 0));
end component vga;
begin

Sdkaart: sdcard port map(
 clk => clk;
 div_clk => div_clk;
 reset => reset;
 address => cpu_pc;
 output => cpu_instr;
 busy => busy;
 sclk => sclk_sd;
 mosi => mosi_sd;
 miso => miso_sd;
 ss => ss_sd); 

cpu1: cpu port map(
 cpu_clk => clk;
 cpu_rst => reset;
 cpu_en => busy;
 cpu_in => playerdata;
 cpu_instr => cpu_instr;
 cpu_pc => cpu_pc;
 cpu_out => gpu_in);

gp1u: gpu port map(
 clk => clk;
 gpu_in => gpu_in;
 reset => reset;
 mosi => mosi_m_1); 

blackbox1: blackbox port map(
	sclk_m_0 => sclk_vga;-- controleren met vga spi
        mosi_m_0 => mosi_vga;
        miso_m_0 => miso_vga;
        ss_m_0  => ss_vga;
	
	sclk_m_1 => sclk;
        mosi_m_1 => mosi;
        miso_m_1 => '1';
        ss_m_1  => '1';

	sclk_s_0 => sclk_sram_0;
        mosi_s_0 => mosi_sram_0;
        miso_s_0 => miso_sram_0;
        ss_s_0  => ss_sram_0;

	sclk_s_1 => sclk_sram_1;
        mosi_s_1 => mosi_sram_1;
        miso_s_1 => miso_sram_1;
        ss_s_1  => ss_sram_1;

	s => sclk); 

vga1: vga port map (
vga_in => miso_m_0;
clk => clk;
reset => reset;
von => von;
hsync_out => h_sync;
vsync_out => v_sync;
rgb_out => rgb);

end behaviour;





