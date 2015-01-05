
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of decoder is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   signal decoder_bregld_4_port, decoder_bbufoe_4_port, n47, n48, n49, n50, n51
      , n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, 
      n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80
      , n81, n82, n83, n84, n85, n86 : std_logic;

begin
   decoder_abufoe <= decoder_bregld_4_port;
   decoder_bregld <= ( decoder_bregld_4_port, decoder_in(3), decoder_in(2), 
      decoder_in(1), decoder_in(0) );
   decoder_bbufoe <= ( decoder_bbufoe_4_port, decoder_in(3), decoder_in(2), 
      decoder_in(1), decoder_in(0) );
   decoder_argout <= ( decoder_in(7), decoder_in(6), decoder_in(5), 
      decoder_in(4), decoder_in(3), decoder_in(2), decoder_in(1), decoder_in(0)
      );
   
   U55 : iv110 port map( A => n47, Y => decoder_pc_ld);
   U56 : na210 port map( A => n48, B => n49, Y => n47);
   U57 : na210 port map( A => n50, B => n51, Y => n49);
   U58 : na210 port map( A => n52, B => n53, Y => n51);
   U59 : na210 port map( A => n54, B => n55, Y => n53);
   U60 : na310 port map( A => decoder_c, B => n56, C => n55, Y => n50);
   U61 : na310 port map( A => n57, B => n48, C => n58, Y => decoder_pc_inc);
   U62 : na210 port map( A => n59, B => n56, Y => n58);
   U63 : na210 port map( A => decoder_c, B => n55, Y => n59);
   U64 : na210 port map( A => n60, B => n55, Y => n57);
   U65 : na210 port map( A => n61, B => n62, Y => n55);
   U66 : na210 port map( A => n63, B => n64, Y => n62);
   U67 : na210 port map( A => n65, B => n66, Y => n60);
   U68 : na210 port map( A => n54, B => n52, Y => n66);
   U69 : na210 port map( A => decoder_z, B => decoder_in(8), Y => n54);
   U70 : no210 port map( A => n67, B => n68, Y => decoder_ibufoe);
   U71 : no210 port map( A => n69, B => n70, Y => n68);
   U72 : no210 port map( A => decoder_in(10), B => n71, Y => n69);
   U73 : no310 port map( A => n61, B => decoder_in(11), C => n52, Y => 
                           decoder_bregld_4_port);
   U74 : no210 port map( A => n72, B => n73, Y => decoder_bbufoe_4_port);
   U75 : mu111 port map( A => n74, B => n75, S => n64, Y => n73);
   U76 : no210 port map( A => n52, B => n75, Y => n74);
   U77 : iv110 port map( A => n71, Y => n72);
   U78 : na210 port map( A => n75, B => n76, Y => n71);
   U79 : na210 port map( A => n48, B => n63, Y => n76);
   U80 : iv110 port map( A => n67, Y => n75);
   U81 : no210 port map( A => n48, B => n63, Y => n67);
   U82 : na210 port map( A => n77, B => n78, Y => decoder_aregld);
   U83 : na210 port map( A => decoder_in(9), B => n79, Y => n78);
   U84 : mu111 port map( A => n80, B => decoder_in(11), S => n52, Y => n79);
   U85 : no210 port map( A => decoder_in(8), B => decoder_in(11), Y => n80);
   U86 : mu111 port map( A => n81, B => n82, S => n63, Y => n77);
   U87 : na210 port map( A => decoder_in(11), B => n64, Y => n82);
   U88 : no210 port map( A => n65, B => n48, Y => decoder_alu(2));
   U89 : mu111 port map( A => n61, B => decoder_in(9), S => n52, Y => n65);
   U90 : na210 port map( A => decoder_in(9), B => decoder_in(8), Y => n61);
   U91 : iv110 port map( A => n83, Y => decoder_alu(1));
   U92 : na210 port map( A => n56, B => decoder_in(11), Y => n83);
   U93 : na210 port map( A => n81, B => n84, Y => n56);
   U94 : na210 port map( A => decoder_in(10), B => n63, Y => n84);
   U95 : iv110 port map( A => decoder_in(8), Y => n63);
   U96 : iv110 port map( A => n70, Y => n81);
   U97 : no210 port map( A => n52, B => decoder_in(9), Y => n70);
   U98 : no210 port map( A => n85, B => n48, Y => decoder_alu(0));
   U99 : iv110 port map( A => decoder_in(11), Y => n48);
   U100 : no210 port map( A => n86, B => n52, Y => n85);
   U101 : iv110 port map( A => decoder_in(10), Y => n52);
   U102 : no210 port map( A => decoder_in(8), B => n64, Y => n86);
   U103 : iv110 port map( A => decoder_in(9), Y => n64);

end synthesised;



