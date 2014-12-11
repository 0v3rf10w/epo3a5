
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of iv is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;

begin
   
   U2 : iv110 port map( A => A, Y => Y);

end synthesised;



