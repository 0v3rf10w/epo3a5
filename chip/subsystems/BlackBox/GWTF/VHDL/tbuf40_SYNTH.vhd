
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of tbuf40 is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1, n2, n3, n4 : std_logic;

begin
   
   SPI_out_tri_0_inst : tinv10 port map( A => n4, E => E, Y => SPI_out(0));
   SPI_out_tri_1_inst : tinv10 port map( A => n3, E => E, Y => SPI_out(1));
   SPI_out_tri_2_inst : tinv10 port map( A => n2, E => E, Y => SPI_out(2));
   SPI_out_tri_3_inst : tinv10 port map( A => n1, E => E, Y => SPI_out(3));
   U5 : iv110 port map( A => SPI_in(0), Y => n4);
   U6 : iv110 port map( A => SPI_in(1), Y => n3);
   U7 : iv110 port map( A => SPI_in(2), Y => n2);
   U8 : iv110 port map( A => SPI_in(3), Y => n1);

end synthesised;



