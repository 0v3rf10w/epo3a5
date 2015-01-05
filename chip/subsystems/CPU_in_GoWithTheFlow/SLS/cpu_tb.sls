extern network cpu (terminal cpu_clk, cpu_rst, cpu_en, cpu_in_7_0_7, 
                             cpu_in_7_0_6, cpu_in_7_0_5, cpu_in_7_0_4, 
                             cpu_in_7_0_3, cpu_in_7_0_2, cpu_in_7_0_1, 
                             cpu_in_7_0_0, cpu_instr_11_0_11, 
                             cpu_instr_11_0_10, cpu_instr_11_0_9, 
                             cpu_instr_11_0_8, cpu_instr_11_0_7, 
                             cpu_instr_11_0_6, cpu_instr_11_0_5, 
                             cpu_instr_11_0_4, cpu_instr_11_0_3, 
                             cpu_instr_11_0_2, cpu_instr_11_0_1, 
                             cpu_instr_11_0_0, cpu_pc_7_0_7, cpu_pc_7_0_6, 
                             cpu_pc_7_0_5, cpu_pc_7_0_4, cpu_pc_7_0_3, 
                             cpu_pc_7_0_2, cpu_pc_7_0_1, cpu_pc_7_0_0, 
                             cpu_out_7_0_7, cpu_out_7_0_6, cpu_out_7_0_5, 
                             cpu_out_7_0_4, cpu_out_7_0_3, cpu_out_7_0_2, 
                             cpu_out_7_0_1, cpu_out_7_0_0, cpu_test_inc, 
                             cpu_test_ld, cpu_test_data_7_0_7, 
                             cpu_test_data_7_0_6, cpu_test_data_7_0_5, 
                             cpu_test_data_7_0_4, cpu_test_data_7_0_3, 
                             cpu_test_data_7_0_2, cpu_test_data_7_0_1, 
                             cpu_test_data_7_0_0, vss, vdd)
network cpu_tb (terminal vss, vdd)
{
   {lbl1} cpu (X_Logic1_port, X_Logic1_port, X_Logic0_port, X_Logic0_port, 
               X_Logic0_port, X_Logic0_port, X_Logic0_port, X_Logic0_port, 
               X_Logic0_port, X_Logic0_port, X_Logic0_port, X_Logic0_port, 
               X_Logic0_port, X_Logic0_port, X_Logic0_port, X_Logic0_port, 
               X_Logic0_port, X_Logic0_port, X_Logic0_port, X_Logic0_port, 
               X_Logic0_port, X_Logic0_port, X_Logic0_port, n_1000, n_1001, 
               n_1002, n_1003, n_1004, n_1005, n_1006, n_1007, n_1008, n_1009, 
               n_1010, n_1011, n_1012, n_1013, n_1014, n_1015, n_1016, n_1017, 
               n_1018, n_1019, n_1020, n_1021, n_1022, n_1023, n_1024, n_1025, 
               vss, vdd);
   net {X_Logic1_port, vdd};
   net {X_Logic0_port, vss};
}



