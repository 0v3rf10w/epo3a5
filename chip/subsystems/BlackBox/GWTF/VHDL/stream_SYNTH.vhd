
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of stream is

   component tbuf
      port( A : in std_logic;  Y : out std_logic;  E : in std_logic);
   end component;

begin
   
   tbuf0 : tbuf port map( A => IN_0, Y => OUT_0, E => notE);
   tbuf1 : tbuf port map( A => IN_0, Y => OUT_1, E => E);
   tbuf2 : tbuf port map( A => IN_1, Y => OUT_0, E => E);
   tbuf3 : tbuf port map( A => IN_1, Y => OUT_1, E => notE);

end synthesised;



