extern network instr_buf (terminal buf_in_11_0_11, buf_in_11_0_10, 
                                   buf_in_11_0_9, buf_in_11_0_8, buf_in_11_0_7, 
                                   buf_in_11_0_6, buf_in_11_0_5, buf_in_11_0_4, 
                                   buf_in_11_0_3, buf_in_11_0_2, buf_in_11_0_1, 
                                   buf_in_11_0_0, buf_oe, buf_out_11_0_11, 
                                   buf_out_11_0_10, buf_out_11_0_9, 
                                   buf_out_11_0_8, buf_out_11_0_7, 
                                   buf_out_11_0_6, buf_out_11_0_5, 
                                   buf_out_11_0_4, buf_out_11_0_3, 
                                   buf_out_11_0_2, buf_out_11_0_1, 
                                   buf_out_11_0_0, vss, vdd)
extern network decoder (terminal decoder_in_11_0_11, decoder_in_11_0_10, 
                                 decoder_in_11_0_9, decoder_in_11_0_8, 
                                 decoder_in_11_0_7, decoder_in_11_0_6, 
                                 decoder_in_11_0_5, decoder_in_11_0_4, 
                                 decoder_in_11_0_3, decoder_in_11_0_2, 
                                 decoder_in_11_0_1, decoder_in_11_0_0, 
                                 decoder_c, decoder_z, decoder_pc_inc, 
                                 decoder_pc_ld, decoder_ibufoe, decoder_aregld, 
                                 decoder_abufoe, decoder_bregld_4_0_4, 
                                 decoder_bregld_4_0_3, decoder_bregld_4_0_2, 
                                 decoder_bregld_4_0_1, decoder_bregld_4_0_0, 
                                 decoder_bbufoe_4_0_4, decoder_bbufoe_4_0_3, 
                                 decoder_bbufoe_4_0_2, decoder_bbufoe_4_0_1, 
                                 decoder_bbufoe_4_0_0, decoder_alu_2_0_2, 
                                 decoder_alu_2_0_1, decoder_alu_2_0_0, 
                                 decoder_argout_7_0_7, decoder_argout_7_0_6, 
                                 decoder_argout_7_0_5, decoder_argout_7_0_4, 
                                 decoder_argout_7_0_3, decoder_argout_7_0_2, 
                                 decoder_argout_7_0_1, decoder_argout_7_0_0, 
                                 vss, vdd)
extern network buf_arg (terminal buf_in_7_0_7, buf_in_7_0_6, buf_in_7_0_5, 
                                 buf_in_7_0_4, buf_in_7_0_3, buf_in_7_0_2, 
                                 buf_in_7_0_1, buf_in_7_0_0, buf_oe, 
                                 buf_out_7_0_7, buf_out_7_0_6, buf_out_7_0_5, 
                                 buf_out_7_0_4, buf_out_7_0_3, buf_out_7_0_2, 
                                 buf_out_7_0_1, buf_out_7_0_0, vss, vdd)
extern network pc_counter (terminal pc_in_7_0_7, pc_in_7_0_6, pc_in_7_0_5, 
                                    pc_in_7_0_4, pc_in_7_0_3, pc_in_7_0_2, 
                                    pc_in_7_0_1, pc_in_7_0_0, pc_inc, pc_ld, 
                                    pc_rst, pc_clk, pc_out_7_0_7, pc_out_7_0_6, 
                                    pc_out_7_0_5, pc_out_7_0_4, pc_out_7_0_3, 
                                    pc_out_7_0_2, pc_out_7_0_1, pc_out_7_0_0, 
                                    vss, vdd)
extern network alu (terminal alu_A_7_0_7, alu_A_7_0_6, alu_A_7_0_5, 
                             alu_A_7_0_4, alu_A_7_0_3, alu_A_7_0_2, 
                             alu_A_7_0_1, alu_A_7_0_0, alu_B_7_0_7, 
                             alu_B_7_0_6, alu_B_7_0_5, alu_B_7_0_4, 
                             alu_B_7_0_3, alu_B_7_0_2, alu_B_7_0_1, 
                             alu_B_7_0_0, opcode_2_0_2, opcode_2_0_1, 
                             opcode_2_0_0, alu_clk, alu_c, alu_z, alu_y_7_0_7, 
                             alu_y_7_0_6, alu_y_7_0_5, alu_y_7_0_4, 
                             alu_y_7_0_3, alu_y_7_0_2, alu_y_7_0_1, 
                             alu_y_7_0_0, vss, vdd)
extern network reg_a (terminal reg_in_7_0_7, reg_in_7_0_6, reg_in_7_0_5, 
                               reg_in_7_0_4, reg_in_7_0_3, reg_in_7_0_2, 
                               reg_in_7_0_1, reg_in_7_0_0, reg_clk, reg_rst, 
                               reg_ld, reg_out_7_0_7, reg_out_7_0_6, 
                               reg_out_7_0_5, reg_out_7_0_4, reg_out_7_0_3, 
                               reg_out_7_0_2, reg_out_7_0_1, reg_out_7_0_0, 
                               vss, vdd)
extern network buf_a (terminal buf_in_7_0_7, buf_in_7_0_6, buf_in_7_0_5, 
                               buf_in_7_0_4, buf_in_7_0_3, buf_in_7_0_2, 
                               buf_in_7_0_1, buf_in_7_0_0, buf_oe, 
                               buf_out_7_0_7, buf_out_7_0_6, buf_out_7_0_5, 
                               buf_out_7_0_4, buf_out_7_0_3, buf_out_7_0_2, 
                               buf_out_7_0_1, buf_out_7_0_0, vss, vdd)
extern network reg_cluster (terminal reg_in_7_0_7, reg_in_7_0_6, reg_in_7_0_5, 
                                     reg_in_7_0_4, reg_in_7_0_3, reg_in_7_0_2, 
                                     reg_in_7_0_1, reg_in_7_0_0, reg_clk, 
                                     reg_rst, reg_select_4_0_4, 
                                     reg_select_4_0_3, reg_select_4_0_2, 
                                     reg_select_4_0_1, reg_select_4_0_0, 
                                     buf_select_4_0_4, buf_select_4_0_3, 
                                     buf_select_4_0_2, buf_select_4_0_1, 
                                     buf_select_4_0_0, buf_in_7_0_7, 
                                     buf_in_7_0_6, buf_in_7_0_5, buf_in_7_0_4, 
                                     buf_in_7_0_3, buf_in_7_0_2, buf_in_7_0_1, 
                                     buf_in_7_0_0, buf_out_7_0_7, 
                                     buf_out_7_0_6, buf_out_7_0_5, 
                                     buf_out_7_0_4, buf_out_7_0_3, 
                                     buf_out_7_0_2, buf_out_7_0_1, 
                                     buf_out_7_0_0, reg_out_7_0_7, 
                                     reg_out_7_0_6, reg_out_7_0_5, 
                                     reg_out_7_0_4, reg_out_7_0_3, 
                                     reg_out_7_0_2, reg_out_7_0_1, 
                                     reg_out_7_0_0, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network buf40 (terminal A, Y, vss, vdd)
network cpu (terminal cpu_clk, cpu_rst, cpu_en, cpu_in_7_0_7, cpu_in_7_0_6, 
                      cpu_in_7_0_5, cpu_in_7_0_4, cpu_in_7_0_3, cpu_in_7_0_2, 
                      cpu_in_7_0_1, cpu_in_7_0_0, cpu_instr_11_0_11, 
                      cpu_instr_11_0_10, cpu_instr_11_0_9, cpu_instr_11_0_8, 
                      cpu_instr_11_0_7, cpu_instr_11_0_6, cpu_instr_11_0_5, 
                      cpu_instr_11_0_4, cpu_instr_11_0_3, cpu_instr_11_0_2, 
                      cpu_instr_11_0_1, cpu_instr_11_0_0, cpu_pc_7_0_7, 
                      cpu_pc_7_0_6, cpu_pc_7_0_5, cpu_pc_7_0_4, cpu_pc_7_0_3, 
                      cpu_pc_7_0_2, cpu_pc_7_0_1, cpu_pc_7_0_0, cpu_out_7_0_7, 
                      cpu_out_7_0_6, cpu_out_7_0_5, cpu_out_7_0_4, 
                      cpu_out_7_0_3, cpu_out_7_0_2, cpu_out_7_0_1, 
                      cpu_out_7_0_0, cpu_test_inc, cpu_test_ld, 
                      cpu_test_data_7_0_7, cpu_test_data_7_0_6, 
                      cpu_test_data_7_0_5, cpu_test_data_7_0_4, 
                      cpu_test_data_7_0_3, cpu_test_data_7_0_2, 
                      cpu_test_data_7_0_1, cpu_test_data_7_0_0, vss, vdd)
{
   net {cpu_test_inc, cpu_test_inc_port};
   net {cpu_test_ld, cpu_test_ld_port};
   net {cpu_test_data_7_0_7, cpu_test_data_7_port};
   net {cpu_test_data_7_0_6, cpu_test_data_6_port};
   net {cpu_test_data_7_0_5, cpu_test_data_5_port};
   net {cpu_test_data_7_0_4, cpu_test_data_4_port};
   net {cpu_test_data_7_0_3, cpu_test_data_3_port};
   net {cpu_test_data_7_0_2, cpu_test_data_2_port};
   net {cpu_test_data_7_0_1, cpu_test_data_1_port};
   net {cpu_test_data_7_0_0, cpu_test_data_0_port};
   {lbl_instrbuf} instr_buf (cpu_instr_11_0_11, cpu_instr_11_0_10, 
                             cpu_instr_11_0_9, cpu_instr_11_0_8, 
                             cpu_instr_11_0_7, cpu_instr_11_0_6, 
                             cpu_instr_11_0_5, cpu_instr_11_0_4, 
                             cpu_instr_11_0_3, cpu_instr_11_0_2, 
                             cpu_instr_11_0_1, cpu_instr_11_0_0, cpu_en, 
                             n_1000, n_1001, n_1002, n_1003, n_1004, n_1005, 
                             n_1006, n_1007, n_1008, n_1009, n_1010, n_1011, 
                             vss, vdd);
   {lbl_decoder} decoder (cpu_instr_11_0_11, cpu_instr_11_0_10, 
                          cpu_instr_11_0_9, cpu_instr_11_0_8, cpu_instr_11_0_7, 
                          cpu_instr_11_0_6, cpu_instr_11_0_5, cpu_instr_11_0_4, 
                          cpu_instr_11_0_3, cpu_instr_11_0_2, cpu_instr_11_0_1, 
                          cpu_instr_11_0_0, cpu_alu_c, cpu_alu_z, 
                          cpu_test_inc_port, cpu_test_ld_port, cpu_dec_ibufoe, 
                          cpu_dec_aregld, cpu_dec_abufoe, 
                          cpu_dec_bregld_4_port, cpu_dec_bregld_3_port, 
                          cpu_dec_bregld_2_port, cpu_dec_bregld_1_port, 
                          cpu_dec_bregld_0_port, cpu_dec_bbufoe_4_port, 
                          cpu_dec_bbufoe_3_port, cpu_dec_bbufoe_2_port, 
                          cpu_dec_bbufoe_1_port, cpu_dec_bbufoe_0_port, 
                          cpu_alu_op_2_port, cpu_alu_op_1_port, 
                          cpu_alu_op_0_port, cpu_dec_o_7_port, 
                          cpu_dec_o_6_port, cpu_dec_o_5_port, cpu_dec_o_4_port, 
                          cpu_dec_o_3_port, cpu_dec_o_2_port, cpu_dec_o_1_port, 
                          cpu_dec_o_0_port, vss, vdd);
   {lbl_cpu_ibuf} buf_arg (cpu_dec_o_7_port, cpu_dec_o_6_port, 
                           cpu_dec_o_5_port, cpu_dec_o_4_port, 
                           cpu_dec_o_3_port, cpu_dec_o_2_port, 
                           cpu_dec_o_1_port, cpu_dec_o_0_port, cpu_dec_ibufoe, 
                           cpu_test_data_7_port, cpu_test_data_6_port, 
                           cpu_test_data_5_port, cpu_test_data_4_port, 
                           cpu_test_data_3_port, cpu_test_data_2_port, 
                           cpu_test_data_1_port, cpu_test_data_0_port, vss, 
                           vdd);
   {lbl_cpu_pc} pc_counter (cpu_test_data_7_port, cpu_test_data_6_port, 
                            cpu_test_data_5_port, cpu_test_data_4_port, 
                            cpu_test_data_3_port, cpu_test_data_2_port, 
                            cpu_test_data_1_port, cpu_test_data_0_port, 
                            cpu_test_inc_port, cpu_test_ld_port, cpu_rst, 
                            cpu_clk, cpu_pc_7_0_7, cpu_pc_7_0_6, cpu_pc_7_0_5, 
                            cpu_pc_7_0_4, cpu_pc_7_0_3, cpu_pc_7_0_2, 
                            cpu_pc_7_0_1, cpu_pc_7_0_0, vss, vdd);
   {lbl_cpu_alu} alu (cpu_test_data_7_port, cpu_test_data_6_port, 
                      cpu_test_data_5_port, cpu_test_data_4_port, 
                      cpu_test_data_3_port, cpu_test_data_2_port, 
                      cpu_test_data_1_port, cpu_test_data_0_port, 
                      cpu_areg_out_7_port, cpu_areg_out_6_port, 
                      cpu_areg_out_5_port, cpu_areg_out_4_port, 
                      cpu_areg_out_3_port, cpu_areg_out_2_port, 
                      cpu_areg_out_1_port, cpu_areg_out_0_port, 
                      cpu_alu_op_2_port, cpu_alu_op_1_port, cpu_alu_op_0_port, 
                      cpu_clk, cpu_alu_c, cpu_alu_z, cpu_alu_out_7_port, 
                      cpu_alu_out_6_port, cpu_alu_out_5_port, 
                      cpu_alu_out_4_port, cpu_alu_out_3_port, 
                      cpu_alu_out_2_port, cpu_alu_out_1_port, 
                      cpu_alu_out_0_port, vss, vdd);
   {lbl_cpu_reg_A} reg_a (cpu_alu_out_7_port, cpu_alu_out_6_port, 
                          cpu_alu_out_5_port, cpu_alu_out_4_port, 
                          cpu_alu_out_3_port, cpu_alu_out_2_port, 
                          cpu_alu_out_1_port, cpu_alu_out_0_port, cpu_clk, 
                          cpu_rst, cpu_dec_aregld, cpu_areg_out_7_port, 
                          cpu_areg_out_6_port, cpu_areg_out_5_port, 
                          cpu_areg_out_4_port, cpu_areg_out_3_port, 
                          cpu_areg_out_2_port, cpu_areg_out_1_port, 
                          cpu_areg_out_0_port, vss, vdd);
   {lbl_cpu_buf_A} buf_a (cpu_areg_out_7_port, cpu_areg_out_6_port, 
                          cpu_areg_out_5_port, cpu_areg_out_4_port, 
                          cpu_areg_out_3_port, cpu_areg_out_2_port, 
                          cpu_areg_out_1_port, cpu_areg_out_0_port, n4, 
                          cpu_test_data_7_port, cpu_test_data_6_port, 
                          cpu_test_data_5_port, cpu_test_data_4_port, 
                          cpu_test_data_3_port, cpu_test_data_2_port, 
                          cpu_test_data_1_port, cpu_test_data_0_port, vss, vdd);
   {lbl_bregs} reg_cluster (n7, n12, n6, n11, n5, n10, n9, n8, cpu_clk, 
                            cpu_rst, n2, cpu_dec_bregld_3_port, 
                            cpu_dec_bregld_2_port, cpu_dec_bregld_1_port, 
                            cpu_dec_bregld_0_port, n1, cpu_dec_bbufoe_3_port, 
                            cpu_dec_bbufoe_2_port, cpu_dec_bbufoe_1_port, 
                            cpu_dec_bbufoe_0_port, cpu_in_7_0_7, cpu_in_7_0_6, 
                            cpu_in_7_0_5, cpu_in_7_0_4, cpu_in_7_0_3, 
                            cpu_in_7_0_2, cpu_in_7_0_1, cpu_in_7_0_0, 
                            cpu_test_data_7_port, cpu_test_data_6_port, 
                            cpu_test_data_5_port, cpu_test_data_4_port, 
                            cpu_test_data_3_port, cpu_test_data_2_port, 
                            cpu_test_data_1_port, cpu_test_data_0_port, 
                            cpu_out_7_0_7, cpu_out_7_0_6, cpu_out_7_0_5, 
                            cpu_out_7_0_4, cpu_out_7_0_3, cpu_out_7_0_2, 
                            cpu_out_7_0_1, cpu_out_7_0_0, vss, vdd);
   {U1} buf40 (cpu_dec_bbufoe_4_port, n1, vss, vdd);
   {U2} buf40 (cpu_dec_bregld_4_port, n2, vss, vdd);
   {U3} iv110 (cpu_dec_abufoe, n3, vss, vdd);
   {U4} iv110 (n3, n4, vss, vdd);
   {U5} buf40 (cpu_test_data_3_port, n5, vss, vdd);
   {U6} buf40 (cpu_test_data_5_port, n6, vss, vdd);
   {U7} buf40 (cpu_test_data_7_port, n7, vss, vdd);
   {U8} buf40 (cpu_test_data_0_port, n8, vss, vdd);
   {U9} buf40 (cpu_test_data_1_port, n9, vss, vdd);
   {U10} buf40 (cpu_test_data_2_port, n10, vss, vdd);
   {U11} buf40 (cpu_test_data_4_port, n11, vss, vdd);
   {U12} buf40 (cpu_test_data_6_port, n12, vss, vdd);
}



