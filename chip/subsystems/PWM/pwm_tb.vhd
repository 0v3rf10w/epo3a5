library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of pwm_tb1 is
   component pwm is
      port (clk: in  std_logic;
            reset: in  std_logic;
            control: in  std_logic_vector(9 downto 0);
	    pwm: out std_logic;
	    zero, eq : out std_logic);
   end component;

   signal clk_tb: std_logic;
   signal reset_tb: std_logic;
   signal control_tb: std_logic_vector(9 downto 0);
   signal pwm_tb: std_logic;
   signal eq, zero : std_logic;

begin
   lbl1: pwm port map (	clk => clk_tb, 
			reset => reset_tb,
			control => control_tb, 
			pwm => pwm_tb,
			zero => zero,
			eq => eq);

   clk_tb <= '1' after 0 ns,
          '0' after 100 ns when clk_tb /= '0' else '1' after 100 ns;
   reset_tb <= '1' after 0 ns,
          '0' after 20 ns;
   control_tb <= "0000000000" after 0 ns,
         "1000000000" after 1000000 ns,
         "0100000000" after 4000000 ns,
         "0010000000" after 5000000 ns,
         "0001000000" after 7000000 ns,
         "0000100000" after 9000000 ns,         
	 "1111111111" after 11000000 ns,
         "0000000000" after 13000002 ns;


end behaviour;
