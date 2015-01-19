extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network decoder (terminal decoder_in_11_0_11, decoder_in_11_0_10, 
                          decoder_in_11_0_9, decoder_in_11_0_8, 
                          decoder_in_11_0_7, decoder_in_11_0_6, 
                          decoder_in_11_0_5, decoder_in_11_0_4, 
                          decoder_in_11_0_3, decoder_in_11_0_2, 
                          decoder_in_11_0_1, decoder_in_11_0_0, decoder_c, 
                          decoder_z, decoder_pc_inc, decoder_pc_ld, 
                          decoder_ibufoe, decoder_aregld, decoder_abufoe, 
                          decoder_bregld_4_0_4, decoder_bregld_4_0_3, 
                          decoder_bregld_4_0_2, decoder_bregld_4_0_1, 
                          decoder_bregld_4_0_0, decoder_bbufoe_4_0_4, 
                          decoder_bbufoe_4_0_3, decoder_bbufoe_4_0_2, 
                          decoder_bbufoe_4_0_1, decoder_bbufoe_4_0_0, 
                          decoder_alu_2_0_2, decoder_alu_2_0_1, 
                          decoder_alu_2_0_0, decoder_argout_7_0_7, 
                          decoder_argout_7_0_6, decoder_argout_7_0_5, 
                          decoder_argout_7_0_4, decoder_argout_7_0_3, 
                          decoder_argout_7_0_2, decoder_argout_7_0_1, 
                          decoder_argout_7_0_0, vss, vdd)
{
   net {decoder_abufoe, decoder_bregld_4_port};
   net {decoder_bregld_4_0_4, decoder_bregld_4_port};
   net {decoder_bregld_4_0_3, decoder_in_11_0_3};
   net {decoder_bregld_4_0_2, decoder_in_11_0_2};
   net {decoder_bregld_4_0_1, decoder_in_11_0_1};
   net {decoder_bregld_4_0_0, decoder_in_11_0_0};
   net {decoder_bbufoe_4_0_4, decoder_bbufoe_4_port};
   net {decoder_bbufoe_4_0_3, decoder_in_11_0_3};
   net {decoder_bbufoe_4_0_2, decoder_in_11_0_2};
   net {decoder_bbufoe_4_0_1, decoder_in_11_0_1};
   net {decoder_bbufoe_4_0_0, decoder_in_11_0_0};
   net {decoder_argout_7_0_7, decoder_in_11_0_7};
   net {decoder_argout_7_0_6, decoder_in_11_0_6};
   net {decoder_argout_7_0_5, decoder_in_11_0_5};
   net {decoder_argout_7_0_4, decoder_in_11_0_4};
   net {decoder_argout_7_0_3, decoder_in_11_0_3};
   net {decoder_argout_7_0_2, decoder_in_11_0_2};
   net {decoder_argout_7_0_1, decoder_in_11_0_1};
   net {decoder_argout_7_0_0, decoder_in_11_0_0};
   {U52} no210 (decoder_in_11_0_11, n45, decoder_pc_ld, vss, vdd);
   {U53} iv110 (n46, n45, vss, vdd);
   {U54} na210 (n47, n48, n46, vss, vdd);
   {U55} na210 (n49, n50, n48, vss, vdd);
   {U56} na210 (n51, n52, n50, vss, vdd);
   {U57} na310 (decoder_c, n53, n52, n47, vss, vdd);
   {U58} na310 (n54, n55, n56, decoder_pc_inc, vss, vdd);
   {U59} na210 (n57, n53, n56, vss, vdd);
   {U60} iv110 (n58, n53, vss, vdd);
   {U61} na210 (decoder_c, n52, n57, vss, vdd);
   {U62} na210 (n59, n52, n54, vss, vdd);
   {U63} na210 (n60, n61, n52, vss, vdd);
   {U64} na210 (n62, n63, n61, vss, vdd);
   {U65} na210 (n64, n65, n59, vss, vdd);
   {U66} na210 (n51, n49, n65, vss, vdd);
   {U67} na210 (decoder_z, decoder_in_11_0_8, n51, vss, vdd);
   {U68} no210 (n66, n67, decoder_ibufoe, vss, vdd);
   {U69} no210 (n68, n69, n67, vss, vdd);
   {U70} no210 (decoder_in_11_0_10, n70, n68, vss, vdd);
   {U71} iv110 (n71, n66, vss, vdd);
   {U72} no310 (n60, decoder_in_11_0_11, n49, decoder_bregld_4_port, vss, vdd);
   {U73} no210 (n72, n73, decoder_bbufoe_4_port, vss, vdd);
   {U74} mu111 (n71, n74, decoder_in_11_0_9, n73, vss, vdd);
   {U75} no210 (n49, n71, n74, vss, vdd);
   {U76} iv110 (n70, n72, vss, vdd);
   {U77} na210 (n71, n75, n70, vss, vdd);
   {U78} na210 (n55, n62, n75, vss, vdd);
   {U79} na210 (decoder_in_11_0_11, decoder_in_11_0_8, n71, vss, vdd);
   {U80} na210 (n76, n77, decoder_aregld, vss, vdd);
   {U81} na210 (n69, decoder_in_11_0_8, n77, vss, vdd);
   {U82} mu111 (n78, n79, decoder_in_11_0_11, n76, vss, vdd);
   {U83} na210 (n79, n62, n78, vss, vdd);
   {U84} iv110 (decoder_in_11_0_8, n62, vss, vdd);
   {U85} no210 (n63, n49, n79, vss, vdd);
   {U86} no210 (n64, n55, decoder_alu_2_0_2, vss, vdd);
   {U87} mu111 (decoder_in_11_0_9, n60, decoder_in_11_0_10, n64, vss, vdd);
   {U88} na210 (decoder_in_11_0_9, decoder_in_11_0_8, n60, vss, vdd);
   {U89} no210 (n58, n55, decoder_alu_2_0_1, vss, vdd);
   {U90} no210 (n69, n80, n58, vss, vdd);
   {U91} no210 (n49, decoder_in_11_0_8, n80, vss, vdd);
   {U92} no210 (n49, decoder_in_11_0_9, n69, vss, vdd);
   {U93} no210 (n81, n55, decoder_alu_2_0_0, vss, vdd);
   {U94} iv110 (decoder_in_11_0_11, n55, vss, vdd);
   {U95} no210 (n82, n49, n81, vss, vdd);
   {U96} iv110 (decoder_in_11_0_10, n49, vss, vdd);
   {U97} no210 (decoder_in_11_0_8, n63, n82, vss, vdd);
   {U98} iv110 (decoder_in_11_0_9, n63, vss, vdd);
}



