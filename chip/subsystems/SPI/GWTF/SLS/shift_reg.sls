extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
network shift_reg (terminal clk, reset, enable, shift_in, reg_set, 
                            reg_write_7_0_7, reg_write_7_0_6, reg_write_7_0_5, 
                            reg_write_7_0_4, reg_write_7_0_3, reg_write_7_0_2, 
                            reg_write_7_0_1, reg_write_7_0_0, output_7_0_7, 
                            output_7_0_6, output_7_0_5, output_7_0_4, 
                            output_7_0_3, output_7_0_2, output_7_0_1, 
                            output_7_0_0, vss, vdd)
{
   net {output_7_0_7, output_7_port};
   net {output_7_0_6, output_6_port};
   net {output_7_0_5, output_5_port};
   net {output_7_0_4, output_4_port};
   net {output_7_0_3, output_3_port};
   net {output_7_0_2, output_2_port};
   net {output_7_0_1, output_1_port};
   net {output_7_0_0, output_0_port};
   {reg_shift_reg_0_inst} dfa11 (n34, clk, reset, output_0_port, vss, vdd);
   {reg_shift_reg_1_inst} dfa11 (n33, clk, reset, output_1_port, vss, vdd);
   {reg_shift_reg_2_inst} dfa11 (n32, clk, reset, output_2_port, vss, vdd);
   {reg_shift_reg_3_inst} dfa11 (n31, clk, reset, output_3_port, vss, vdd);
   {reg_shift_reg_4_inst} dfa11 (n30, clk, reset, output_4_port, vss, vdd);
   {reg_shift_reg_5_inst} dfa11 (n29, clk, reset, output_5_port, vss, vdd);
   {reg_shift_reg_6_inst} dfa11 (n28, clk, reset, output_6_port, vss, vdd);
   {reg_shift_reg_7_inst} dfa11 (n27, clk, reset, output_7_port, vss, vdd);
   {U36} na310 (n35, n36, n37, n34, vss, vdd);
   {U37} na210 (reg_write_7_0_0, reg_set, n37, vss, vdd);
   {U38} na210 (shift_in, n38, n36, vss, vdd);
   {U39} na210 (output_0_port, n39, n35, vss, vdd);
   {U40} na310 (n40, n41, n42, n33, vss, vdd);
   {U41} na210 (reg_write_7_0_1, reg_set, n42, vss, vdd);
   {U42} na210 (output_0_port, n38, n41, vss, vdd);
   {U43} na210 (output_1_port, n39, n40, vss, vdd);
   {U44} na310 (n43, n44, n45, n32, vss, vdd);
   {U45} na210 (reg_write_7_0_2, reg_set, n45, vss, vdd);
   {U46} na210 (output_1_port, n38, n44, vss, vdd);
   {U47} na210 (output_2_port, n39, n43, vss, vdd);
   {U48} na310 (n46, n47, n48, n31, vss, vdd);
   {U49} na210 (reg_write_7_0_3, reg_set, n48, vss, vdd);
   {U50} na210 (output_2_port, n38, n47, vss, vdd);
   {U51} na210 (output_3_port, n39, n46, vss, vdd);
   {U52} na310 (n49, n50, n51, n30, vss, vdd);
   {U53} na210 (reg_write_7_0_4, reg_set, n51, vss, vdd);
   {U54} na210 (output_3_port, n38, n50, vss, vdd);
   {U55} na210 (output_4_port, n39, n49, vss, vdd);
   {U56} na310 (n52, n53, n54, n29, vss, vdd);
   {U57} na210 (reg_write_7_0_5, reg_set, n54, vss, vdd);
   {U58} na210 (output_4_port, n38, n53, vss, vdd);
   {U59} na210 (output_5_port, n39, n52, vss, vdd);
   {U60} na310 (n55, n56, n57, n28, vss, vdd);
   {U61} na210 (reg_write_7_0_6, reg_set, n57, vss, vdd);
   {U62} na210 (output_5_port, n38, n56, vss, vdd);
   {U63} na210 (output_6_port, n39, n55, vss, vdd);
   {U64} na310 (n58, n59, n60, n27, vss, vdd);
   {U65} na210 (reg_write_7_0_7, reg_set, n60, vss, vdd);
   {U66} na210 (output_6_port, n38, n59, vss, vdd);
   {U67} no210 (n39, reg_set, n38, vss, vdd);
   {U68} na210 (output_7_port, n39, n58, vss, vdd);
   {U69} no210 (enable, reg_set, n39, vss, vdd);
}



