extern network stream (terminal IN_0, IN_1, OUT_0, OUT_1, E, notE, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network blackbox (terminal sclk_m_0, mosi_m_0, miso_m_0, ss_m_0, sclk_m_1, 
                           mosi_m_1, miso_m_1, ss_m_1, sclk_s_0, mosi_s_0, 
                           miso_s_0, ss_s_0, sclk_s_1, mosi_s_1, miso_s_1, 
                           ss_s_1, s, vss, vdd)
{
   {stream0} stream (sclk_m_0, sclk_m_1, sclk_s_0, sclk_s_1, s, n1, vss, vdd);
   {stream1} stream (mosi_m_0, mosi_m_1, mosi_s_0, mosi_s_1, s, n4, vss, vdd);
   {stream2} stream (ss_m_0, ss_m_1, ss_s_0, ss_s_1, s, n3, vss, vdd);
   {stream3} stream (miso_s_0, miso_s_1, miso_m_0, miso_m_1, s, n2, vss, vdd);
   {U2} iv110 (s, n2, vss, vdd);
   {U3} iv110 (s, n3, vss, vdd);
   {U4} iv110 (s, n4, vss, vdd);
   {U5} iv110 (s, n1, vss, vdd);
}



