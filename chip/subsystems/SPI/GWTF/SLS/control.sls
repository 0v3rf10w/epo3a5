extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network control (terminal clk, reset, send, count_3_0_3, count_3_0_2, 
                          count_3_0_1, count_3_0_0, shift, sclk, c_reset, vss, 
                          vdd)
{
   net {shift, shift_port};
   net {c_reset, c_reset_port};
   {state_reg_0_inst} dfa11 (n3, clk, reset, state_0_port, vss, vdd);
   {state_reg_1_inst} dfa11 (N16, clk, reset, state_1_port, vss, vdd);
   {U21} no210 (clk, c_reset_port, sclk, vss, vdd);
   {U22} iv110 (n16_port, n3, vss, vdd);
   {U23} no210 (n17, n18, n16_port, vss, vdd);
   {U24} no210 (c_reset_port, n19, n18, vss, vdd);
   {U25} no210 (state_1_port, n20, n17, vss, vdd);
   {U26} mu111 (reset, send, state_0_port, n20, vss, vdd);
   {U27} iv110 (shift_port, c_reset_port, vss, vdd);
   {U28} na210 (n21, n22, N16, vss, vdd);
   {U29} na310 (send, n23, state_0_port, n22, vss, vdd);
   {U30} na210 (n19, shift_port, n21, vss, vdd);
   {U31} no210 (n23, state_0_port, shift_port, vss, vdd);
   {U32} iv110 (state_1_port, n23, vss, vdd);
   {U33} na310 (count_3_0_3, n24, n25, n19, vss, vdd);
   {U34} no210 (count_3_0_2, count_3_0_1, n25, vss, vdd);
   {U35} iv110 (count_3_0_0, n24, vss, vdd);
}



