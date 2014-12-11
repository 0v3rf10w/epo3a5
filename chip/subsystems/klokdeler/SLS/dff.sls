extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network dff (terminal clk, d, reset, q, qbar, vss, vdd)
{
   net {q, q_port};
   net {qbar, state};
   {state_reg} dfa11 (q_port, clk, reset, state, vss, vdd);
   {U4} iv110 (state, q_port, vss, vdd);
}



