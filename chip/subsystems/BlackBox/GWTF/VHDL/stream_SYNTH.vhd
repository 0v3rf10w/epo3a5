
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of stream is

   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;

begin
   
   U8 : mu111 port map( A => IN_1, B => IN_0, S => E, Y => OUT_1);
   U9 : mu111 port map( A => IN_0, B => IN_1, S => E, Y => OUT_0);

end synthesised;



