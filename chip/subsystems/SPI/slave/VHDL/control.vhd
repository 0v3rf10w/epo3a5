library IEEE;
use IEEE.std_logic_1164.all;

entity control is
port(	clk:			in std_logic;
		reset:			in std_logic;
		send:			in std_logic;
		count:			in std_logic_vector(3 downto 0);
		shift:			out std_logic;
		sclk:			out std_logic;
		c_reset:		out std_logic;
		ss:				out std_logic;
		busy:			out std_logic
	);
end entity control;

architecture behavioural of control is
	type control_state is (reset_state,idle,shifting);
	signal state : control_state;
	signal clk_switch : std_logic;
begin
	process(clk,reset)
		begin
		if(reset = '1') then
			state <= reset_state;
		else
			if rising_edge(clk)  then
				case state is 
					when reset_state =>
						if(reset = '0') then
							state <= idle;
						else
							state <= reset_state;
						end if;
					when idle =>
						if(send = '1') then
							state <= shifting;
						else
							state <= idle;
						end if;
					when shifting =>
						if(count="1000") then
							state <= idle;
						else
							state <= shifting;
						end if;
				end case;	
			end if;	
		end if;
	end process;
	
	process(state)
	begin
		if(state=reset_state) then
			c_reset <= '1';
			clk_switch <= '0';
			ss <= '1';
			busy <= '1';
		elsif(state=idle) then
			c_reset <= '1';
			clk_switch <= '0';
			ss <= '0';
			busy <= '0';
		elsif(state=shifting) then
			c_reset <= '0';
			clk_switch <= '1';
			ss <= '0';
			busy <= '1';
		else
			c_reset <= '1';
			clk_switch <= '0';
			ss <= '1';
			busy <= '1';
		end if;
	end process;

	sclk <= 	(not(clk and clk_switch)) after 1 ns when (state=shifting) else
				'0';

	shift <= clk_switch;
end behavioural;

