extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
network pc_counter (terminal pc_in_7_0_7, pc_in_7_0_6, pc_in_7_0_5, 
                             pc_in_7_0_4, pc_in_7_0_3, pc_in_7_0_2, 
                             pc_in_7_0_1, pc_in_7_0_0, pc_inc, pc_ld, pc_rst, 
                             pc_en, pc_out_7_0_7, pc_out_7_0_6, pc_out_7_0_5, 
                             pc_out_7_0_4, pc_out_7_0_3, pc_out_7_0_2, 
                             pc_out_7_0_1, pc_out_7_0_0, vss, vdd)
{
   net {pc_out_7_0_7, pc_out_7_port};
   net {pc_out_7_0_6, pc_out_6_port};
   net {pc_out_7_0_5, pc_out_5_port};
   net {pc_out_7_0_4, pc_out_4_port};
   net {pc_out_7_0_3, pc_out_3_port};
   net {pc_out_7_0_2, pc_out_2_port};
   net {pc_out_7_0_1, pc_out_1_port};
   net {pc_out_7_0_0, pc_out_0_port};
   {count_reg_0_inst} dfa11 (n34, pc_en, pc_rst, pc_out_0_port, vss, vdd);
   {count_reg_1_inst} dfa11 (n33, pc_en, pc_rst, pc_out_1_port, vss, vdd);
   {count_reg_2_inst} dfa11 (n32, pc_en, pc_rst, pc_out_2_port, vss, vdd);
   {count_reg_3_inst} dfa11 (n31, pc_en, pc_rst, pc_out_3_port, vss, vdd);
   {count_reg_4_inst} dfa11 (n30, pc_en, pc_rst, pc_out_4_port, vss, vdd);
   {count_reg_5_inst} dfa11 (n29, pc_en, pc_rst, pc_out_5_port, vss, vdd);
   {count_reg_6_inst} dfa11 (n28, pc_en, pc_rst, pc_out_6_port, vss, vdd);
   {count_reg_7_inst} dfa11 (n27, pc_en, pc_rst, pc_out_7_port, vss, vdd);
   {U37} na210 (n35, n36, n34, vss, vdd);
   {U38} na210 (pc_in_7_0_0, n37, n36, vss, vdd);
   {U39} mu111 (n38, n39, pc_out_0_port, n35, vss, vdd);
   {U40} na210 (n40, n41, n33, vss, vdd);
   {U41} na210 (pc_in_7_0_1, n37, n41, vss, vdd);
   {U42} mu111 (n42, n43, pc_out_1_port, n40, vss, vdd);
   {U43} na210 (pc_inc, pc_out_0_port, n42, vss, vdd);
   {U44} na210 (n44, n45, n32, vss, vdd);
   {U45} na210 (pc_in_7_0_2, n37, n45, vss, vdd);
   {U46} mu111 (n46, n47, pc_out_2_port, n44, vss, vdd);
   {U47} no210 (n48, n49, n47, vss, vdd);
   {U48} iv110 (n43, n49, vss, vdd);
   {U49} no210 (n50, n51, n43, vss, vdd);
   {U50} no210 (n38, pc_out_0_port, n51, vss, vdd);
   {U51} no210 (pc_out_1_port, n38, n48, vss, vdd);
   {U52} na310 (pc_inc, pc_out_0_port, pc_out_1_port, n46, vss, vdd);
   {U53} na210 (n52, n53, n31, vss, vdd);
   {U54} na210 (pc_in_7_0_3, n37, n53, vss, vdd);
   {U55} mu111 (n54, n55, pc_out_3_port, n52, vss, vdd);
   {U56} iv110 (n56, n55, vss, vdd);
   {U57} na210 (n57, pc_inc, n54, vss, vdd);
   {U58} na210 (n58, n59, n30, vss, vdd);
   {U59} na210 (pc_in_7_0_4, n37, n59, vss, vdd);
   {U60} mu111 (n60, n61, pc_out_4_port, n58, vss, vdd);
   {U61} no210 (n62, n56, n61, vss, vdd);
   {U62} na210 (n39, n63, n56, vss, vdd);
   {U63} na210 (pc_inc, n64, n63, vss, vdd);
   {U64} iv110 (n50, n39, vss, vdd);
   {U65} no210 (pc_out_3_port, n38, n62, vss, vdd);
   {U66} na310 (n57, pc_inc, pc_out_3_port, n60, vss, vdd);
   {U67} na210 (n65, n66, n29, vss, vdd);
   {U68} na210 (pc_in_7_0_5, n37, n66, vss, vdd);
   {U69} mu111 (n67, n68, n69, n65, vss, vdd);
   {U70} na210 (n70, pc_inc, n68, vss, vdd);
   {U71} na210 (n71, n72, n28, vss, vdd);
   {U72} na210 (pc_in_7_0_6, n37, n72, vss, vdd);
   {U73} iv110 (n73, n71, vss, vdd);
   {U74} mu111 (n74, n75, pc_out_6_port, n73, vss, vdd);
   {U75} na210 (n76, n77, n27, vss, vdd);
   {U76} na210 (pc_in_7_0_7, n37, n77, vss, vdd);
   {U77} no210 (n50, pc_inc, n37, vss, vdd);
   {U78} mu111 (n78, n79, pc_out_7_port, n76, vss, vdd);
   {U79} no210 (n80, n75, n79, vss, vdd);
   {U80} na210 (n67, n81, n75, vss, vdd);
   {U81} na210 (pc_inc, n69, n81, vss, vdd);
   {U82} no210 (n50, n82, n67, vss, vdd);
   {U83} no210 (n38, n70, n82, vss, vdd);
   {U84} iv110 (n83, n70, vss, vdd);
   {U85} no210 (pc_ld, pc_inc, n50, vss, vdd);
   {U86} no210 (pc_out_6_port, n38, n80, vss, vdd);
   {U87} na210 (n74, pc_out_6_port, n78, vss, vdd);
   {U88} no310 (n83, n38, n69, n74, vss, vdd);
   {U89} iv110 (pc_out_5_port, n69, vss, vdd);
   {U90} iv110 (pc_inc, n38, vss, vdd);
   {U91} na310 (pc_out_3_port, n57, pc_out_4_port, n83, vss, vdd);
   {U92} iv110 (n64, n57, vss, vdd);
   {U93} na310 (pc_out_1_port, pc_out_0_port, pc_out_2_port, n64, vss, vdd);
}



