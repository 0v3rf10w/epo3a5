extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network control (terminal clk, reset, send, count_3_0_3, count_3_0_2, 
                          count_3_0_1, count_3_0_0, shift, sclk, c_reset, ss, 
                          busy, vss, vdd)
{
   net {shift, shift_port};
   net {c_reset, c_reset_port};
   net {busy, busy_port};
   {state_reg_0_inst} dfa11 (n1, clk, reset, state_0_port, vss, vdd);
   {state_reg_1_inst} dfa11 (N16, clk, reset, state_1_port, vss, vdd);
   {U21} ex210 (state_0_port, n14, ss, vss, vdd);
   {U22} no210 (clk, c_reset_port, sclk, vss, vdd);
   {U23} iv110 (n15, n1, vss, vdd);
   {U24} no310 (n16_port, n17, n18, n15, vss, vdd);
   {U25} no210 (c_reset_port, n19, n18, vss, vdd);
   {U26} no310 (reset, state_1_port, state_0_port, n17, vss, vdd);
   {U27} no210 (send, busy_port, n16_port, vss, vdd);
   {U28} iv110 (shift_port, c_reset_port, vss, vdd);
   {U29} na210 (n20, n21, N16, vss, vdd);
   {U30} na210 (n19, shift_port, n21, vss, vdd);
   {U31} no210 (n14, state_0_port, shift_port, vss, vdd);
   {U32} na310 (count_3_0_3, n22, n23, n19, vss, vdd);
   {U33} no210 (count_3_0_2, count_3_0_1, n23, vss, vdd);
   {U34} iv110 (count_3_0_0, n22, vss, vdd);
   {U35} na210 (send, n24, n20, vss, vdd);
   {U36} iv110 (busy_port, n24, vss, vdd);
   {U37} na210 (state_0_port, n14, busy_port, vss, vdd);
   {U38} iv110 (state_1_port, n14, vss, vdd);
}



