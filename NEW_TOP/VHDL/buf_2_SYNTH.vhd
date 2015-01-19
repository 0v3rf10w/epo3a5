
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of buf_2 is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   signal n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13 : std_logic;

begin
   
   buf_out_tri_0_inst : tinv10 port map( A => n11, E => n4, Y => buf_out(0));
   buf_out_tri_1_inst : tinv10 port map( A => n10, E => n4, Y => buf_out(1));
   buf_out_tri_2_inst : tinv10 port map( A => n9, E => n4, Y => buf_out(2));
   buf_out_tri_3_inst : tinv10 port map( A => n8, E => n4, Y => buf_out(3));
   buf_out_tri_4_inst : tinv10 port map( A => n7, E => n4, Y => buf_out(4));
   buf_out_tri_5_inst : tinv10 port map( A => n6, E => n4, Y => buf_out(5));
   buf_out_tri_6_inst : tinv10 port map( A => n5, E => n4, Y => buf_out(6));
   buf_out_tri_7_inst : tinv10 port map( A => n3, E => n4, Y => buf_out(7));
   U12 : iv110 port map( A => buf_in(2), Y => n9);
   U13 : iv110 port map( A => buf_in(3), Y => n8);
   U14 : iv110 port map( A => buf_in(4), Y => n7);
   U15 : iv110 port map( A => buf_in(5), Y => n6);
   U16 : iv110 port map( A => buf_in(6), Y => n5);
   U17 : iv110 port map( A => n12, Y => n4);
   U18 : na310 port map( A => buf_oe(4), B => buf_oe(1), C => n13, Y => n12);
   U19 : no310 port map( A => buf_oe(0), B => buf_oe(3), C => buf_oe(2), Y => 
                           n13);
   U20 : iv110 port map( A => buf_in(7), Y => n3);
   U21 : iv110 port map( A => buf_in(0), Y => n11);
   U22 : iv110 port map( A => buf_in(1), Y => n10);

end synthesised;



