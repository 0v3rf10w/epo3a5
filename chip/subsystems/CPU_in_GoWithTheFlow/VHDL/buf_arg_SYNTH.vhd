
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of buf_arg is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5, n6, n7, n8 : std_logic;

begin
   
   buf_out_tri_0_inst : tinv10 port map( A => n8, E => buf_oe, Y => buf_out(0))
                           ;
   buf_out_tri_1_inst : tinv10 port map( A => n7, E => buf_oe, Y => buf_out(1))
                           ;
   buf_out_tri_2_inst : tinv10 port map( A => n6, E => buf_oe, Y => buf_out(2))
                           ;
   buf_out_tri_3_inst : tinv10 port map( A => n5, E => buf_oe, Y => buf_out(3))
                           ;
   buf_out_tri_4_inst : tinv10 port map( A => n4, E => buf_oe, Y => buf_out(4))
                           ;
   buf_out_tri_5_inst : tinv10 port map( A => n3, E => buf_oe, Y => buf_out(5))
                           ;
   buf_out_tri_6_inst : tinv10 port map( A => n2, E => buf_oe, Y => buf_out(6))
                           ;
   buf_out_tri_7_inst : tinv10 port map( A => n1, E => buf_oe, Y => buf_out(7))
                           ;
   U9 : iv110 port map( A => buf_in(0), Y => n8);
   U10 : iv110 port map( A => buf_in(1), Y => n7);
   U11 : iv110 port map( A => buf_in(2), Y => n6);
   U12 : iv110 port map( A => buf_in(3), Y => n5);
   U13 : iv110 port map( A => buf_in(4), Y => n4);
   U14 : iv110 port map( A => buf_in(5), Y => n3);
   U15 : iv110 port map( A => buf_in(6), Y => n2);
   U16 : iv110 port map( A => buf_in(7), Y => n1);

end synthesised;



