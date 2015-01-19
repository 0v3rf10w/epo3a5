
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of gate is

   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U4 : iv110 port map( A => n3, Y => output);
   U5 : na210 port map( A => sw, B => input, Y => n3);

end synthesised;



