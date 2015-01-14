library IEEE;
use IEEE.std_logic_1164.all;

entity klokdeler_tb is
end klokdeler_tb;

architecture structural of klokdeler_tb is

component klokdeler is
   port(clk     :in    std_logic;
        f2     :out   std_logic;
        f4     :out   std_logic;
        f8     :out   std_logic;
        f16    :out   std_logic;
        f32    :out   std_logic;
        f64    :out   std_logic;
        f128   :out   std_logic;
        f256   :out   std_logic;
        f512   :out   std_logic;
        f1024  :out   std_logic;
        f2048  :out   std_logic;
        f4096  :out   std_logic;
        f8192  :out   std_logic;
        f16384 :out   std_logic;
        f32768 :out   std_logic;
        f65536 :out   std_logic;
        f131072:out   std_logic;
reset: in std_logic);
end component klokdeler;

signal clk: std_logic := '0';
signal f2,f4,f8,f16,f32,f64,f128,f256,f512,f1024,f2048,f4096,f8192,f16384,f32768,f65536,f131072 : std_logic;
signal reset : std_logic;

begin
klk1: klokdeler port map (clk, f2,f4,f8,f16,f32,f64,f128,f256,f512,f1024,f2048,f4096,f8192,f16384,f32768,f65536,f131072, reset);

clk <= not clk after 50 ns;

reset <= '1' after 0 ns,
	 '0' after 200 ns;
	 
				
end structural;
