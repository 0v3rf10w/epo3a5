library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity decoder is
port( decoder_in  : in std_logic_vector(11 downto 0);
 decoder_c   : in  std_logic;
 decoder_z   : in  std_logic;
 decoder_pc_inc  	: out std_logic;
 decoder_pc_ld   	: out std_logic;
 decoder_ibufoe 	: out std_logic;
 decoder_aregld   	: out std_logic;
 decoder_abufoe  	: out std_logic;
 decoder_bregld  	: out std_logic_vector(4 downto 0);
 decoder_bbufoe  	: out std_logic_vector(4 downto 0);
 decoder_alu       : out std_logic_vector(2 downto 0);
 decoder_argout    : out std_logic_vector(7 downto 0));
end decoder;




architecture behaviour of decoder is

--Signals--


signal  opcode : std_logic_vector(3 downto 0);
signal  argument  : std_logic_vector(7 downto 0);
signal  o0, o1, o2, o3: std_logic;


begin
  opcode <= decoder_in(11 downto 8);
  argument <= decoder_in(7 downto 0);
  o0 <= opcode(0);
  o1 <= opcode(1);
  o2 <= opcode(2);
  o3 <= opcode(3); 

      decoder_pc_ld <=
                        ((NOT o3) AND (NOT o2) AND (NOT o1) AND o0) OR                  -- Jp #
                        ((NOT o3) AND (NOT o2) AND o1 AND (NOT o0)) OR                  -- Jp Ri
                        ((NOT o3) AND (NOT o2) AND o1 AND o0 AND decoder_z) OR          -- Bz
                        ((NOT o3) AND o2 AND (NOT o1) AND (NOT o0) AND decoder_c);      -- Bc
                        
      decoder_pc_inc <= NOT(
                        ((NOT o3) AND (NOT o2) AND (NOT o1) AND o0) OR                  -- Not Jp #
                        ((NOT o3) AND (NOT o2) AND o1 AND (NOT o0)) OR                  -- Not Jp Ri
                        ((NOT o3) AND (NOT o2) AND o1 AND o0 AND decoder_z) OR          -- Not Bz
                        ((NOT o3) AND o2 AND (NOT o1) AND (NOT o0) AND decoder_c));     -- Not Bc
      decoder_ibufoe <=
                        ((NOT o3) AND (NOT o2) AND (NOT o1) and o0) OR                  -- Jp #
                        ((NOT o3) AND (NOT o2) AND o1 AND o0) OR                        -- Bz
                        ((NOT o3) AND o2 AND (NOT o1) AND (NOT o0)) OR                   -- Bc
                        ((NOT o3) AND o2 AND (NOT o1) AND o0) OR                        -- Ld #
                        (o3 AND (NOT o2) AND (NOT o1) AND (NOT o0)) OR                   -- ADD #
                        (o3 AND (NOT o2) AND o1 AND (NOT o0)) OR                         -- XOR #
                        (o3 AND o2 AND (NOT o1) AND (NOT o0));                           -- AND #
      decoder_aregld <=
                        ((NOT o3) AND o2 AND (NOT o1) AND o0) OR                        -- Ld #
                        ((NOT o3) AND o2 AND o1 AND (NOT o0)) OR                         -- Ld Ri
                        (o3 AND (NOT o2) AND (NOT o1) AND (NOT o0)) OR                   -- ADD #
                        (o3 AND (NOT o2) AND (NOT o1) AND o0) OR                        -- ADD Ri
                        (o3 AND (NOT o2) AND o1 AND (NOT o0)) OR                        -- XOR #
                        (o3 AND (NOT o2) AND o1 AND o0) OR                              -- XOR Ri
                        (o3 AND o2 AND (NOT o1) AND (NOT o0)) OR                        -- AND #
                        (o3 AND o2 AND (NOT o1) AND o0);                                -- AND Ri
      decoder_abufoe <=
                        ((NOT o3) AND o2 AND o1 AND o0);                                -- st Ri
      decoder_bregld(4) <=
                        ((NOT o3) AND o2 AND o1 AND o0);                                -- st Ri
      decoder_bregld(3) <= argument(3);
      decoder_bregld(2) <= argument(2);
      decoder_bregld(1) <= argument(1);
      decoder_bregld(0) <= argument(0);
      decoder_bbufoe(4) <=
                        ((NOT o3) AND (NOT o2) AND o1 AND (NOT o0)) OR                  -- jp Ri
                        ((NOT o3) AND o2 AND o1 AND (NOT o0)) OR                        -- ld Ri
                        (o3 AND (NOT o2) AND (NOT o1) AND o0) OR                        -- ADD Ri
                        (o3 AND (NOT o2) AND o1 AND o0) OR                              -- XOR Ri
                        (o3 AND o2 AND (NOT o1) AND o0);                                -- AND Ri
      decoder_bbufoe(3) <= argument(3);
      decoder_bbufoe(2) <= argument(2);
      decoder_bbufoe(1) <= argument(1);
      decoder_bbufoe(0) <= argument(0);
      decoder_alu(2) <= 
                        (o3 AND o2 AND o1 AND o0) OR                                      -- Clr c
                        (o3 AND (NOT o2) AND (NOT o1) AND (NOT o0)) OR                    -- ADD #
                        (o3 AND (NOT o2) AND (NOT o1) AND o0);                            -- ADD Ri
      decoder_alu(1) <=
                        (o3 AND o2 AND (NOT o1) AND (NOT o0)) OR                          -- AND #
                        (o3 AND o2 AND (NOT o1) AND o0) OR                                -- AND Ri
                        (o3 AND o2 AND o1 AND (NOT o0));                                  -- Set c
      decoder_alu(0) <=
                        (o3 AND (NOT o2) AND (NOT o1) AND (NOT o0)) OR                    -- ADD #
                        (o3 AND (NOT o2) AND (NOT o1) AND o0) OR                          -- ADD Ri
                        (o3 AND (NOT o2) AND o1 AND (NOT o0)) OR                          -- XOR #
                        (o3 AND (NOT o2) AND o1 AND o0) OR                                -- XOR Ri
                        (o3 AND o2 AND o1 AND (NOT o0));                                  -- Set c
	decoder_argout <= argument;
end architecture;







