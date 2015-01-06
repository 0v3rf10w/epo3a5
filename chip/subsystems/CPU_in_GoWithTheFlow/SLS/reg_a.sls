extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
network reg_a (terminal reg_in_7_0_7, reg_in_7_0_6, reg_in_7_0_5, reg_in_7_0_4, 
                        reg_in_7_0_3, reg_in_7_0_2, reg_in_7_0_1, reg_in_7_0_0, 
                        reg_clk, reg_rst, reg_ld, reg_out_7_0_7, reg_out_7_0_6, 
                        reg_out_7_0_5, reg_out_7_0_4, reg_out_7_0_3, 
                        reg_out_7_0_2, reg_out_7_0_1, reg_out_7_0_0, vss, vdd)
{
   net {reg_out_7_0_7, reg_out_7_port};
   net {reg_out_7_0_6, reg_out_6_port};
   net {reg_out_7_0_5, reg_out_5_port};
   net {reg_out_7_0_4, reg_out_4_port};
   net {reg_out_7_0_3, reg_out_3_port};
   net {reg_out_7_0_2, reg_out_2_port};
   net {reg_out_7_0_1, reg_out_1_port};
   net {reg_out_7_0_0, reg_out_0_port};
   {reg_out_reg_7_inst} dfa11 (n25, reg_clk, reg_rst, reg_out_7_port, vss, vdd);
   {reg_out_reg_6_inst} dfa11 (n24, reg_clk, reg_rst, reg_out_6_port, vss, vdd);
   {reg_out_reg_5_inst} dfa11 (n23, reg_clk, reg_rst, reg_out_5_port, vss, vdd);
   {reg_out_reg_4_inst} dfa11 (n22, reg_clk, reg_rst, reg_out_4_port, vss, vdd);
   {reg_out_reg_3_inst} dfa11 (n21, reg_clk, reg_rst, reg_out_3_port, vss, vdd);
   {reg_out_reg_2_inst} dfa11 (n20, reg_clk, reg_rst, reg_out_2_port, vss, vdd);
   {reg_out_reg_1_inst} dfa11 (n19, reg_clk, reg_rst, reg_out_1_port, vss, vdd);
   {reg_out_reg_0_inst} dfa11 (n18, reg_clk, reg_rst, reg_out_0_port, vss, vdd);
   {U27} mu111 (reg_out_7_port, reg_in_7_0_7, reg_ld, n25, vss, vdd);
   {U28} mu111 (reg_out_6_port, reg_in_7_0_6, reg_ld, n24, vss, vdd);
   {U29} mu111 (reg_out_5_port, reg_in_7_0_5, reg_ld, n23, vss, vdd);
   {U30} mu111 (reg_out_4_port, reg_in_7_0_4, reg_ld, n22, vss, vdd);
   {U31} mu111 (reg_out_3_port, reg_in_7_0_3, reg_ld, n21, vss, vdd);
   {U32} mu111 (reg_out_2_port, reg_in_7_0_2, reg_ld, n20, vss, vdd);
   {U33} mu111 (reg_out_1_port, reg_in_7_0_1, reg_ld, n19, vss, vdd);
   {U34} mu111 (reg_out_0_port, reg_in_7_0_0, reg_ld, n18, vss, vdd);
}



