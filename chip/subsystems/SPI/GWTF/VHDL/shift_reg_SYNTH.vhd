
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of shift_reg is

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
      output_3_port, output_2_port, output_1_port, output_0_port, n27, n28, n29
      , n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, 
      n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58
      , n59, n60 : std_logic;

begin
   output <= ( output_7_port, output_6_port, output_5_port, output_4_port, 
      output_3_port, output_2_port, output_1_port, output_0_port );
   
   reg_shift_reg_0_inst : dfa11 port map( D => n34, CK => clk, R => reset, Q =>
                           output_0_port);
   reg_shift_reg_1_inst : dfa11 port map( D => n33, CK => clk, R => reset, Q =>
                           output_1_port);
   reg_shift_reg_2_inst : dfa11 port map( D => n32, CK => clk, R => reset, Q =>
                           output_2_port);
   reg_shift_reg_3_inst : dfa11 port map( D => n31, CK => clk, R => reset, Q =>
                           output_3_port);
   reg_shift_reg_4_inst : dfa11 port map( D => n30, CK => clk, R => reset, Q =>
                           output_4_port);
   reg_shift_reg_5_inst : dfa11 port map( D => n29, CK => clk, R => reset, Q =>
                           output_5_port);
   reg_shift_reg_6_inst : dfa11 port map( D => n28, CK => clk, R => reset, Q =>
                           output_6_port);
   reg_shift_reg_7_inst : dfa11 port map( D => n27, CK => clk, R => reset, Q =>
                           output_7_port);
   U36 : na310 port map( A => n35, B => n36, C => n37, Y => n34);
   U37 : na210 port map( A => reg_write(0), B => reg_set, Y => n37);
   U38 : na210 port map( A => shift_in, B => n38, Y => n36);
   U39 : na210 port map( A => output_0_port, B => n39, Y => n35);
   U40 : na310 port map( A => n40, B => n41, C => n42, Y => n33);
   U41 : na210 port map( A => reg_write(1), B => reg_set, Y => n42);
   U42 : na210 port map( A => output_0_port, B => n38, Y => n41);
   U43 : na210 port map( A => output_1_port, B => n39, Y => n40);
   U44 : na310 port map( A => n43, B => n44, C => n45, Y => n32);
   U45 : na210 port map( A => reg_write(2), B => reg_set, Y => n45);
   U46 : na210 port map( A => output_1_port, B => n38, Y => n44);
   U47 : na210 port map( A => output_2_port, B => n39, Y => n43);
   U48 : na310 port map( A => n46, B => n47, C => n48, Y => n31);
   U49 : na210 port map( A => reg_write(3), B => reg_set, Y => n48);
   U50 : na210 port map( A => output_2_port, B => n38, Y => n47);
   U51 : na210 port map( A => output_3_port, B => n39, Y => n46);
   U52 : na310 port map( A => n49, B => n50, C => n51, Y => n30);
   U53 : na210 port map( A => reg_write(4), B => reg_set, Y => n51);
   U54 : na210 port map( A => output_3_port, B => n38, Y => n50);
   U55 : na210 port map( A => output_4_port, B => n39, Y => n49);
   U56 : na310 port map( A => n52, B => n53, C => n54, Y => n29);
   U57 : na210 port map( A => reg_write(5), B => reg_set, Y => n54);
   U58 : na210 port map( A => output_4_port, B => n38, Y => n53);
   U59 : na210 port map( A => output_5_port, B => n39, Y => n52);
   U60 : na310 port map( A => n55, B => n56, C => n57, Y => n28);
   U61 : na210 port map( A => reg_write(6), B => reg_set, Y => n57);
   U62 : na210 port map( A => output_5_port, B => n38, Y => n56);
   U63 : na210 port map( A => output_6_port, B => n39, Y => n55);
   U64 : na310 port map( A => n58, B => n59, C => n60, Y => n27);
   U65 : na210 port map( A => reg_write(7), B => reg_set, Y => n60);
   U66 : na210 port map( A => output_6_port, B => n38, Y => n59);
   U67 : no210 port map( A => n39, B => reg_set, Y => n38);
   U68 : na210 port map( A => output_7_port, B => n39, Y => n58);
   U69 : no210 port map( A => enable, B => reg_set, Y => n39);

end synthesised;



