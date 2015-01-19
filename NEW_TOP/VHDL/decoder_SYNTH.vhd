
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
   
   signal decoder_bregld_4_port, decoder_bbufoe_4_port, n45, n46, n47, n48, n49
      , n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, 
      n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78
      , n79, n80, n81, n82 : std_logic;

begin
   decoder_abufoe <= decoder_bregld_4_port;
   decoder_bregld <= ( decoder_bregld_4_port, decoder_in(3), decoder_in(2), 
      decoder_in(1), decoder_in(0) );
   decoder_bbufoe <= ( decoder_bbufoe_4_port, decoder_in(3), decoder_in(2), 
      decoder_in(1), decoder_in(0) );
   decoder_argout <= ( decoder_in(7), decoder_in(6), decoder_in(5), 
      decoder_in(4), decoder_in(3), decoder_in(2), decoder_in(1), decoder_in(0)
      );
   
   U52 : no210 port map( A => decoder_in(11), B => n45, Y => decoder_pc_ld);
   U53 : iv110 port map( A => n46, Y => n45);
   U54 : na210 port map( A => n47, B => n48, Y => n46);
   U55 : na210 port map( A => n49, B => n50, Y => n48);
   U56 : na210 port map( A => n51, B => n52, Y => n50);
   U57 : na310 port map( A => decoder_c, B => n53, C => n52, Y => n47);
   U58 : na310 port map( A => n54, B => n55, C => n56, Y => decoder_pc_inc);
   U59 : na210 port map( A => n57, B => n53, Y => n56);
   U60 : iv110 port map( A => n58, Y => n53);
   U61 : na210 port map( A => decoder_c, B => n52, Y => n57);
   U62 : na210 port map( A => n59, B => n52, Y => n54);
   U63 : na210 port map( A => n60, B => n61, Y => n52);
   U64 : na210 port map( A => n62, B => n63, Y => n61);
   U65 : na210 port map( A => n64, B => n65, Y => n59);
   U66 : na210 port map( A => n51, B => n49, Y => n65);
   U67 : na210 port map( A => decoder_z, B => decoder_in(8), Y => n51);
   U68 : no210 port map( A => n66, B => n67, Y => decoder_ibufoe);
   U69 : no210 port map( A => n68, B => n69, Y => n67);
   U70 : no210 port map( A => decoder_in(10), B => n70, Y => n68);
   U71 : iv110 port map( A => n71, Y => n66);
   U72 : no310 port map( A => n60, B => decoder_in(11), C => n49, Y => 
                           decoder_bregld_4_port);
   U73 : no210 port map( A => n72, B => n73, Y => decoder_bbufoe_4_port);
   U74 : mu111 port map( A => n71, B => n74, S => decoder_in(9), Y => n73);
   U75 : no210 port map( A => n49, B => n71, Y => n74);
   U76 : iv110 port map( A => n70, Y => n72);
   U77 : na210 port map( A => n71, B => n75, Y => n70);
   U78 : na210 port map( A => n55, B => n62, Y => n75);
   U79 : na210 port map( A => decoder_in(11), B => decoder_in(8), Y => n71);
   U80 : na210 port map( A => n76, B => n77, Y => decoder_aregld);
   U81 : na210 port map( A => n69, B => decoder_in(8), Y => n77);
   U82 : mu111 port map( A => n78, B => n79, S => decoder_in(11), Y => n76);
   U83 : na210 port map( A => n79, B => n62, Y => n78);
   U84 : iv110 port map( A => decoder_in(8), Y => n62);
   U85 : no210 port map( A => n63, B => n49, Y => n79);
   U86 : no210 port map( A => n64, B => n55, Y => decoder_alu(2));
   U87 : mu111 port map( A => decoder_in(9), B => n60, S => decoder_in(10), Y 
                           => n64);
   U88 : na210 port map( A => decoder_in(9), B => decoder_in(8), Y => n60);
   U89 : no210 port map( A => n58, B => n55, Y => decoder_alu(1));
   U90 : no210 port map( A => n69, B => n80, Y => n58);
   U91 : no210 port map( A => n49, B => decoder_in(8), Y => n80);
   U92 : no210 port map( A => n49, B => decoder_in(9), Y => n69);
   U93 : no210 port map( A => n81, B => n55, Y => decoder_alu(0));
   U94 : iv110 port map( A => decoder_in(11), Y => n55);
   U95 : no210 port map( A => n82, B => n49, Y => n81);
   U96 : iv110 port map( A => decoder_in(10), Y => n49);
   U97 : no210 port map( A => decoder_in(8), B => n63, Y => n82);
   U98 : iv110 port map( A => decoder_in(9), Y => n63);

end synthesised;



