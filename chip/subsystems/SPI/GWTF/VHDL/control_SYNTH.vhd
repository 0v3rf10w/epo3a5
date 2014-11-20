
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of control is

   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal shift_port, state_1_port, state_0_port, new_state_1_port, n1, 
      shift_reset_port, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, 
      n32, n33, n34, n35, n36 : std_logic;

begin
   shift_reset <= shift_reset_port;
   shift <= shift_port;
   
   state_reg_0_inst : dfa11 port map( D => n1, CK => clk, R => reset, Q => 
                           state_0_port);
   state_reg_1_inst : dfa11 port map( D => new_state_1_port, CK => clk, R => 
                           reset, Q => state_1_port);
   U25 : iv110 port map( A => n21, Y => sclk);
   U26 : na210 port map( A => n22, B => clk, Y => n21);
   U27 : na210 port map( A => n23, B => n24, Y => new_state_1_port);
   U28 : na210 port map( A => n22, B => n25, Y => n24);
   U29 : iv110 port map( A => n26, Y => n22);
   U30 : na210 port map( A => send, B => n27, Y => n23);
   U31 : iv110 port map( A => n28, Y => n1);
   U32 : no310 port map( A => n29, B => n30, C => n31, Y => n28);
   U33 : no210 port map( A => send, B => n32, Y => n31);
   U34 : iv110 port map( A => n27, Y => n32);
   U35 : no210 port map( A => n26, B => n25, Y => n30);
   U36 : na310 port map( A => count(3), B => n33, C => n34, Y => n25);
   U37 : no210 port map( A => count(2), B => count(1), Y => n34);
   U38 : iv110 port map( A => count(0), Y => n33);
   U39 : na210 port map( A => state_1_port, B => n35, Y => n26);
   U40 : no210 port map( A => reset, B => n36, Y => n29);
   U41 : iv110 port map( A => shift_reset_port, Y => n36);
   U42 : iv110 port map( A => shift_port, Y => c_reset);
   U43 : no210 port map( A => shift_reset_port, B => n27, Y => shift_port);
   U44 : no210 port map( A => n35, B => state_1_port, Y => n27);
   U45 : iv110 port map( A => state_0_port, Y => n35);
   U46 : no210 port map( A => state_0_port, B => state_1_port, Y => 
                           shift_reset_port);

end synthesised;



