library IEEE;
use IEEE.std_logic_1164.ALL;

entity vga_tb is
   port(clk   :in    std_logic;
        reset :in    std_logic;
        hsync_out :out   std_logic;
        von   :out   std_logic;
        vsync :out   std_logic;
	counter_out_out :out std_logic_vector(5 downto 0);
        rgb   :out   std_logic_vector(2 downto 0));
        --rgb_in:in    std_logic;
end vga_tb;











