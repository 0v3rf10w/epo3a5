
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of control is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal c_reset_port, state_1_port, state_0_port, N16, shift_port, n3, 
      n16_port, n17, n18, n19, n20, n21, n22, n23, n24, n25 : std_logic;

begin
   shift <= shift_port;
   c_reset <= c_reset_port;
   
   state_reg_0_inst : dfa11 port map( D => n3, CK => clk, R => reset, Q => 
                           state_0_port);
   state_reg_1_inst : dfa11 port map( D => N16, CK => clk, R => reset, Q => 
                           state_1_port);
   U21 : no210 port map( A => clk, B => c_reset_port, Y => sclk);
   U22 : iv110 port map( A => n16_port, Y => n3);
   U23 : no210 port map( A => n17, B => n18, Y => n16_port);
   U24 : no210 port map( A => c_reset_port, B => n19, Y => n18);
   U25 : no210 port map( A => state_1_port, B => n20, Y => n17);
   U26 : mu111 port map( A => reset, B => send, S => state_0_port, Y => n20);
   U27 : iv110 port map( A => shift_port, Y => c_reset_port);
   U28 : na210 port map( A => n21, B => n22, Y => N16);
   U29 : na310 port map( A => send, B => n23, C => state_0_port, Y => n22);
   U30 : na210 port map( A => n19, B => shift_port, Y => n21);
   U31 : no210 port map( A => n23, B => state_0_port, Y => shift_port);
   U32 : iv110 port map( A => state_1_port, Y => n23);
   U33 : na310 port map( A => count(3), B => n24, C => n25, Y => n19);
   U34 : no210 port map( A => count(2), B => count(1), Y => n25);
   U35 : iv110 port map( A => count(0), Y => n24);

end synthesised;



