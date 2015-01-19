
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of alu is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal alu_c_port, N43, N44, N45, N46, N47, N48, N49, N50, alu_add_8_port, 
      N74, n4, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116
      , n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
      n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, 
      n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, 
      n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, 
      n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, 
      r64_n46, r64_n45, r64_n44, r64_n43, r64_n42, r64_n41, r64_n40, r64_n39, 
      r64_n38, r64_n37, r64_n36, r64_n35, r64_n34, r64_n33, r64_n32, r64_n31, 
      r64_n30, r64_n29, r64_n28, r64_n27, r64_n26, r64_n25, r64_n24, r64_n23, 
      r64_n22, r64_n21, r64_n20, r64_n19, r64_n18, r64_n17, r64_n16, r64_n15, 
      r64_n14, r64_n13, r64_n12, r64_n11, r64_n10, r64_n9, r64_n8, r64_n7, 
      r64_n6, r64_n5, r64_n4, r64_n3, r64_n2, r64_n1 : std_logic;

begin
   alu_c <= alu_c_port;
   
   n4 <= '0';
   alu_c_reg : dfn10 port map( D => n106, CK => alu_clk, Q => alu_c_port);
   alu_z_reg : dfn10 port map( D => N74, CK => alu_clk, Q => alu_z);
   U113 : no310 port map( A => opcode(1), B => opcode(2), C => n158, Y => n107)
                           ;
   U114 : na310 port map( A => n108, B => n109, C => n110, Y => n106);
   U115 : na210 port map( A => n111, B => n112, Y => n110);
   U116 : iv110 port map( A => opcode(2), Y => n112);
   U117 : na210 port map( A => n113, B => n114, Y => n111);
   U118 : iv110 port map( A => alu_c_port, Y => n114);
   U119 : na210 port map( A => opcode(1), B => opcode(0), Y => n113);
   U120 : na310 port map( A => opcode(0), B => alu_add_8_port, C => n115, Y => 
                           n109);
   U121 : iv110 port map( A => n116, Y => n115);
   U122 : na210 port map( A => opcode(1), B => alu_c_port, Y => n108);
   U123 : na210 port map( A => n117, B => n118, Y => alu_y(7));
   U124 : na210 port map( A => N50, B => n119, Y => n118);
   U125 : mu111 port map( A => n120, B => n121, S => alu_A(7), Y => n117);
   U126 : no210 port map( A => n122, B => n123, Y => n121);
   U127 : mu111 port map( A => n107, B => n125, S => alu_B(7), Y => n123);
   U128 : na210 port map( A => alu_B(7), B => n124, Y => n120);
   U129 : na210 port map( A => n126, B => n127, Y => alu_y(6));
   U130 : na210 port map( A => N49, B => n119, Y => n127);
   U131 : mu111 port map( A => n128, B => n129, S => alu_A(6), Y => n126);
   U132 : no210 port map( A => n122, B => n130, Y => n129);
   U133 : mu111 port map( A => n107, B => n125, S => alu_B(6), Y => n130);
   U134 : na210 port map( A => alu_B(6), B => n124, Y => n128);
   U135 : na210 port map( A => n131, B => n132, Y => alu_y(5));
   U136 : na210 port map( A => N48, B => n119, Y => n132);
   U137 : mu111 port map( A => n133, B => n134, S => alu_A(5), Y => n131);
   U138 : no210 port map( A => n122, B => n135, Y => n134);
   U139 : mu111 port map( A => n107, B => n125, S => alu_B(5), Y => n135);
   U140 : na210 port map( A => alu_B(5), B => n124, Y => n133);
   U141 : na210 port map( A => n136, B => n137, Y => alu_y(4));
   U142 : na210 port map( A => N47, B => n119, Y => n137);
   U143 : mu111 port map( A => n138, B => n139, S => alu_A(4), Y => n136);
   U144 : no210 port map( A => n122, B => n140, Y => n139);
   U145 : mu111 port map( A => n107, B => n125, S => alu_B(4), Y => n140);
   U146 : na210 port map( A => alu_B(4), B => n124, Y => n138);
   U147 : na210 port map( A => n141, B => n142, Y => alu_y(3));
   U148 : na210 port map( A => N46, B => n119, Y => n142);
   U149 : mu111 port map( A => n143, B => n144, S => alu_A(3), Y => n141);
   U150 : no210 port map( A => n122, B => n145, Y => n144);
   U151 : mu111 port map( A => n107, B => n125, S => alu_B(3), Y => n145);
   U152 : na210 port map( A => alu_B(3), B => n124, Y => n143);
   U153 : na210 port map( A => n146, B => n147, Y => alu_y(2));
   U154 : na210 port map( A => N45, B => n119, Y => n147);
   U155 : mu111 port map( A => n148, B => n149, S => alu_A(2), Y => n146);
   U156 : no210 port map( A => n122, B => n150, Y => n149);
   U157 : mu111 port map( A => n107, B => n125, S => alu_B(2), Y => n150);
   U158 : na210 port map( A => alu_B(2), B => n124, Y => n148);
   U159 : na210 port map( A => n151, B => n152, Y => alu_y(1));
   U160 : na210 port map( A => N44, B => n119, Y => n152);
   U161 : mu111 port map( A => n153, B => n154, S => alu_A(1), Y => n151);
   U162 : no210 port map( A => n122, B => n155, Y => n154);
   U163 : mu111 port map( A => n107, B => n125, S => alu_B(1), Y => n155);
   U164 : na210 port map( A => alu_B(1), B => n124, Y => n153);
   U165 : na210 port map( A => n156, B => n157, Y => alu_y(0));
   U166 : na210 port map( A => N43, B => n119, Y => n157);
   U167 : no210 port map( A => n116, B => n158, Y => n119);
   U168 : na210 port map( A => opcode(2), B => n159, Y => n116);
   U169 : mu111 port map( A => n160, B => n161, S => alu_A(0), Y => n156);
   U170 : no210 port map( A => n122, B => n162, Y => n161);
   U171 : mu111 port map( A => n107, B => n125, S => alu_B(0), Y => n162);
   U172 : no310 port map( A => opcode(1), B => opcode(2), C => opcode(0), Y => 
                           n122);
   U173 : na210 port map( A => alu_B(0), B => n124, Y => n160);
   U174 : no310 port map( A => opcode(1), B => opcode(2), C => n158, Y => n124)
                           ;
   U175 : iv110 port map( A => opcode(0), Y => n158);
   U176 : no210 port map( A => n163, B => n164, Y => N74);
   U177 : na310 port map( A => n165, B => n166, C => n167, Y => n164);
   U178 : iv110 port map( A => n168, Y => n167);
   U179 : na210 port map( A => n169, B => n125, Y => n168);
   U180 : no310 port map( A => opcode(0), B => opcode(2), C => n159, Y => n125)
                           ;
   U181 : iv110 port map( A => opcode(1), Y => n159);
   U182 : na210 port map( A => alu_B(7), B => alu_A(7), Y => n169);
   U183 : na210 port map( A => alu_A(5), B => alu_B(5), Y => n166);
   U184 : na210 port map( A => alu_A(6), B => alu_B(6), Y => n165);
   U185 : na310 port map( A => n170, B => n171, C => n172, Y => n163);
   U186 : iv110 port map( A => n173, Y => n172);
   U187 : na310 port map( A => n174, B => n175, C => n176, Y => n173);
   U188 : na210 port map( A => alu_B(1), B => alu_A(1), Y => n176);
   U189 : na210 port map( A => alu_B(0), B => alu_A(0), Y => n175);
   U190 : na210 port map( A => alu_B(2), B => alu_A(2), Y => n174);
   U191 : na210 port map( A => alu_A(3), B => alu_B(3), Y => n171);
   U192 : na210 port map( A => alu_A(4), B => alu_B(4), Y => n170);
   r64_U55 : ex210 port map( A => alu_B(0), B => alu_A(0), Y => N43);
   r64_U54 : na210 port map( A => alu_B(0), B => alu_A(0), Y => r64_n46);
   r64_U53 : ex210 port map( A => alu_B(1), B => alu_A(1), Y => r64_n45);
   r64_U52 : ex210 port map( A => r64_n11, B => r64_n45, Y => N44);
   r64_U51 : na210 port map( A => alu_A(1), B => r64_n11, Y => r64_n42);
   r64_U50 : no210 port map( A => alu_A(1), B => r64_n11, Y => r64_n44);
   r64_U49 : na210 port map( A => alu_B(1), B => r64_n10, Y => r64_n43);
   r64_U48 : na210 port map( A => r64_n42, B => r64_n43, Y => r64_n40);
   r64_U47 : ex210 port map( A => alu_B(2), B => alu_A(2), Y => r64_n41);
   r64_U46 : ex210 port map( A => r64_n40, B => r64_n41, Y => N45);
   r64_U45 : ex210 port map( A => r64_n7, B => alu_B(3), Y => r64_n36);
   r64_U44 : na210 port map( A => alu_A(2), B => r64_n40, Y => r64_n37);
   r64_U43 : no210 port map( A => r64_n40, B => alu_A(2), Y => r64_n39);
   r64_U42 : na210 port map( A => alu_B(2), B => r64_n9, Y => r64_n38);
   r64_U41 : na210 port map( A => r64_n37, B => r64_n38, Y => r64_n35);
   r64_U40 : ex210 port map( A => r64_n36, B => r64_n8, Y => N46);
   r64_U39 : na210 port map( A => alu_A(3), B => r64_n35, Y => r64_n32);
   r64_U38 : na210 port map( A => r64_n8, B => r64_n7, Y => r64_n34);
   r64_U37 : na210 port map( A => alu_B(3), B => r64_n34, Y => r64_n33);
   r64_U36 : na210 port map( A => r64_n32, B => r64_n33, Y => r64_n30);
   r64_U35 : ex210 port map( A => alu_B(4), B => alu_A(4), Y => r64_n31);
   r64_U34 : ex210 port map( A => r64_n30, B => r64_n31, Y => N47);
   r64_U33 : ex210 port map( A => r64_n4, B => alu_B(5), Y => r64_n26);
   r64_U32 : na210 port map( A => alu_A(4), B => r64_n30, Y => r64_n27);
   r64_U31 : no210 port map( A => r64_n30, B => alu_A(4), Y => r64_n29);
   r64_U30 : na210 port map( A => alu_B(4), B => r64_n6, Y => r64_n28);
   r64_U29 : na210 port map( A => r64_n27, B => r64_n28, Y => r64_n25);
   r64_U28 : ex210 port map( A => r64_n26, B => r64_n5, Y => N48);
   r64_U27 : na210 port map( A => alu_A(5), B => r64_n25, Y => r64_n22);
   r64_U26 : na210 port map( A => r64_n5, B => r64_n4, Y => r64_n24);
   r64_U25 : na210 port map( A => alu_B(5), B => r64_n24, Y => r64_n23);
   r64_U24 : na210 port map( A => r64_n22, B => r64_n23, Y => r64_n20);
   r64_U23 : ex210 port map( A => alu_B(6), B => alu_A(6), Y => r64_n21);
   r64_U22 : ex210 port map( A => r64_n20, B => r64_n21, Y => N49);
   r64_U21 : ex210 port map( A => r64_n1, B => alu_B(7), Y => r64_n16);
   r64_U20 : na210 port map( A => alu_A(6), B => r64_n20, Y => r64_n17);
   r64_U19 : no210 port map( A => r64_n20, B => alu_A(6), Y => r64_n19);
   r64_U18 : na210 port map( A => alu_B(6), B => r64_n3, Y => r64_n18);
   r64_U17 : na210 port map( A => r64_n17, B => r64_n18, Y => r64_n15);
   r64_U16 : ex210 port map( A => r64_n16, B => r64_n2, Y => N50);
   r64_U15 : na210 port map( A => alu_A(7), B => r64_n15, Y => r64_n12);
   r64_U14 : na210 port map( A => r64_n2, B => r64_n1, Y => r64_n14);
   r64_U13 : na210 port map( A => alu_B(7), B => r64_n14, Y => r64_n13);
   r64_U12 : na210 port map( A => r64_n12, B => r64_n13, Y => alu_add_8_port);
   r64_U11 : iv110 port map( A => r64_n46, Y => r64_n11);
   r64_U10 : iv110 port map( A => r64_n44, Y => r64_n10);
   r64_U9 : iv110 port map( A => r64_n39, Y => r64_n9);
   r64_U8 : iv110 port map( A => r64_n35, Y => r64_n8);
   r64_U7 : iv110 port map( A => alu_A(3), Y => r64_n7);
   r64_U6 : iv110 port map( A => r64_n29, Y => r64_n6);
   r64_U5 : iv110 port map( A => r64_n25, Y => r64_n5);
   r64_U4 : iv110 port map( A => alu_A(5), Y => r64_n4);
   r64_U3 : iv110 port map( A => r64_n19, Y => r64_n3);
   r64_U2 : iv110 port map( A => r64_n15, Y => r64_n2);
   r64_U1 : iv110 port map( A => alu_A(7), Y => r64_n1);

end synthesised;



