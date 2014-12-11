
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of dff is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal state, q_port : std_logic;

begin
   q <= q_port;
   qbar <= state;
   
   state_reg : dfa11 port map( D => q_port, CK => clk, R => reset, Q => state);
   U4 : iv110 port map( A => state, Y => q_port);

end synthesised;



