library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of vga_tb is
   component vga is
      port (clk     :in    std_logic;
	reset	:in	std_logic;
	hsync_out	:out	std_logic;
	vsync_out :out std_logic;
	counter_out_out :out std_logic_vector(5 downto 0);
	rgb_out	:out std_logic_vector(2 downto 0));
   end component;

   signal clk_tb: std_logic;
   signal reset_tb: std_logic;
   signal hsync_out_tb: std_logic;
   signal vsync_out_tb: std_logic;
   signal counter_out_out_tb: std_logic_vector(5 downto 0);
   signal rgb_out_tb: std_logic_vector(2 downto 0);


begin
   lbl1: vga port map (	clk => clk_tb, 
			reset => reset_tb,
			hsync_out => hsync_out_tb,
			vsync_out => vsync_out_tb,
			counter_out_out => counter_out_out_tb,
			rgb_out => rgb_out_tb);

   clk_tb <= '1' after 0 ns,
          '0' after 10 ns when clk_tb /= '0' else '1' after 10 ns;
   reset_tb <= '1' after 0 ns,
          '0' after 100 ns;

end behaviour;













