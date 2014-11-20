extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
network control (terminal clk, reset, send, count_3_0_3, count_3_0_2, 
                          count_3_0_1, count_3_0_0, shift_reset, shift, sclk, 
                          c_reset, vss, vdd)
{
   net {shift_reset, shift_reset_port};
   net {shift, shift_port};
   {state_reg_0_inst} dfa11 (n1, clk, reset, state_0_port, vss, vdd);
   {state_reg_1_inst} dfa11 (new_state_1_port, clk, reset, state_1_port, vss, 
                             vdd);
   {U25} iv110 (n21, sclk, vss, vdd);
   {U26} na210 (n22, clk, n21, vss, vdd);
   {U27} na210 (n23, n24, new_state_1_port, vss, vdd);
   {U28} na210 (n22, n25, n24, vss, vdd);
   {U29} iv110 (n26, n22, vss, vdd);
   {U30} na210 (send, n27, n23, vss, vdd);
   {U31} iv110 (n28, n1, vss, vdd);
   {U32} no310 (n29, n30, n31, n28, vss, vdd);
   {U33} no210 (send, n32, n31, vss, vdd);
   {U34} iv110 (n27, n32, vss, vdd);
   {U35} no210 (n26, n25, n30, vss, vdd);
   {U36} na310 (count_3_0_3, n33, n34, n25, vss, vdd);
   {U37} no210 (count_3_0_2, count_3_0_1, n34, vss, vdd);
   {U38} iv110 (count_3_0_0, n33, vss, vdd);
   {U39} na210 (state_1_port, n35, n26, vss, vdd);
   {U40} no210 (reset, n36, n29, vss, vdd);
   {U41} iv110 (shift_reset_port, n36, vss, vdd);
   {U42} iv110 (shift_port, c_reset, vss, vdd);
   {U43} no210 (shift_reset_port, n27, shift_port, vss, vdd);
   {U44} no210 (n35, state_1_port, n27, vss, vdd);
   {U45} iv110 (state_0_port, n35, vss, vdd);
   {U46} no210 (state_0_port, state_1_port, shift_reset_port, vss, vdd);
}



