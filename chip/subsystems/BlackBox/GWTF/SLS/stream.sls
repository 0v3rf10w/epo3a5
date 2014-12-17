extern network mu111 (terminal A, B, S, Y, vss, vdd)
network stream (terminal IN_0, IN_1, OUT_0, OUT_1, E, vss, vdd)
{
   {U8} mu111 (IN_1, IN_0, E, OUT_1, vss, vdd);
   {U9} mu111 (IN_0, IN_1, E, OUT_0, vss, vdd);
}



