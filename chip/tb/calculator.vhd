library IEEE;
use IEEE.std_logic_1164.ALL;

entity calculator is
   port(top_clk  :in	std_logic;
        top_reset:in    std_logic;
        top_sclk :in    std_logic;
        top_mosi :in    std_logic;
        top_ss   :in    std_logic;
        top_out  :out   std_logic_vector(7 downto 0));
end calculator;




architecture behaviour of calculator is

--components--

component cpu 
port(	cpu_rst	:	in	std_logic;
	cpu_en	:	in	std_logic;
	cpu_in	:	in	std_logic_vector(7 downto 0);
	cpu_instr:		in	std_logic_vector(11 downto 0);
	cpu_pc	:	out	std_logic_vector(7 downto 0);
	cpu_out	:	out	std_logic_vector(7 downto 0));
end component;

component gate
port(		input : in std_logic;
			output : out std_logic;
			sw	: in std_logic
		);
end component;

component rom
port(
    rom_a:    in std_logic_vector (7 DOWNTO 0);     -- address
    rom_d:    out std_logic_vector (11 DOWNTO 0)    -- instruction
);
end component;

component shift_reg
port(	clk: 		in std_logic;
	reset:	 	in std_logic;
	shift_in:		in std_logic;
	output: 		out std_logic_vector (7 downto 0)
	);
end component;

--Signals--

signal cpu_enable : std_logic;
signal cpu_input 	: std_logic_vector(7 downto 0);
signal cpu_instr	 : std_logic_vector(11 downto 0);
signal cpu_addr		 : std_logic_vector(7 downto 0);

--Portmaps

begin

lbl_cpu:		cpu port map(
		cpu_rst		=> 	top_reset,
		cpu_en		=>	cpu_enable,
		cpu_in		=> 	cpu_input,
		cpu_instr		=>	cpu_instr,
		cpu_pc		=>	cpu_addr,
		cpu_out		=>	top_out);

lbl_gate:		gate port map(
		input 		=>	top_clk,
		output		=>	cpu_enable,
		sw		=>	top_ss);

lbl_rom:		rom port map(
		rom_a		=>	cpu_addr,
    		rom_d		=>	cpu_instr);

lbl_shift:		shift_reg port map(
		clk		=>	top_sclk,
		reset		=>	top_reset,
		shift_in		=>	top_mosi,
		output		=>	cpu_input);

end behaviour;


