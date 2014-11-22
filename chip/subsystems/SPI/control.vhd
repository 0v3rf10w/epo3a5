library IEEE;
use IEEE.std_logic_1164.all;

entity control is
port(	clk:			in std_logic;
		reset:			in std_logic;
		send:			in std_logic;
		count:			in std_logic_vector(3 downto 0);
		shift_reset:	out std_logic;
		shift:			out std_logic;
		sclk:			out std_logic;
		c_reset:		out std_logic
	);
end entity control;

architecture behavioural of control is
	type control_state is (reset_state,idle,shifting);
	signal state,new_state : control_state;
	signal clk_switch : std_logic;
begin
	process(clk,reset)
		begin
		if(reset = '1') then
			state <= reset_state;
		else
			if rising_edge(clk)  then
				state <= new_state;
			end if;	
		end if;
	end process;
	
	process(state,reset,send,count)
	begin
		if(state=reset_state) then
			shift_reset <= '1';
			c_reset <= '1';
			clk_switch <= '0';
			if(reset = '0') then
				new_state <= idle;
			else
				new_state <= reset_state;
			end if;
		elsif(state=idle) then
			shift_reset <= '0';
			c_reset <= '1';
			clk_switch <= '0';
			if(send = '1') then
				new_state <= shifting;
			else
				new_state <= idle;
			end if;
		elsif(state=shifting) then
			shift_reset <= '0';
			c_reset <= '0';
			clk_switch <= '1';
			if(count="1000") then
				new_state <= idle;
			else
				new_state <= shifting;
			end if;
		else
			shift_reset <= '1';
			c_reset <= '1';
			clk_switch <= '0';
			new_state <= reset_state;
		end if;
	end process;

	sclk <= (clk and clk_switch) when (state=shifting) else
		'0';

	shift <= clk_switch;
end behavioural;
