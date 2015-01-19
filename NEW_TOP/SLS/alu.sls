extern network dfn10 (terminal D, CK, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network alu (terminal alu_A_7_0_7, alu_A_7_0_6, alu_A_7_0_5, alu_A_7_0_4, 
                      alu_A_7_0_3, alu_A_7_0_2, alu_A_7_0_1, alu_A_7_0_0, 
                      alu_B_7_0_7, alu_B_7_0_6, alu_B_7_0_5, alu_B_7_0_4, 
                      alu_B_7_0_3, alu_B_7_0_2, alu_B_7_0_1, alu_B_7_0_0, 
                      opcode_2_0_2, opcode_2_0_1, opcode_2_0_0, alu_clk, alu_c, 
                      alu_z, alu_y_7_0_7, alu_y_7_0_6, alu_y_7_0_5, 
                      alu_y_7_0_4, alu_y_7_0_3, alu_y_7_0_2, alu_y_7_0_1, 
                      alu_y_7_0_0, vss, vdd)
{
   net {alu_c, alu_c_port};
   net {n4, vss};
   {alu_c_reg} dfn10 (n106, alu_clk, alu_c_port, vss, vdd);
   {alu_z_reg} dfn10 (N74, alu_clk, alu_z, vss, vdd);
   {U113} no310 (opcode_2_0_1, opcode_2_0_2, n158, n107, vss, vdd);
   {U114} na310 (n108, n109, n110, n106, vss, vdd);
   {U115} na210 (n111, n112, n110, vss, vdd);
   {U116} iv110 (opcode_2_0_2, n112, vss, vdd);
   {U117} na210 (n113, n114, n111, vss, vdd);
   {U118} iv110 (alu_c_port, n114, vss, vdd);
   {U119} na210 (opcode_2_0_1, opcode_2_0_0, n113, vss, vdd);
   {U120} na310 (opcode_2_0_0, alu_add_8_port, n115, n109, vss, vdd);
   {U121} iv110 (n116, n115, vss, vdd);
   {U122} na210 (opcode_2_0_1, alu_c_port, n108, vss, vdd);
   {U123} na210 (n117, n118, alu_y_7_0_7, vss, vdd);
   {U124} na210 (N50, n119, n118, vss, vdd);
   {U125} mu111 (n120, n121, alu_A_7_0_7, n117, vss, vdd);
   {U126} no210 (n122, n123, n121, vss, vdd);
   {U127} mu111 (n107, n125, alu_B_7_0_7, n123, vss, vdd);
   {U128} na210 (alu_B_7_0_7, n124, n120, vss, vdd);
   {U129} na210 (n126, n127, alu_y_7_0_6, vss, vdd);
   {U130} na210 (N49, n119, n127, vss, vdd);
   {U131} mu111 (n128, n129, alu_A_7_0_6, n126, vss, vdd);
   {U132} no210 (n122, n130, n129, vss, vdd);
   {U133} mu111 (n107, n125, alu_B_7_0_6, n130, vss, vdd);
   {U134} na210 (alu_B_7_0_6, n124, n128, vss, vdd);
   {U135} na210 (n131, n132, alu_y_7_0_5, vss, vdd);
   {U136} na210 (N48, n119, n132, vss, vdd);
   {U137} mu111 (n133, n134, alu_A_7_0_5, n131, vss, vdd);
   {U138} no210 (n122, n135, n134, vss, vdd);
   {U139} mu111 (n107, n125, alu_B_7_0_5, n135, vss, vdd);
   {U140} na210 (alu_B_7_0_5, n124, n133, vss, vdd);
   {U141} na210 (n136, n137, alu_y_7_0_4, vss, vdd);
   {U142} na210 (N47, n119, n137, vss, vdd);
   {U143} mu111 (n138, n139, alu_A_7_0_4, n136, vss, vdd);
   {U144} no210 (n122, n140, n139, vss, vdd);
   {U145} mu111 (n107, n125, alu_B_7_0_4, n140, vss, vdd);
   {U146} na210 (alu_B_7_0_4, n124, n138, vss, vdd);
   {U147} na210 (n141, n142, alu_y_7_0_3, vss, vdd);
   {U148} na210 (N46, n119, n142, vss, vdd);
   {U149} mu111 (n143, n144, alu_A_7_0_3, n141, vss, vdd);
   {U150} no210 (n122, n145, n144, vss, vdd);
   {U151} mu111 (n107, n125, alu_B_7_0_3, n145, vss, vdd);
   {U152} na210 (alu_B_7_0_3, n124, n143, vss, vdd);
   {U153} na210 (n146, n147, alu_y_7_0_2, vss, vdd);
   {U154} na210 (N45, n119, n147, vss, vdd);
   {U155} mu111 (n148, n149, alu_A_7_0_2, n146, vss, vdd);
   {U156} no210 (n122, n150, n149, vss, vdd);
   {U157} mu111 (n107, n125, alu_B_7_0_2, n150, vss, vdd);
   {U158} na210 (alu_B_7_0_2, n124, n148, vss, vdd);
   {U159} na210 (n151, n152, alu_y_7_0_1, vss, vdd);
   {U160} na210 (N44, n119, n152, vss, vdd);
   {U161} mu111 (n153, n154, alu_A_7_0_1, n151, vss, vdd);
   {U162} no210 (n122, n155, n154, vss, vdd);
   {U163} mu111 (n107, n125, alu_B_7_0_1, n155, vss, vdd);
   {U164} na210 (alu_B_7_0_1, n124, n153, vss, vdd);
   {U165} na210 (n156, n157, alu_y_7_0_0, vss, vdd);
   {U166} na210 (N43, n119, n157, vss, vdd);
   {U167} no210 (n116, n158, n119, vss, vdd);
   {U168} na210 (opcode_2_0_2, n159, n116, vss, vdd);
   {U169} mu111 (n160, n161, alu_A_7_0_0, n156, vss, vdd);
   {U170} no210 (n122, n162, n161, vss, vdd);
   {U171} mu111 (n107, n125, alu_B_7_0_0, n162, vss, vdd);
   {U172} no310 (opcode_2_0_1, opcode_2_0_2, opcode_2_0_0, n122, vss, vdd);
   {U173} na210 (alu_B_7_0_0, n124, n160, vss, vdd);
   {U174} no310 (opcode_2_0_1, opcode_2_0_2, n158, n124, vss, vdd);
   {U175} iv110 (opcode_2_0_0, n158, vss, vdd);
   {U176} no210 (n163, n164, N74, vss, vdd);
   {U177} na310 (n165, n166, n167, n164, vss, vdd);
   {U178} iv110 (n168, n167, vss, vdd);
   {U179} na210 (n169, n125, n168, vss, vdd);
   {U180} no310 (opcode_2_0_0, opcode_2_0_2, n159, n125, vss, vdd);
   {U181} iv110 (opcode_2_0_1, n159, vss, vdd);
   {U182} na210 (alu_B_7_0_7, alu_A_7_0_7, n169, vss, vdd);
   {U183} na210 (alu_A_7_0_5, alu_B_7_0_5, n166, vss, vdd);
   {U184} na210 (alu_A_7_0_6, alu_B_7_0_6, n165, vss, vdd);
   {U185} na310 (n170, n171, n172, n163, vss, vdd);
   {U186} iv110 (n173, n172, vss, vdd);
   {U187} na310 (n174, n175, n176, n173, vss, vdd);
   {U188} na210 (alu_B_7_0_1, alu_A_7_0_1, n176, vss, vdd);
   {U189} na210 (alu_B_7_0_0, alu_A_7_0_0, n175, vss, vdd);
   {U190} na210 (alu_B_7_0_2, alu_A_7_0_2, n174, vss, vdd);
   {U191} na210 (alu_A_7_0_3, alu_B_7_0_3, n171, vss, vdd);
   {U192} na210 (alu_A_7_0_4, alu_B_7_0_4, n170, vss, vdd);
   {r64_U55} ex210 (alu_B_7_0_0, alu_A_7_0_0, N43, vss, vdd);
   {r64_U54} na210 (alu_B_7_0_0, alu_A_7_0_0, r64_n46, vss, vdd);
   {r64_U53} ex210 (alu_B_7_0_1, alu_A_7_0_1, r64_n45, vss, vdd);
   {r64_U52} ex210 (r64_n11, r64_n45, N44, vss, vdd);
   {r64_U51} na210 (alu_A_7_0_1, r64_n11, r64_n42, vss, vdd);
   {r64_U50} no210 (alu_A_7_0_1, r64_n11, r64_n44, vss, vdd);
   {r64_U49} na210 (alu_B_7_0_1, r64_n10, r64_n43, vss, vdd);
   {r64_U48} na210 (r64_n42, r64_n43, r64_n40, vss, vdd);
   {r64_U47} ex210 (alu_B_7_0_2, alu_A_7_0_2, r64_n41, vss, vdd);
   {r64_U46} ex210 (r64_n40, r64_n41, N45, vss, vdd);
   {r64_U45} ex210 (r64_n7, alu_B_7_0_3, r64_n36, vss, vdd);
   {r64_U44} na210 (alu_A_7_0_2, r64_n40, r64_n37, vss, vdd);
   {r64_U43} no210 (r64_n40, alu_A_7_0_2, r64_n39, vss, vdd);
   {r64_U42} na210 (alu_B_7_0_2, r64_n9, r64_n38, vss, vdd);
   {r64_U41} na210 (r64_n37, r64_n38, r64_n35, vss, vdd);
   {r64_U40} ex210 (r64_n36, r64_n8, N46, vss, vdd);
   {r64_U39} na210 (alu_A_7_0_3, r64_n35, r64_n32, vss, vdd);
   {r64_U38} na210 (r64_n8, r64_n7, r64_n34, vss, vdd);
   {r64_U37} na210 (alu_B_7_0_3, r64_n34, r64_n33, vss, vdd);
   {r64_U36} na210 (r64_n32, r64_n33, r64_n30, vss, vdd);
   {r64_U35} ex210 (alu_B_7_0_4, alu_A_7_0_4, r64_n31, vss, vdd);
   {r64_U34} ex210 (r64_n30, r64_n31, N47, vss, vdd);
   {r64_U33} ex210 (r64_n4, alu_B_7_0_5, r64_n26, vss, vdd);
   {r64_U32} na210 (alu_A_7_0_4, r64_n30, r64_n27, vss, vdd);
   {r64_U31} no210 (r64_n30, alu_A_7_0_4, r64_n29, vss, vdd);
   {r64_U30} na210 (alu_B_7_0_4, r64_n6, r64_n28, vss, vdd);
   {r64_U29} na210 (r64_n27, r64_n28, r64_n25, vss, vdd);
   {r64_U28} ex210 (r64_n26, r64_n5, N48, vss, vdd);
   {r64_U27} na210 (alu_A_7_0_5, r64_n25, r64_n22, vss, vdd);
   {r64_U26} na210 (r64_n5, r64_n4, r64_n24, vss, vdd);
   {r64_U25} na210 (alu_B_7_0_5, r64_n24, r64_n23, vss, vdd);
   {r64_U24} na210 (r64_n22, r64_n23, r64_n20, vss, vdd);
   {r64_U23} ex210 (alu_B_7_0_6, alu_A_7_0_6, r64_n21, vss, vdd);
   {r64_U22} ex210 (r64_n20, r64_n21, N49, vss, vdd);
   {r64_U21} ex210 (r64_n1, alu_B_7_0_7, r64_n16, vss, vdd);
   {r64_U20} na210 (alu_A_7_0_6, r64_n20, r64_n17, vss, vdd);
   {r64_U19} no210 (r64_n20, alu_A_7_0_6, r64_n19, vss, vdd);
   {r64_U18} na210 (alu_B_7_0_6, r64_n3, r64_n18, vss, vdd);
   {r64_U17} na210 (r64_n17, r64_n18, r64_n15, vss, vdd);
   {r64_U16} ex210 (r64_n16, r64_n2, N50, vss, vdd);
   {r64_U15} na210 (alu_A_7_0_7, r64_n15, r64_n12, vss, vdd);
   {r64_U14} na210 (r64_n2, r64_n1, r64_n14, vss, vdd);
   {r64_U13} na210 (alu_B_7_0_7, r64_n14, r64_n13, vss, vdd);
   {r64_U12} na210 (r64_n12, r64_n13, alu_add_8_port, vss, vdd);
   {r64_U11} iv110 (r64_n46, r64_n11, vss, vdd);
   {r64_U10} iv110 (r64_n44, r64_n10, vss, vdd);
   {r64_U9} iv110 (r64_n39, r64_n9, vss, vdd);
   {r64_U8} iv110 (r64_n35, r64_n8, vss, vdd);
   {r64_U7} iv110 (alu_A_7_0_3, r64_n7, vss, vdd);
   {r64_U6} iv110 (r64_n29, r64_n6, vss, vdd);
   {r64_U5} iv110 (r64_n25, r64_n5, vss, vdd);
   {r64_U4} iv110 (alu_A_7_0_5, r64_n4, vss, vdd);
   {r64_U3} iv110 (r64_n19, r64_n3, vss, vdd);
   {r64_U2} iv110 (r64_n15, r64_n2, vss, vdd);
   {r64_U1} iv110 (alu_A_7_0_7, r64_n1, vss, vdd);
}



