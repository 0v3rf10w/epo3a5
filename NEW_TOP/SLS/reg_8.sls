extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
network reg_8 (terminal reg_in_7_0_7, reg_in_7_0_6, reg_in_7_0_5, reg_in_7_0_4, 
                        reg_in_7_0_3, reg_in_7_0_2, reg_in_7_0_1, reg_in_7_0_0, 
                        reg_clk, reg_rst, reg_ld_4_0_4, reg_ld_4_0_3, 
                        reg_ld_4_0_2, reg_ld_4_0_1, reg_ld_4_0_0, 
                        reg_out_7_0_7, reg_out_7_0_6, reg_out_7_0_5, 
                        reg_out_7_0_4, reg_out_7_0_3, reg_out_7_0_2, 
                        reg_out_7_0_1, reg_out_7_0_0, vss, vdd)
{
   net {reg_out_7_0_7, reg_out_7_port};
   net {reg_out_7_0_6, reg_out_6_port};
   net {reg_out_7_0_5, reg_out_5_port};
   net {reg_out_7_0_4, reg_out_4_port};
   net {reg_out_7_0_3, reg_out_3_port};
   net {reg_out_7_0_2, reg_out_2_port};
   net {reg_out_7_0_1, reg_out_1_port};
   net {reg_out_7_0_0, reg_out_0_port};
   {reg_out_reg_7_inst} dfa11 (n27, reg_clk, reg_rst, reg_out_7_port, vss, vdd);
   {reg_out_reg_6_inst} dfa11 (n26, reg_clk, reg_rst, reg_out_6_port, vss, vdd);
   {reg_out_reg_5_inst} dfa11 (n25, reg_clk, reg_rst, reg_out_5_port, vss, vdd);
   {reg_out_reg_4_inst} dfa11 (n24, reg_clk, reg_rst, reg_out_4_port, vss, vdd);
   {reg_out_reg_3_inst} dfa11 (n23, reg_clk, reg_rst, reg_out_3_port, vss, vdd);
   {reg_out_reg_2_inst} dfa11 (n22, reg_clk, reg_rst, reg_out_2_port, vss, vdd);
   {reg_out_reg_1_inst} dfa11 (n21, reg_clk, reg_rst, reg_out_1_port, vss, vdd);
   {reg_out_reg_0_inst} dfa11 (n20, reg_clk, reg_rst, reg_out_0_port, vss, vdd);
   {U29} na310 (reg_ld_4_0_4, reg_ld_4_0_3, n30, n28, vss, vdd);
   {U30} mu111 (reg_in_7_0_7, reg_out_7_port, n28, n27, vss, vdd);
   {U31} mu111 (reg_in_7_0_6, reg_out_6_port, n29, n26, vss, vdd);
   {U32} mu111 (reg_in_7_0_5, reg_out_5_port, n28, n25, vss, vdd);
   {U33} mu111 (reg_in_7_0_4, reg_out_4_port, n29, n24, vss, vdd);
   {U34} mu111 (reg_in_7_0_3, reg_out_3_port, n28, n23, vss, vdd);
   {U35} mu111 (reg_in_7_0_2, reg_out_2_port, n29, n22, vss, vdd);
   {U36} mu111 (reg_in_7_0_1, reg_out_1_port, n28, n21, vss, vdd);
   {U37} mu111 (reg_in_7_0_0, reg_out_0_port, n29, n20, vss, vdd);
   {U38} na310 (reg_ld_4_0_4, reg_ld_4_0_3, n30, n29, vss, vdd);
   {U39} no310 (reg_ld_4_0_0, reg_ld_4_0_2, reg_ld_4_0_1, n30, vss, vdd);
}



