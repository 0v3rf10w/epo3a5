extern network stream (terminal IN_0, IN_1, OUT_0, OUT_1, E, vss, vdd)
network blackbox (terminal sclk_m_0, mosi_m_0, miso_m_0, ss_m_0, sclk_m_1, 
                           mosi_m_1, miso_m_1, ss_m_1, sclk_s_0, mosi_s_0, 
                           miso_s_0, ss_s_0, sclk_s_1, mosi_s_1, miso_s_1, 
                           ss_s_1, s, vss, vdd)
{
   {stream0} stream (sclk_m_0, sclk_m_1, sclk_s_0, sclk_s_1, s, vss, vdd);
   {stream1} stream (mosi_m_0, mosi_m_1, mosi_s_0, mosi_s_1, s, vss, vdd);
   {stream2} stream (ss_m_0, ss_m_1, ss_s_0, ss_s_1, s, vss, vdd);
   {stream3} stream (miso_s_0, miso_s_1, miso_m_0, miso_m_1, s, vss, vdd);
}



