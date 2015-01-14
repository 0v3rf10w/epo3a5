library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned;
use IEEE.numeric_std.all;

entity gpu is
port (
clk : in std_logic;
gpu_in : in std_logic_vector(7 downto 0);
reset : in std_logic;
ssclk : out std_logic;
mosi : out std_logic;
miso : in std_logic;
cs : out std_logic;
test_xbuf : out std_logic_vector(5 downto 0);
test_ybuf : out std_logic_vector(5 downto 0);
test_data : out std_logic_vector(7 downto 0)
);
end gpu;

architecture behavoural of gpu is

-- definition of state machine states
type statetype is (  state0, 
state1, 
state2, 
state3, 
state4,
state5,
state6,
state7,
state8,
state9,
state10,
state11,
state12,
state13,
state14
);

signal state, next_state : statetype;

-- definition of x and y coordinate buffers
signal x_buf, y_buf : std_logic_vector(5 downto 0);

-- definition of z vector
signal z : std_logic_vector(15 downto 0);

-- non used signal
signal sclk : std_logic;

signal instruction : std_logic_vector(23 downto 0);
signal instruction8 : std_logic_vector(7 downto 0);
signal send : std_logic_vector(31 downto 0);
signal data : std_logic_vector(7 downto 0);
signal bitplace : unsigned(3 downto 0);
signal sig : std_logic_vector(7 downto 0);

signal count, new_count : unsigned (10 downto 0);

begin
test_xbuf <= x_buf;
test_ybuf <= y_buf;
test_data <= sig;
ssclk <= sclk;

sig <= data;

-- Staterenew
process(clk, reset)
begin
if (reset = '1') then
state <= state0;
else
if (rising_edge(clk)) then
state <= next_state;
else
state <= state;
end if;
end if;
end process;
-- counter 1
process (clk) 
begin 
	if (rising_edge (clk)) then 
		if (reset = '1') then 
			count <= (others => '0'); 
		else 
			count <= new_count; 
		end if; 
	else
	end if; 
end process;

-- Finite state machine
process(gpu_in, clk)
begin
case state is
when state0 =>
new_count <= to_unsigned(0,11);
	x_buf <= "ZZZZZZ";
	y_buf <= "ZZZZZZ";
	if(gpu_in(7 downto 6) = "11") then -- clr screen
		next_state <= state13;
	elsif (gpu_in(7 downto 6) = "01") then -- go
		x_buf <= gpu_in(5 downto 0);
		next_state <= state1;
	else
		next_state <= state0;
	end if;

-- Output define
sclk <= '0';
mosi <= '0';
--data <= "ZZZZZZZZ";
cs <= '1';

when state1 =>
	if(gpu_in(7 downto 6) = "10") then
		y_buf <= gpu_in(5 downto 0);
		next_state <= state2;
	else
		next_state <= state1;
	end if;
-- Output define
sclk <= '0';
mosi <= '0';
-- reset counters
new_count <= to_unsigned(0,11);
cs <= '1';

when state2 =>
instruction(23 downto 16) <= "00000011"; -- read instruction
instruction(15 downto 0) <= std_logic_vector(resize(unsigned(x_buf) / 8 + 5 * unsigned(y_buf), 16));
next_state <= state3;
new_count <= to_unsigned(0,11);

when state3 =>
cs <= '0';
sclk <= '0';
if (count < 23 ) then
mosi <= instruction(to_integer(23 - count));
new_count <= count;
next_state <= state4;
--data <= std_logic_vector(resize(count, 8));
elsif (count = 23) then
mosi <= instruction(to_integer(23 - count));
new_count <= count;
next_state <= state4;
else
new_count <= to_unsigned(0,11);
next_state <= state5;
end if;

when state4 =>
sclk <= '1';
new_count <= count + 1;
next_state <= state3;

when state5 =>
sclk <= '0';
mosi <= '0';
if (count < 8) then
data(to_integer(7 - count)) <= miso;
new_count <= count;
next_state <= state6;
else
next_state <= state7;
new_count <= to_unsigned(0,11);
end if;

when state6 =>
sclk <= '1';
new_count <= count + 1;
next_state <= state5;

when state7 =>
cs <= '1';
--bitplace <= unsigned(unsigned(x_buf) - ((unsigned(x_buf) / 8) * 8));
new_count <= to_unsigned(0,11);
next_state <= state8;

when state8 =>
data(to_integer(7 - unsigned(unsigned(x_buf) - ((unsigned(x_buf) / 8) * 8)))) <= '1';
new_count <= to_unsigned(0,11);
next_state <= state9;

when state9 =>
send(31 downto 24) <= "00000010";
send(23 downto 8) <= std_logic_vector(resize(unsigned(x_buf) / 8 + 5 * unsigned(y_buf), 16));
send(7 downto 0) <= data;
new_count <= to_unsigned(0,11);
next_state <= state10;

when state10 =>
cs <= '0';
sclk <= '0';
if (count < 31 and count /= 31) then
mosi <= send(to_integer(31 - count));
new_count <= count;
next_state <= state11;
elsif (count = 31) then
mosi <= send(to_integer(31 - count));
new_count <= count;
next_state <= state11;
else
new_count <= to_unsigned(0,11);
next_state <= state12;
end if;

when state11 =>
sclk <= '1';
new_count <= count + 1;
next_state <= state10;

when state12 => 
cs <= '1';
new_count <= to_unsigned(0,11);
next_state <= state0;

when state13 =>
cs <= '0';
sclk <= '0';
instruction8 <= "00000010";
if (count < 8 ) then
mosi <= instruction8(to_integer(7 - count));
new_count <= count;
next_state <= state14;
elsif (count >= 7 and count < 1280) then
new_count <= count;
mosi <= '0';
next_state <= state14;
else
mosi <= '0';
next_state <= state0;
end if;

when state14 =>
sclk <= '1';
new_count <= count + 1;
next_state <= state13;

when others =>
new_count <= to_unsigned(0,11);
next_state <= state0;

end case;
end process;
end architecture;