library IEEE ;
use IEEE.std_logic_1164.all;

entity bin8seg4 is
	port(	bin8 : in std_logic_vector (7 downto 0);
			seg4_1 : out std_logic_vector (3 downto 0);
			seg4_0 : out std_logic_vector (3 downto 0)
	);
end entity bin8seg4;

architecture behavioural of bin8seg4 is
begin
seg4_1 <= bin8(7 downto 4);
seg4_0 <= bin8(3 downto 0);

end architecture behavioural;