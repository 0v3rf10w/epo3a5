extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network buf_10 (terminal buf_in_7_0_7, buf_in_7_0_6, buf_in_7_0_5, 
                         buf_in_7_0_4, buf_in_7_0_3, buf_in_7_0_2, 
                         buf_in_7_0_1, buf_in_7_0_0, buf_oe_4_0_4, 
                         buf_oe_4_0_3, buf_oe_4_0_2, buf_oe_4_0_1, 
                         buf_oe_4_0_0, buf_out_7_0_7, buf_out_7_0_6, 
                         buf_out_7_0_5, buf_out_7_0_4, buf_out_7_0_3, 
                         buf_out_7_0_2, buf_out_7_0_1, buf_out_7_0_0, vss, vdd)
{
   {buf_out_tri_0_inst} tinv10 (n12, n5, buf_out_7_0_0, vss, vdd);
   {buf_out_tri_1_inst} tinv10 (n11, n5, buf_out_7_0_1, vss, vdd);
   {buf_out_tri_2_inst} tinv10 (n10, n5, buf_out_7_0_2, vss, vdd);
   {buf_out_tri_3_inst} tinv10 (n9, n5, buf_out_7_0_3, vss, vdd);
   {buf_out_tri_4_inst} tinv10 (n8, n5, buf_out_7_0_4, vss, vdd);
   {buf_out_tri_5_inst} tinv10 (n7, n5, buf_out_7_0_5, vss, vdd);
   {buf_out_tri_6_inst} tinv10 (n6, n5, buf_out_7_0_6, vss, vdd);
   {buf_out_tri_7_inst} tinv10 (n4, n5, buf_out_7_0_7, vss, vdd);
   {U13} iv110 (buf_in_7_0_3, n9, vss, vdd);
   {U14} iv110 (buf_in_7_0_4, n8, vss, vdd);
   {U15} iv110 (buf_in_7_0_5, n7, vss, vdd);
   {U16} iv110 (buf_in_7_0_6, n6, vss, vdd);
   {U17} no210 (n13, n14, n5, vss, vdd);
   {U18} na210 (buf_oe_4_0_4, buf_oe_4_0_3, n14, vss, vdd);
   {U19} na210 (n15, buf_oe_4_0_1, n13, vss, vdd);
   {U20} no210 (buf_oe_4_0_2, buf_oe_4_0_0, n15, vss, vdd);
   {U21} iv110 (buf_in_7_0_7, n4, vss, vdd);
   {U22} iv110 (buf_in_7_0_0, n12, vss, vdd);
   {U23} iv110 (buf_in_7_0_1, n11, vss, vdd);
   {U24} iv110 (buf_in_7_0_2, n10, vss, vdd);
}



