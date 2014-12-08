extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network tbuf (terminal A, Y, E, vss, vdd)
{
   {Y_tri} tinv10 (n1, E, Y, vss, vdd);
   {U2} iv110 (A, n1, vss, vdd);
}



