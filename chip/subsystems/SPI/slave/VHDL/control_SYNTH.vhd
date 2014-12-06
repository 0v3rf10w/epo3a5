
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
   
   signal shift_port, busy_port, state_1_port, state_0_port, N16, n1, 
      c_reset_port, n14, n15, n16_port, n17, n18, n19, n20, n21, n22, n23, n24 
      : std_logic;

begin
   shift <= shift_port;
   c_reset <= c_reset_port;
   busy <= busy_port;
   
   state_reg_0_inst : dfa11 port map( D => n1, CK => clk, R => reset, Q => 
                           state_0_port);
   state_reg_1_inst : dfa11 port map( D => N16, CK => clk, R => reset, Q => 
                           state_1_port);
   U21 : ex210 port map( A => state_0_port, B => n14, Y => ss);
   U22 : no210 port map( A => clk, B => c_reset_port, Y => sclk);
   U23 : iv110 port map( A => n15, Y => n1);
   U24 : no310 port map( A => n16_port, B => n17, C => n18, Y => n15);
   U25 : no210 port map( A => c_reset_port, B => n19, Y => n18);
   U26 : no310 port map( A => reset, B => state_1_port, C => state_0_port, Y =>
                           n17);
   U27 : no210 port map( A => send, B => busy_port, Y => n16_port);
   U28 : iv110 port map( A => shift_port, Y => c_reset_port);
   U29 : na210 port map( A => n20, B => n21, Y => N16);
   U30 : na210 port map( A => n19, B => shift_port, Y => n21);
   U31 : no210 port map( A => n14, B => state_0_port, Y => shift_port);
   U32 : na310 port map( A => count(3), B => n22, C => n23, Y => n19);
   U33 : no210 port map( A => count(2), B => count(1), Y => n23);
   U34 : iv110 port map( A => count(0), Y => n22);
   U35 : na210 port map( A => send, B => n24, Y => n20);
   U36 : iv110 port map( A => busy_port, Y => n24);
   U37 : na210 port map( A => state_0_port, B => n14, Y => busy_port);
   U38 : iv110 port map( A => state_1_port, Y => n14);

end synthesised;



