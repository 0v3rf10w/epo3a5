
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of control is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal shift_port, busy_port, state_1_port, state_0_port, N14, n1, 
      c_reset_port, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27 
      : std_logic;

begin
   shift <= shift_port;
   c_reset <= c_reset_port;
   busy <= busy_port;
   
   state_reg_0_inst : dfa11 port map( D => n1, CK => clk, R => reset, Q => 
                           state_0_port);
   state_reg_1_inst : dfa11 port map( D => N14, CK => clk, R => reset, Q => 
                           state_1_port);
   U22 : ex210 port map( A => state_0_port, B => n16, Y => ss);
   U23 : iv110 port map( A => n17, Y => sclk);
   U24 : na210 port map( A => shift_port, B => clk, Y => n17);
   U25 : iv110 port map( A => n18, Y => n1);
   U26 : no310 port map( A => n19, B => n20, C => n21, Y => n18);
   U27 : no210 port map( A => c_reset_port, B => n22, Y => n21);
   U28 : no310 port map( A => reset, B => state_1_port, C => state_0_port, Y =>
                           n20);
   U29 : no210 port map( A => send, B => busy_port, Y => n19);
   U30 : iv110 port map( A => shift_port, Y => c_reset_port);
   U31 : na210 port map( A => n23, B => n24, Y => N14);
   U32 : na210 port map( A => n22, B => shift_port, Y => n24);
   U33 : no210 port map( A => n16, B => state_0_port, Y => shift_port);
   U34 : na310 port map( A => count(3), B => n25, C => n26, Y => n22);
   U35 : no210 port map( A => count(2), B => count(1), Y => n26);
   U36 : iv110 port map( A => count(0), Y => n25);
   U37 : na210 port map( A => send, B => n27, Y => n23);
   U38 : iv110 port map( A => busy_port, Y => n27);
   U39 : na210 port map( A => state_0_port, B => n16, Y => busy_port);
   U40 : iv110 port map( A => state_1_port, Y => n16);

end synthesised;



