extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network instr_buf (terminal buf_in_11_0_11, buf_in_11_0_10, buf_in_11_0_9, 
                            buf_in_11_0_8, buf_in_11_0_7, buf_in_11_0_6, 
                            buf_in_11_0_5, buf_in_11_0_4, buf_in_11_0_3, 
                            buf_in_11_0_2, buf_in_11_0_1, buf_in_11_0_0, 
                            buf_oe, buf_out_11_0_11, buf_out_11_0_10, 
                            buf_out_11_0_9, buf_out_11_0_8, buf_out_11_0_7, 
                            buf_out_11_0_6, buf_out_11_0_5, buf_out_11_0_4, 
                            buf_out_11_0_3, buf_out_11_0_2, buf_out_11_0_1, 
                            buf_out_11_0_0, vss, vdd)
{
   {buf_out_tri_0_inst} tinv10 (n12, buf_oe, buf_out_11_0_0, vss, vdd);
   {buf_out_tri_1_inst} tinv10 (n11, buf_oe, buf_out_11_0_1, vss, vdd);
   {buf_out_tri_2_inst} tinv10 (n10, buf_oe, buf_out_11_0_2, vss, vdd);
   {buf_out_tri_3_inst} tinv10 (n9, buf_oe, buf_out_11_0_3, vss, vdd);
   {buf_out_tri_4_inst} tinv10 (n8, buf_oe, buf_out_11_0_4, vss, vdd);
   {buf_out_tri_5_inst} tinv10 (n7, buf_oe, buf_out_11_0_5, vss, vdd);
   {buf_out_tri_6_inst} tinv10 (n6, buf_oe, buf_out_11_0_6, vss, vdd);
   {buf_out_tri_7_inst} tinv10 (n5, buf_oe, buf_out_11_0_7, vss, vdd);
   {buf_out_tri_8_inst} tinv10 (n4, buf_oe, buf_out_11_0_8, vss, vdd);
   {buf_out_tri_9_inst} tinv10 (n3, buf_oe, buf_out_11_0_9, vss, vdd);
   {buf_out_tri_10_inst} tinv10 (n2, buf_oe, buf_out_11_0_10, vss, vdd);
   {buf_out_tri_11_inst} tinv10 (n1, buf_oe, buf_out_11_0_11, vss, vdd);
   {U13} iv110 (buf_in_11_0_3, n9, vss, vdd);
   {U14} iv110 (buf_in_11_0_4, n8, vss, vdd);
   {U15} iv110 (buf_in_11_0_5, n7, vss, vdd);
   {U16} iv110 (buf_in_11_0_6, n6, vss, vdd);
   {U17} iv110 (buf_in_11_0_7, n5, vss, vdd);
   {U18} iv110 (buf_in_11_0_8, n4, vss, vdd);
   {U19} iv110 (buf_in_11_0_9, n3, vss, vdd);
   {U20} iv110 (buf_in_11_0_10, n2, vss, vdd);
   {U21} iv110 (buf_in_11_0_0, n12, vss, vdd);
   {U22} iv110 (buf_in_11_0_1, n11, vss, vdd);
   {U23} iv110 (buf_in_11_0_2, n10, vss, vdd);
   {U24} iv110 (buf_in_11_0_11, n1, vss, vdd);
}



