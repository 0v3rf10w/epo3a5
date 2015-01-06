
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of buf_5 is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   signal n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15 : std_logic;

begin
   
   buf_out_tri_0_inst : tinv10 port map( A => n12, E => n5, Y => buf_out(0));
   buf_out_tri_1_inst : tinv10 port map( A => n11, E => n5, Y => buf_out(1));
   buf_out_tri_2_inst : tinv10 port map( A => n10, E => n5, Y => buf_out(2));
   buf_out_tri_3_inst : tinv10 port map( A => n9, E => n5, Y => buf_out(3));
   buf_out_tri_4_inst : tinv10 port map( A => n8, E => n5, Y => buf_out(4));
   buf_out_tri_5_inst : tinv10 port map( A => n7, E => n5, Y => buf_out(5));
   buf_out_tri_6_inst : tinv10 port map( A => n6, E => n5, Y => buf_out(6));
   buf_out_tri_7_inst : tinv10 port map( A => n4, E => n5, Y => buf_out(7));
   U13 : iv110 port map( A => buf_in(3), Y => n9);
   U14 : iv110 port map( A => buf_in(4), Y => n8);
   U15 : iv110 port map( A => buf_in(5), Y => n7);
   U16 : iv110 port map( A => buf_in(6), Y => n6);
   U17 : no210 port map( A => n13, B => n14, Y => n5);
   U18 : na210 port map( A => buf_oe(4), B => buf_oe(2), Y => n14);
   U19 : na210 port map( A => n15, B => buf_oe(0), Y => n13);
   U20 : no210 port map( A => buf_oe(3), B => buf_oe(1), Y => n15);
   U21 : iv110 port map( A => buf_in(7), Y => n4);
   U22 : iv110 port map( A => buf_in(0), Y => n12);
   U23 : iv110 port map( A => buf_in(1), Y => n11);
   U24 : iv110 port map( A => buf_in(2), Y => n10);

end synthesised;



