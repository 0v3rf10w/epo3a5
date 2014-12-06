extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
network counter (terminal clk, reset, count_out_3_0_3, count_out_3_0_2, 
                          count_out_3_0_1, count_out_3_0_0, vss, vdd)
{
   net {count_out_3_0_3, count_out_3_port};
   net {count_out_3_0_2, count_out_2_port};
   net {count_out_3_0_1, count_out_1_port};
   net {count_out_3_0_0, count_out_0_port};
   {count_reg_0_inst} dfa11 (n2_port, clk, reset, count_out_0_port, vss, vdd);
   {count_reg_1_inst} dfa11 (N2, clk, reset, count_out_1_port, vss, vdd);
   {count_reg_2_inst} dfa11 (N3, clk, reset, count_out_2_port, vss, vdd);
   {count_reg_3_inst} dfa11 (N4, clk, reset, count_out_3_port, vss, vdd);
   {U10} iv110 (count_out_0_port, n2_port, vss, vdd);
   {U11} ex210 (count_out_3_port, n5, N4, vss, vdd);
   {U12} no210 (n6, n7, n5, vss, vdd);
   {U13} ex210 (n7, n6, N3, vss, vdd);
   {U14} na210 (count_out_1_port, count_out_0_port, n6, vss, vdd);
   {U15} iv110 (count_out_2_port, n7, vss, vdd);
   {U16} ex210 (count_out_1_port, count_out_0_port, N2, vss, vdd);
}



