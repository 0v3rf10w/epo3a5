
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of shift_reg is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal output_7_port, output_6_port, output_5_port, output_4_port, 
      output_3_port, output_2_port, output_1_port, output_0_port, n1, n28, n29,
      n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44
      , n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, 
      n59, n60, n61 : std_logic;

begin
   output <= ( output_7_port, output_6_port, output_5_port, output_4_port, 
      output_3_port, output_2_port, output_1_port, output_0_port );
   
   reg_shift_reg_0_inst : dfa11 port map( D => n35, CK => n1, R => reset, Q => 
                           output_0_port);
   reg_shift_reg_1_inst : dfa11 port map( D => n34, CK => n1, R => reset, Q => 
                           output_1_port);
   reg_shift_reg_2_inst : dfa11 port map( D => n33, CK => n1, R => reset, Q => 
                           output_2_port);
   reg_shift_reg_3_inst : dfa11 port map( D => n32, CK => n1, R => reset, Q => 
                           output_3_port);
   reg_shift_reg_4_inst : dfa11 port map( D => n31, CK => n1, R => reset, Q => 
                           output_4_port);
   reg_shift_reg_5_inst : dfa11 port map( D => n30, CK => n1, R => reset, Q => 
                           output_5_port);
   reg_shift_reg_6_inst : dfa11 port map( D => n29, CK => n1, R => reset, Q => 
                           output_6_port);
   reg_shift_reg_7_inst : dfa11 port map( D => n28, CK => n1, R => reset, Q => 
                           output_7_port);
   U37 : na310 port map( A => n36, B => n37, C => n38, Y => n35);
   U38 : na210 port map( A => reg_write(0), B => reg_set, Y => n38);
   U39 : na210 port map( A => shift_in, B => n39, Y => n37);
   U40 : na210 port map( A => output_0_port, B => n40, Y => n36);
   U41 : na310 port map( A => n41, B => n42, C => n43, Y => n34);
   U42 : na210 port map( A => reg_write(1), B => reg_set, Y => n43);
   U43 : na210 port map( A => output_0_port, B => n39, Y => n42);
   U44 : na210 port map( A => output_1_port, B => n40, Y => n41);
   U45 : na310 port map( A => n44, B => n45, C => n46, Y => n33);
   U46 : na210 port map( A => reg_write(2), B => reg_set, Y => n46);
   U47 : na210 port map( A => output_1_port, B => n39, Y => n45);
   U48 : na210 port map( A => output_2_port, B => n40, Y => n44);
   U49 : na310 port map( A => n47, B => n48, C => n49, Y => n32);
   U50 : na210 port map( A => reg_write(3), B => reg_set, Y => n49);
   U51 : na210 port map( A => output_2_port, B => n39, Y => n48);
   U52 : na210 port map( A => output_3_port, B => n40, Y => n47);
   U53 : na310 port map( A => n50, B => n51, C => n52, Y => n31);
   U54 : na210 port map( A => reg_write(4), B => reg_set, Y => n52);
   U55 : na210 port map( A => output_3_port, B => n39, Y => n51);
   U56 : na210 port map( A => output_4_port, B => n40, Y => n50);
   U57 : na310 port map( A => n53, B => n54, C => n55, Y => n30);
   U58 : na210 port map( A => reg_write(5), B => reg_set, Y => n55);
   U59 : na210 port map( A => output_4_port, B => n39, Y => n54);
   U60 : na210 port map( A => output_5_port, B => n40, Y => n53);
   U61 : na310 port map( A => n56, B => n57, C => n58, Y => n29);
   U62 : na210 port map( A => reg_write(6), B => reg_set, Y => n58);
   U63 : na210 port map( A => output_5_port, B => n39, Y => n57);
   U64 : na210 port map( A => output_6_port, B => n40, Y => n56);
   U65 : na310 port map( A => n59, B => n60, C => n61, Y => n28);
   U66 : na210 port map( A => reg_write(7), B => reg_set, Y => n61);
   U67 : na210 port map( A => output_6_port, B => n39, Y => n60);
   U68 : no210 port map( A => n40, B => reg_set, Y => n39);
   U69 : na210 port map( A => output_7_port, B => n40, Y => n59);
   U70 : no210 port map( A => enable, B => reg_set, Y => n40);
   U71 : iv110 port map( A => clk, Y => n1);

end synthesised;



