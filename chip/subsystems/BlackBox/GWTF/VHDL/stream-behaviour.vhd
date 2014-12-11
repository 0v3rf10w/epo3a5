library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of stream is

component tbuf is
   port(A :in    std_logic;
        Y:out   std_logic;
        E      :in    std_logic);
end component; 

signal INs_0, INs_1, OUTs_0, OUTs_1, Es, notEs: std_logic; 

begin
tbuf0: tbuf port map (INs_0, OUTs_0, notEs);
tbuf1: tbuf port map (INs_0, OUTs_1, Es);
tbuf2: tbuf port map (INs_1, OUTs_0, Es);
tbuf3: tbuf port map (INs_1, OUTs_1, notEs);

INs_0 <= IN_0;
INs_1 <= IN_1;
OUT_0 <= OUTs_0;
OUT_1 <= OUTs_1;
Es <= E;
notEs <= notE;
end behaviour;





