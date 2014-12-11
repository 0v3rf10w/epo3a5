extern network dff (terminal clk, d, reset, q, qbar, vss, vdd)
network klokdeler (terminal clk, f2, f4, f8, f16, f32, f64, f128, f256, f512, 
                            f1024, f2048, f4096, f8192, f16384, f32768, f65536, 
                            f131072, reset, vss, vdd)
{
   {lbl1} dff (clk, d2, reset, f2, d2, vss, vdd);
   {lbl2} dff (d2, d4, reset, f4, d4, vss, vdd);
   {lbl3} dff (d4, d8, reset, f8, d8, vss, vdd);
   {lbl4} dff (d8, d16, reset, f16, d16, vss, vdd);
   {lbl5} dff (d16, d32, reset, f32, d32, vss, vdd);
   {lbl6} dff (d32, d64, reset, f64, d64, vss, vdd);
   {lbl7} dff (d64, d128, reset, f128, d128, vss, vdd);
   {lbl8} dff (d128, d256, reset, f256, d256, vss, vdd);
   {lbl9} dff (d256, d512, reset, f512, d512, vss, vdd);
   {lbl10} dff (d512, d1024, reset, f1024, d1024, vss, vdd);
   {lbl11} dff (d1024, d2048, reset, f2048, d2048, vss, vdd);
   {lbl12} dff (d2048, d4096, reset, f4096, d4096, vss, vdd);
   {lbl13} dff (d4096, d8192, reset, f8192, d8192, vss, vdd);
   {lbl14} dff (d8192, d16384, reset, f16384, d16384, vss, vdd);
   {lbl15} dff (d16384, d32768, reset, f32768, d32768, vss, vdd);
   {lbl16} dff (d32768, d65536, reset, f65536, d65536, vss, vdd);
   {lbl17} dff (d65536, d131072, reset, f131072, d131072, vss, vdd);
}



