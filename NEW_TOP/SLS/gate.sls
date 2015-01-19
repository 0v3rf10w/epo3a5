extern network iv110 (terminal A, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
network gate (terminal input, output, sw, vss, vdd)
{
   {U4} iv110 (n3, output, vss, vdd);
   {U5} na210 (sw, input, n3, vss, vdd);
}



