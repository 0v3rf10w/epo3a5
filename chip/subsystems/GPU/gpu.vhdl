library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned;

entity gpu is
port (
clk : in std_logic;
gpu_in : std_logic_vector(7 downto 0);
reset : in std_logic;
gpu_out : out std_logic_vector(7 downto 0)
);
end gpu;

architecture behavoural of gpu is
type statetype is (init, y_hold, calc, spi_write, clr_screen);
signal state, next_state : statetype;
signal x_buf, y_buf : std_logic_vector(5 downto 0);
signal s1 : std_logic;

begin


-- Staterenew
process(clk)
begin
if (reset = '1') then
state <= init;
else
if (rising_edge(clk)) then
state <= next_state;
else
state <= state;
end if;
end if;

end process;


-- Finite state machine

process(gpu_in)
begin

case state is
when init =>
if(gpu_in(7 downto 6) = "11") then
next_state <= clr_screen;
elsif (gpu_in(7 downto 6) = "01") then
x_buf <= gpu_in(5 downto 0);
next_state <= y_hold;
else
next_state <= init;
end if;

when y_hold =>
if(gpu_in(7 downto 6) = "10") then
y_buf <= gpu_in(5 downto 0);
next_state <= calc;
else
next_state <= y_hold;
end if;

when calc =>
next_state <= spi_write;

when spi_write =>
next_state <= init;

when clr_screen =>
next_state <= init;

end case;
end process;




end architecture;