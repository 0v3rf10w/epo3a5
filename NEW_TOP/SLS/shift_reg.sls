extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network shift_reg (terminal clk, reset, shift_in, output_7_0_7, output_7_0_6, 
                            output_7_0_5, output_7_0_4, output_7_0_3, 
                            output_7_0_2, output_7_0_1, output_7_0_0, vss, vdd)
{
   net {output_7_0_7, output_7_port};
   net {output_7_0_6, output_6_port};
   net {output_7_0_5, output_5_port};
   net {output_7_0_4, output_4_port};
   net {output_7_0_3, output_3_port};
   net {output_7_0_2, output_2_port};
   net {output_7_0_1, output_1_port};
   net {output_7_0_0, output_0_port};
   {reg_shift_reg_0_inst} dfa11 (shift_in, n1, reset, output_0_port, vss, vdd);
   {reg_shift_reg_1_inst} dfa11 (output_0_port, n1, reset, output_1_port, vss, 
                                 vdd);
   {reg_shift_reg_2_inst} dfa11 (output_1_port, n1, reset, output_2_port, vss, 
                                 vdd);
   {reg_shift_reg_3_inst} dfa11 (output_2_port, n1, reset, output_3_port, vss, 
                                 vdd);
   {reg_shift_reg_4_inst} dfa11 (output_3_port, n1, reset, output_4_port, vss, 
                                 vdd);
   {reg_shift_reg_5_inst} dfa11 (output_4_port, n1, reset, output_5_port, vss, 
                                 vdd);
   {reg_shift_reg_6_inst} dfa11 (output_5_port, n1, reset, output_6_port, vss, 
                                 vdd);
   {reg_shift_reg_7_inst} dfa11 (output_6_port, n1, reset, output_7_port, vss, 
                                 vdd);
   {U4} iv110 (clk, n1, vss, vdd);
}



