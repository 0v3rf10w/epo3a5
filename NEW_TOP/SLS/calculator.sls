extern network osc10 (terminal E, XI, XO, F, vss, vdd)
extern network cpu (terminal cpu_rst, cpu_en, cpu_in_7_0_7, cpu_in_7_0_6, 
                             cpu_in_7_0_5, cpu_in_7_0_4, cpu_in_7_0_3, 
                             cpu_in_7_0_2, cpu_in_7_0_1, cpu_in_7_0_0, 
                             cpu_instr_11_0_11, cpu_instr_11_0_10, 
                             cpu_instr_11_0_9, cpu_instr_11_0_8, 
                             cpu_instr_11_0_7, cpu_instr_11_0_6, 
                             cpu_instr_11_0_5, cpu_instr_11_0_4, 
                             cpu_instr_11_0_3, cpu_instr_11_0_2, 
                             cpu_instr_11_0_1, cpu_instr_11_0_0, cpu_pc_7_0_7, 
                             cpu_pc_7_0_6, cpu_pc_7_0_5, cpu_pc_7_0_4, 
                             cpu_pc_7_0_3, cpu_pc_7_0_2, cpu_pc_7_0_1, 
                             cpu_pc_7_0_0, cpu_out_7_0_7, cpu_out_7_0_6, 
                             cpu_out_7_0_5, cpu_out_7_0_4, cpu_out_7_0_3, 
                             cpu_out_7_0_2, cpu_out_7_0_1, cpu_out_7_0_0, vss, 
                             vdd)
extern network gate (terminal input, output, sw, vss, vdd)
extern network rom (terminal rom_a_7_0_7, rom_a_7_0_6, rom_a_7_0_5, 
                             rom_a_7_0_4, rom_a_7_0_3, rom_a_7_0_2, 
                             rom_a_7_0_1, rom_a_7_0_0, rom_d_11_0_11, 
                             rom_d_11_0_10, rom_d_11_0_9, rom_d_11_0_8, 
                             rom_d_11_0_7, rom_d_11_0_6, rom_d_11_0_5, 
                             rom_d_11_0_4, rom_d_11_0_3, rom_d_11_0_2, 
                             rom_d_11_0_1, rom_d_11_0_0, vss, vdd)
extern network shift_reg (terminal clk, reset, shift_in, output_7_0_7, 
                                   output_7_0_6, output_7_0_5, output_7_0_4, 
                                   output_7_0_3, output_7_0_2, output_7_0_1, 
                                   output_7_0_0, vss, vdd)
extern network buf40 (terminal A, Y, vss, vdd)
network calculator (terminal XI, XO, top_reset, top_sclk, top_mosi, top_ss, 
                             top_out_7_0_7, top_out_7_0_6, top_out_7_0_5, 
                             top_out_7_0_4, top_out_7_0_3, top_out_7_0_2, 
                             top_out_7_0_1, top_out_7_0_0, vss, vdd)
{
   {lbl_osc} osc10 (X_Logic1_port, XI, XO, osc_clk, vss, vdd);
   {lbl_cpu} cpu (top_reset, n9, cpu_input_7_port, cpu_input_6_port, 
                  cpu_input_5_port, cpu_input_4_port, cpu_input_3_port, 
                  cpu_input_2_port, cpu_input_1_port, cpu_input_0_port, n1, n2, 
                  n3, n8, cpu_instr_7_port, cpu_instr_6_port, cpu_instr_5_port, 
                  cpu_instr_4_port, n7, n6, n5, n4, cpu_addr_7_port, 
                  cpu_addr_6_port, cpu_addr_5_port, cpu_addr_4_port, 
                  cpu_addr_3_port, cpu_addr_2_port, cpu_addr_1_port, 
                  cpu_addr_0_port, top_out_7_0_7, top_out_7_0_6, top_out_7_0_5, 
                  top_out_7_0_4, top_out_7_0_3, top_out_7_0_2, top_out_7_0_1, 
                  top_out_7_0_0, vss, vdd);
   {lbl_gate} gate (osc_clk, cpu_enable, top_ss, vss, vdd);
   {lbl_rom} rom (cpu_addr_7_port, cpu_addr_6_port, cpu_addr_5_port, 
                  cpu_addr_4_port, cpu_addr_3_port, cpu_addr_2_port, 
                  cpu_addr_1_port, cpu_addr_0_port, cpu_instr_11_port, 
                  cpu_instr_10_port, cpu_instr_9_port, cpu_instr_8_port, 
                  cpu_instr_7_port, cpu_instr_6_port, cpu_instr_5_port, 
                  cpu_instr_4_port, cpu_instr_3_port, cpu_instr_2_port, 
                  cpu_instr_1_port, cpu_instr_0_port, vss, vdd);
   {lbl_shift} shift_reg (top_sclk, top_reset, top_mosi, cpu_input_7_port, 
                          cpu_input_6_port, cpu_input_5_port, cpu_input_4_port, 
                          cpu_input_3_port, cpu_input_2_port, cpu_input_1_port, 
                          cpu_input_0_port, vss, vdd);
   net {X_Logic1_port, vdd};
   {U2} buf40 (cpu_instr_11_port, n1, vss, vdd);
   {U3} buf40 (cpu_instr_10_port, n2, vss, vdd);
   {U4} buf40 (cpu_instr_9_port, n3, vss, vdd);
   {U5} buf40 (cpu_instr_0_port, n4, vss, vdd);
   {U6} buf40 (cpu_instr_1_port, n5, vss, vdd);
   {U7} buf40 (cpu_instr_2_port, n6, vss, vdd);
   {U8} buf40 (cpu_instr_3_port, n7, vss, vdd);
   {U9} buf40 (cpu_instr_8_port, n8, vss, vdd);
   {U10} buf40 (cpu_enable, n9, vss, vdd);
}



