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
   {U55} iv110 (n47, decoder_pc_ld, vss, vdd);
   {U56} na210 (n48, n49, n47, vss, vdd);
   {U57} na210 (n50, n51, n49, vss, vdd);
   {U58} na210 (n52, n53, n51, vss, vdd);
   {U59} na210 (n54, n55, n53, vss, vdd);
   {U60} na310 (decoder_c, n56, n55, n50, vss, vdd);
   {U61} na310 (n57, n48, n58, decoder_pc_inc, vss, vdd);
   {U62} na210 (n59, n56, n58, vss, vdd);
   {U63} na210 (decoder_c, n55, n59, vss, vdd);
   {U64} na210 (n60, n55, n57, vss, vdd);
   {U65} na210 (n61, n62, n55, vss, vdd);
   {U66} na210 (n63, n64, n62, vss, vdd);
   {U67} na210 (n65, n66, n60, vss, vdd);
   {U68} na210 (n54, n52, n66, vss, vdd);
   {U69} na210 (decoder_z, decoder_in_11_0_8, n54, vss, vdd);
   {U70} no210 (n67, n68, decoder_ibufoe, vss, vdd);
   {U71} no210 (n69, n70, n68, vss, vdd);
   {U72} no210 (decoder_in_11_0_10, n71, n69, vss, vdd);
   {U73} no310 (n61, decoder_in_11_0_11, n52, decoder_bregld_4_port, vss, vdd);
   {U74} no210 (n72, n73, decoder_bbufoe_4_port, vss, vdd);
   {U75} mu111 (n74, n75, n64, n73, vss, vdd);
   {U76} no210 (n52, n75, n74, vss, vdd);
   {U77} iv110 (n71, n72, vss, vdd);
   {U78} na210 (n75, n76, n71, vss, vdd);
   {U79} na210 (n48, n63, n76, vss, vdd);
   {U80} iv110 (n67, n75, vss, vdd);
   {U81} no210 (n48, n63, n67, vss, vdd);
   {U82} na210 (n77, n78, decoder_aregld, vss, vdd);
   {U83} na210 (decoder_in_11_0_9, n79, n78, vss, vdd);
   {U84} mu111 (n80, decoder_in_11_0_11, n52, n79, vss, vdd);
   {U85} no210 (decoder_in_11_0_8, decoder_in_11_0_11, n80, vss, vdd);
   {U86} mu111 (n81, n82, n63, n77, vss, vdd);
   {U87} na210 (decoder_in_11_0_11, n64, n82, vss, vdd);
   {U88} no210 (n65, n48, decoder_alu_2_0_2, vss, vdd);
   {U89} mu111 (n61, decoder_in_11_0_9, n52, n65, vss, vdd);
   {U90} na210 (decoder_in_11_0_9, decoder_in_11_0_8, n61, vss, vdd);
   {U91} iv110 (n83, decoder_alu_2_0_1, vss, vdd);
   {U92} na210 (n56, decoder_in_11_0_11, n83, vss, vdd);
   {U93} na210 (n81, n84, n56, vss, vdd);
   {U94} na210 (decoder_in_11_0_10, n63, n84, vss, vdd);
   {U95} iv110 (decoder_in_11_0_8, n63, vss, vdd);
   {U96} iv110 (n70, n81, vss, vdd);
   {U97} no210 (n52, decoder_in_11_0_9, n70, vss, vdd);
   {U98} no210 (n85, n48, decoder_alu_2_0_0, vss, vdd);
   {U99} iv110 (decoder_in_11_0_11, n48, vss, vdd);
   {U100} no210 (n86, n52, n85, vss, vdd);
   {U101} iv110 (decoder_in_11_0_10, n52, vss, vdd);
   {U102} no210 (decoder_in_11_0_8, n64, n86, vss, vdd);
   {U103} iv110 (decoder_in_11_0_9, n64, vss, vdd);
}



