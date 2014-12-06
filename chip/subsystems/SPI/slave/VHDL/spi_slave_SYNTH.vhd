
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of spi_slave is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
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
   
   signal X_Logic1_port, X_Logic0_port, count_reset, count_3_port, count_2_port
      , count_1_port, count_0_port, shift_in, n3, n7, n8, n9, n10 : std_logic;

begin
   miso <= X_Logic1_port;
   
   cnt1 : counter port map( clk => n3, reset => count_reset, count_out(3) => 
                           count_3_port, count_out(2) => count_2_port, 
                           count_out(1) => count_1_port, count_out(0) => 
                           count_0_port);
   shft1 : shift_reg port map( clk => sclk, reset => reset, enable => 
                           X_Logic1_port, shift_in => shift_in, reg_set => 
                           X_Logic0_port, reg_write(7) => X_Logic1_port, 
                           reg_write(6) => X_Logic1_port, reg_write(5) => 
                           X_Logic1_port, reg_write(4) => X_Logic1_port, 
                           reg_write(3) => X_Logic1_port, reg_write(2) => 
                           X_Logic1_port, reg_write(1) => X_Logic1_port, 
                           reg_write(0) => X_Logic1_port, output(7) => 
                           read_out(7), output(6) => read_out(6), output(5) => 
                           read_out(5), output(4) => read_out(4), output(3) => 
                           read_out(3), output(2) => read_out(2), output(1) => 
                           read_out(1), output(0) => read_out(0));
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   shift_in_reg : dfa11 port map( D => mosi, CK => sclk, R => reset, Q => 
                           shift_in);
   U10 : iv110 port map( A => sclk, Y => n3);
   U11 : no210 port map( A => count_3_port, B => n7, Y => data_ready);
   U12 : iv110 port map( A => n8, Y => n7);
   U13 : na210 port map( A => n9, B => n10, Y => count_reset);
   U14 : na210 port map( A => count_3_port, B => n8, Y => n10);
   U15 : no310 port map( A => count_0_port, B => count_2_port, C => 
                           count_1_port, Y => n8);
   U16 : iv110 port map( A => reset, Y => n9);

end synthesised;



