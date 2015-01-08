
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of spi is

   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   component control
      port( clk, reset, send : in std_logic;  count : in std_logic_vector (3 
            downto 0);  shift, sclk, c_reset, ss, busy : out std_logic);
   end component;
   
   component shift_reg
      port( clk, reset, enable, shift_in, reg_set : in std_logic;  reg_write : 
            in std_logic_vector (7 downto 0);  output : out std_logic_vector (7
            downto 0));
   end component;
   
   component counter
      port( clk, reset : in std_logic;  count_out : out std_logic_vector (3 
            downto 0));
   end component;
   
   signal read_out_7_port, read_out_6_port, read_out_5_port, read_out_4_port, 
      read_out_3_port, read_out_2_port, read_out_1_port, read_out_0_port, 
      sclk_port, shift_in, count_reset, count_3_port, count_2_port, 
      count_1_port, count_0_port, shift : std_logic;

begin
   read_out <= ( read_out_7_port, read_out_6_port, read_out_5_port, 
      read_out_4_port, read_out_3_port, read_out_2_port, read_out_1_port, 
      read_out_0_port );
   sclk <= sclk_port;
   mosi <= read_out_7_port;
   
   cnt1 : counter port map( clk => sclk_port, reset => count_reset, 
                           count_out(3) => count_3_port, count_out(2) => 
                           count_2_port, count_out(1) => count_1_port, 
                           count_out(0) => count_0_port);
   shft1 : shift_reg port map( clk => clk, reset => reset, enable => shift, 
                           shift_in => shift_in, reg_set => write_enable, 
                           reg_write(7) => write_in(7), reg_write(6) => 
                           write_in(6), reg_write(5) => write_in(5), 
                           reg_write(4) => write_in(4), reg_write(3) => 
                           write_in(3), reg_write(2) => write_in(2), 
                           reg_write(1) => write_in(1), reg_write(0) => 
                           write_in(0), output(7) => read_out_7_port, output(6)
                           => read_out_6_port, output(5) => read_out_5_port, 
                           output(4) => read_out_4_port, output(3) => 
                           read_out_3_port, output(2) => read_out_2_port, 
                           output(1) => read_out_1_port, output(0) => 
                           read_out_0_port);
   ctrl1 : control port map( clk => clk, reset => reset, send => send, count(3)
                           => count_3_port, count(2) => count_2_port, count(1) 
                           => count_1_port, count(0) => count_0_port, shift => 
                           shift, sclk => sclk_port, c_reset => count_reset, ss
                           => ss, busy => busy);
   shift_in_reg : dfa11 port map( D => miso, CK => sclk_port, R => reset, Q => 
                           shift_in);

end synthesised;



