extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network buf_arg (terminal buf_in_7_0_7, buf_in_7_0_6, buf_in_7_0_5, 
                          buf_in_7_0_4, buf_in_7_0_3, buf_in_7_0_2, 
                          buf_in_7_0_1, buf_in_7_0_0, buf_oe, buf_out_7_0_7, 
                          buf_out_7_0_6, buf_out_7_0_5, buf_out_7_0_4, 
                          buf_out_7_0_3, buf_out_7_0_2, buf_out_7_0_1, 
                          buf_out_7_0_0, vss, vdd)
{
   {buf_out_tri_0_inst} tinv10 (n8, buf_oe, buf_out_7_0_0, vss, vdd);
   {buf_out_tri_1_inst} tinv10 (n7, buf_oe, buf_out_7_0_1, vss, vdd);
   {buf_out_tri_2_inst} tinv10 (n6, buf_oe, buf_out_7_0_2, vss, vdd);
   {buf_out_tri_3_inst} tinv10 (n5, buf_oe, buf_out_7_0_3, vss, vdd);
   {buf_out_tri_4_inst} tinv10 (n4, buf_oe, buf_out_7_0_4, vss, vdd);
   {buf_out_tri_5_inst} tinv10 (n3, buf_oe, buf_out_7_0_5, vss, vdd);
   {buf_out_tri_6_inst} tinv10 (n2, buf_oe, buf_out_7_0_6, vss, vdd);
   {buf_out_tri_7_inst} tinv10 (n1, buf_oe, buf_out_7_0_7, vss, vdd);
   {U9} iv110 (buf_in_7_0_0, n8, vss, vdd);
   {U10} iv110 (buf_in_7_0_1, n7, vss, vdd);
   {U11} iv110 (buf_in_7_0_2, n6, vss, vdd);
   {U12} iv110 (buf_in_7_0_3, n5, vss, vdd);
   {U13} iv110 (buf_in_7_0_4, n4, vss, vdd);
   {U14} iv110 (buf_in_7_0_5, n3, vss, vdd);
   {U15} iv110 (buf_in_7_0_6, n2, vss, vdd);
   {U16} iv110 (buf_in_7_0_7, n1, vss, vdd);
}



