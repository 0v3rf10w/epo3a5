
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of tbuf is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   Y_tri : tinv10 port map( A => n1, E => E, Y => Y);
   U2 : iv110 port map( A => A, Y => n1);

end synthesised;



