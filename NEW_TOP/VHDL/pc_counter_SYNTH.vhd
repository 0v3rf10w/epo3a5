
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of pc_counter is

   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal pc_out_7_port, pc_out_6_port, pc_out_5_port, pc_out_4_port, 
      pc_out_3_port, pc_out_2_port, pc_out_1_port, pc_out_0_port, n27, n28, n29
      , n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, 
      n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58
      , n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, 
      n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83 : std_logic;

begin
   pc_out <= ( pc_out_7_port, pc_out_6_port, pc_out_5_port, pc_out_4_port, 
      pc_out_3_port, pc_out_2_port, pc_out_1_port, pc_out_0_port );
   
   count_reg_0_inst : dfa11 port map( D => n34, CK => pc_en, R => pc_rst, Q => 
                           pc_out_0_port);
   count_reg_1_inst : dfa11 port map( D => n33, CK => pc_en, R => pc_rst, Q => 
                           pc_out_1_port);
   count_reg_2_inst : dfa11 port map( D => n32, CK => pc_en, R => pc_rst, Q => 
                           pc_out_2_port);
   count_reg_3_inst : dfa11 port map( D => n31, CK => pc_en, R => pc_rst, Q => 
                           pc_out_3_port);
   count_reg_4_inst : dfa11 port map( D => n30, CK => pc_en, R => pc_rst, Q => 
                           pc_out_4_port);
   count_reg_5_inst : dfa11 port map( D => n29, CK => pc_en, R => pc_rst, Q => 
                           pc_out_5_port);
   count_reg_6_inst : dfa11 port map( D => n28, CK => pc_en, R => pc_rst, Q => 
                           pc_out_6_port);
   count_reg_7_inst : dfa11 port map( D => n27, CK => pc_en, R => pc_rst, Q => 
                           pc_out_7_port);
   U37 : na210 port map( A => n35, B => n36, Y => n34);
   U38 : na210 port map( A => pc_in(0), B => n37, Y => n36);
   U39 : mu111 port map( A => n38, B => n39, S => pc_out_0_port, Y => n35);
   U40 : na210 port map( A => n40, B => n41, Y => n33);
   U41 : na210 port map( A => pc_in(1), B => n37, Y => n41);
   U42 : mu111 port map( A => n42, B => n43, S => pc_out_1_port, Y => n40);
   U43 : na210 port map( A => pc_inc, B => pc_out_0_port, Y => n42);
   U44 : na210 port map( A => n44, B => n45, Y => n32);
   U45 : na210 port map( A => pc_in(2), B => n37, Y => n45);
   U46 : mu111 port map( A => n46, B => n47, S => pc_out_2_port, Y => n44);
   U47 : no210 port map( A => n48, B => n49, Y => n47);
   U48 : iv110 port map( A => n43, Y => n49);
   U49 : no210 port map( A => n50, B => n51, Y => n43);
   U50 : no210 port map( A => n38, B => pc_out_0_port, Y => n51);
   U51 : no210 port map( A => pc_out_1_port, B => n38, Y => n48);
   U52 : na310 port map( A => pc_inc, B => pc_out_0_port, C => pc_out_1_port, Y
                           => n46);
   U53 : na210 port map( A => n52, B => n53, Y => n31);
   U54 : na210 port map( A => pc_in(3), B => n37, Y => n53);
   U55 : mu111 port map( A => n54, B => n55, S => pc_out_3_port, Y => n52);
   U56 : iv110 port map( A => n56, Y => n55);
   U57 : na210 port map( A => n57, B => pc_inc, Y => n54);
   U58 : na210 port map( A => n58, B => n59, Y => n30);
   U59 : na210 port map( A => pc_in(4), B => n37, Y => n59);
   U60 : mu111 port map( A => n60, B => n61, S => pc_out_4_port, Y => n58);
   U61 : no210 port map( A => n62, B => n56, Y => n61);
   U62 : na210 port map( A => n39, B => n63, Y => n56);
   U63 : na210 port map( A => pc_inc, B => n64, Y => n63);
   U64 : iv110 port map( A => n50, Y => n39);
   U65 : no210 port map( A => pc_out_3_port, B => n38, Y => n62);
   U66 : na310 port map( A => n57, B => pc_inc, C => pc_out_3_port, Y => n60);
   U67 : na210 port map( A => n65, B => n66, Y => n29);
   U68 : na210 port map( A => pc_in(5), B => n37, Y => n66);
   U69 : mu111 port map( A => n67, B => n68, S => n69, Y => n65);
   U70 : na210 port map( A => n70, B => pc_inc, Y => n68);
   U71 : na210 port map( A => n71, B => n72, Y => n28);
   U72 : na210 port map( A => pc_in(6), B => n37, Y => n72);
   U73 : iv110 port map( A => n73, Y => n71);
   U74 : mu111 port map( A => n74, B => n75, S => pc_out_6_port, Y => n73);
   U75 : na210 port map( A => n76, B => n77, Y => n27);
   U76 : na210 port map( A => pc_in(7), B => n37, Y => n77);
   U77 : no210 port map( A => n50, B => pc_inc, Y => n37);
   U78 : mu111 port map( A => n78, B => n79, S => pc_out_7_port, Y => n76);
   U79 : no210 port map( A => n80, B => n75, Y => n79);
   U80 : na210 port map( A => n67, B => n81, Y => n75);
   U81 : na210 port map( A => pc_inc, B => n69, Y => n81);
   U82 : no210 port map( A => n50, B => n82, Y => n67);
   U83 : no210 port map( A => n38, B => n70, Y => n82);
   U84 : iv110 port map( A => n83, Y => n70);
   U85 : no210 port map( A => pc_ld, B => pc_inc, Y => n50);
   U86 : no210 port map( A => pc_out_6_port, B => n38, Y => n80);
   U87 : na210 port map( A => n74, B => pc_out_6_port, Y => n78);
   U88 : no310 port map( A => n83, B => n38, C => n69, Y => n74);
   U89 : iv110 port map( A => pc_out_5_port, Y => n69);
   U90 : iv110 port map( A => pc_inc, Y => n38);
   U91 : na310 port map( A => pc_out_3_port, B => n57, C => pc_out_4_port, Y =>
                           n83);
   U92 : iv110 port map( A => n64, Y => n57);
   U93 : na310 port map( A => pc_out_1_port, B => pc_out_0_port, C => 
                           pc_out_2_port, Y => n64);

end synthesised;



