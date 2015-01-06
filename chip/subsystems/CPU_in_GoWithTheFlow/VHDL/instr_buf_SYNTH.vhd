
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of instr_buf is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12 : std_logic;

begin
   
   buf_out_tri_0_inst : tinv10 port map( A => n12, E => buf_oe, Y => buf_out(0)
                           );
   buf_out_tri_1_inst : tinv10 port map( A => n11, E => buf_oe, Y => buf_out(1)
                           );
   buf_out_tri_2_inst : tinv10 port map( A => n10, E => buf_oe, Y => buf_out(2)
                           );
   buf_out_tri_3_inst : tinv10 port map( A => n9, E => buf_oe, Y => buf_out(3))
                           ;
   buf_out_tri_4_inst : tinv10 port map( A => n8, E => buf_oe, Y => buf_out(4))
                           ;
   buf_out_tri_5_inst : tinv10 port map( A => n7, E => buf_oe, Y => buf_out(5))
                           ;
   buf_out_tri_6_inst : tinv10 port map( A => n6, E => buf_oe, Y => buf_out(6))
                           ;
   buf_out_tri_7_inst : tinv10 port map( A => n5, E => buf_oe, Y => buf_out(7))
                           ;
   buf_out_tri_8_inst : tinv10 port map( A => n4, E => buf_oe, Y => buf_out(8))
                           ;
   buf_out_tri_9_inst : tinv10 port map( A => n3, E => buf_oe, Y => buf_out(9))
                           ;
   buf_out_tri_10_inst : tinv10 port map( A => n2, E => buf_oe, Y => 
                           buf_out(10));
   buf_out_tri_11_inst : tinv10 port map( A => n1, E => buf_oe, Y => 
                           buf_out(11));
   U13 : iv110 port map( A => buf_in(3), Y => n9);
   U14 : iv110 port map( A => buf_in(4), Y => n8);
   U15 : iv110 port map( A => buf_in(5), Y => n7);
   U16 : iv110 port map( A => buf_in(6), Y => n6);
   U17 : iv110 port map( A => buf_in(7), Y => n5);
   U18 : iv110 port map( A => buf_in(8), Y => n4);
   U19 : iv110 port map( A => buf_in(9), Y => n3);
   U20 : iv110 port map( A => buf_in(10), Y => n2);
   U21 : iv110 port map( A => buf_in(0), Y => n12);
   U22 : iv110 port map( A => buf_in(1), Y => n11);
   U23 : iv110 port map( A => buf_in(2), Y => n10);
   U24 : iv110 port map( A => buf_in(11), Y => n1);

end synthesised;



