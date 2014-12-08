extern network tbuf (terminal A, Y, E, vss, vdd)
network stream (terminal IN_0, IN_1, OUT_0, OUT_1, E, notE, vss, vdd)
{
   {tbuf0} tbuf (IN_0, OUT_0, notE, vss, vdd);
   {tbuf1} tbuf (IN_0, OUT_1, E, vss, vdd);
   {tbuf2} tbuf (IN_1, OUT_0, E, vss, vdd);
   {tbuf3} tbuf (IN_1, OUT_1, notE, vss, vdd);
}



