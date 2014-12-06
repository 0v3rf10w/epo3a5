extern network counter (terminal clk, reset, count_out_3_0_3, count_out_3_0_2, 
                                 count_out_3_0_1, count_out_3_0_0, vss, vdd)
extern network shift_reg (terminal clk, reset, enable, shift_in, reg_set, 
                                   reg_write_7_0_7, reg_write_7_0_6, 
                                   reg_write_7_0_5, reg_write_7_0_4, 
                                   reg_write_7_0_3, reg_write_7_0_2, 
                                   reg_write_7_0_1, reg_write_7_0_0, 
                                   output_7_0_7, output_7_0_6, output_7_0_5, 
                                   output_7_0_4, output_7_0_3, output_7_0_2, 
                                   output_7_0_1, output_7_0_0, vss, vdd)
extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network spi_slave (terminal reset, read_out_7_0_7, read_out_7_0_6, 
                            read_out_7_0_5, read_out_7_0_4, read_out_7_0_3, 
                            read_out_7_0_2, read_out_7_0_1, read_out_7_0_0, 
                            data_ready, sclk, mosi, miso, ss, vss, vdd)
{
   net {miso, X_Logic1_port};
   {cnt1} counter (n3, count_reset, count_3_port, count_2_port, count_1_port, 
                   count_0_port, vss, vdd);
   {shft1} shift_reg (sclk, reset, X_Logic1_port, shift_in, X_Logic0_port, 
                      X_Logic1_port, X_Logic1_port, X_Logic1_port, 
                      X_Logic1_port, X_Logic1_port, X_Logic1_port, 
                      X_Logic1_port, X_Logic1_port, read_out_7_0_7, 
                      read_out_7_0_6, read_out_7_0_5, read_out_7_0_4, 
                      read_out_7_0_3, read_out_7_0_2, read_out_7_0_1, 
                      read_out_7_0_0, vss, vdd);
   net {X_Logic1_port, vdd};
   net {X_Logic0_port, vss};
   {shift_in_reg} dfa11 (mosi, sclk, reset, shift_in, vss, vdd);
   {U10} iv110 (sclk, n3, vss, vdd);
   {U11} no210 (count_3_port, n7, data_ready, vss, vdd);
   {U12} iv110 (n8, n7, vss, vdd);
   {U13} na210 (n9, n10, count_reset, vss, vdd);
   {U14} na210 (count_3_port, n8, n10, vss, vdd);
   {U15} no310 (count_0_port, count_2_port, count_1_port, n8, vss, vdd);
   {U16} iv110 (reset, n9, vss, vdd);
}



