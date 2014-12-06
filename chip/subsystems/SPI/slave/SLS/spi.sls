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
extern network control (terminal clk, reset, send, count_3_0_3, count_3_0_2, 
                                 count_3_0_1, count_3_0_0, shift, sclk, 
                                 c_reset, ss, busy, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network spi (terminal clk, send, reset, write_enable, write_in_7_0_7, 
                      write_in_7_0_6, write_in_7_0_5, write_in_7_0_4, 
                      write_in_7_0_3, write_in_7_0_2, write_in_7_0_1, 
                      write_in_7_0_0, read_out_7_0_7, read_out_7_0_6, 
                      read_out_7_0_5, read_out_7_0_4, read_out_7_0_3, 
                      read_out_7_0_2, read_out_7_0_1, read_out_7_0_0, busy, 
                      sclk, mosi, miso, ss, vss, vdd)
{
   net {read_out_7_0_7, read_out_7_port};
   net {read_out_7_0_6, read_out_6_port};
   net {read_out_7_0_5, read_out_5_port};
   net {read_out_7_0_4, read_out_4_port};
   net {read_out_7_0_3, read_out_3_port};
   net {read_out_7_0_2, read_out_2_port};
   net {read_out_7_0_1, read_out_1_port};
   net {read_out_7_0_0, read_out_0_port};
   net {sclk, sclk_port};
   net {mosi, read_out_7_port};
   {cnt1} counter (sclk_port, count_reset, count_3_port, count_2_port, 
                   count_1_port, count_0_port, vss, vdd);
   {shft1} shift_reg (n1, reset, shift, miso, write_enable, write_in_7_0_7, 
                      write_in_7_0_6, write_in_7_0_5, write_in_7_0_4, 
                      write_in_7_0_3, write_in_7_0_2, write_in_7_0_1, 
                      write_in_7_0_0, read_out_7_port, read_out_6_port, 
                      read_out_5_port, read_out_4_port, read_out_3_port, 
                      read_out_2_port, read_out_1_port, read_out_0_port, vss, 
                      vdd);
   {ctrl1} control (clk, reset, send, count_3_port, count_2_port, count_1_port, 
                    count_0_port, shift, sclk_port, count_reset, ss, busy, vss, 
                    vdd);
   {U2} iv110 (clk, n1, vss, vdd);
}



