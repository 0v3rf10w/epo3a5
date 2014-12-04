library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned;

entity decoder is
port( decoder_in  : in std_logic_vector(11 downto 0)
      decoder_c   : in  std_logic;
      decoder_z   : in  std_logic;
      decoder_en  : in  std_logic;
      decoder_pc_inc  : out std_logic;
      decoder_pc_ld   : out std_logic;
      decoder_inbuff_oe : out std_logic;
      decoder_areg_ld   : out std_logic;
      decoder_abuf_oe  : out std_logic;
      decoder_breg_ld   : out std_logic_vector(3 downto 0);
      decoder_bbuf_oe  : out std_logic_vector(3 downto 0);
      decoder_alu       : out std_logic_vector(2 downto 0));
end decoder;

architecture behaviour of decoder is
signal  opcode : std_logic_vector(3 downto 0);
signal  argument  : std_logic_vector(7 downto 0);
signal  o0, o1, o2, o3: std_logic;
begin
  opcode <= decoder_in(3 downto 0);
  argument <= decoder_in(11 downto 4);
  o0 <= opcode(0);
  o1 <= opcode(1);
  o2 <= opcode(2);
  o3 <= opcode(3);
  
  process(decoder_en)
  begin
    if (decoder_en='0') then
      decoder_alu <= "ZZZ";
      decoder_pc_inc <= 'Z';
      decoder_pc_ld <= 'Z';
      decoder_inbuf_oe <= 'Z';
      decoder_areg_ld <= 'Z';
      decoder_abuff_oe <= 'Z';
      decoder_breg_ld <= 'Z'; 
      decoder_bbuf_oe <= 'Z';
    else
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
      decoder_inbuf_oe <=
                        ((NOT o3) AND (NOT o2) AND (NOT o1) and o0) OR                  -- Jp #
                        ((NOT o3) AND (NOT o2) AND o1 AND o0) OR                        -- Bz
                        ((NOT o3) AND o2 AND (NOT o1) AND (NOT o0) OR                   -- Bc
                        ((NOT o3) AND o2 AND (NOT o1) AND o0) OR                        -- Ld #
                        (o3 AND (NOT o2) AND (NOT o1) AND (NOT o0) OR                   -- ADD #
                        (o3 AND (NOT o2) AND o1 AND (NOT o0) OR                         -- XOR #
                        (o3 AND o2 AND (NOT o1) AND (NOT o0);                           -- AND #
      decoder_areg_ld <=
                        ((NOT o3) AND o2 AND (NOT o1) AND o0) OR                        -- Ld #
                        ((NOT o3) AND o2 AND o1 AND (NOT o0) OR                         -- Ld Ri
                        (o3 AND (NOT o2) AND (NOT o1) AND (NOT o0) OR                   -- ADD #
                        (o3 AND (NOT o2) AND (NOT o1) AND o1) OR                        -- ADD Ri
                        (o3 AND (NOT o2) AND o1 AND (NOT o0)) OR                        -- XOR #
                        (o3 AND (NOT o2) AND o1 AND o0) OR                              -- XOR Ri
                        (o3 AND o2 AND (NOT o1) AND (NOT o0)) OR                        -- AND #
                        (o3 AND o2 AND (NOT o1) AND o0);                                -- AND Ri
      decoder_abuf_oe <=
                        ((NOT o3) AND o2 AND o1 AND o0);                                -- st Ri
      decoder_breg_ld <=
                        ((NOT o3) AND o2 AND o1 AND o0);                                -- st Ri
      decoder_bbuf_oe <=
                        ((NOT o3) AND (NOT o2) AND o1 AND (NOT o0)) OR                  -- jp Ri
                        ((NOT o3) AND o2 AND o1 AND (NOT o0)) OR                        -- ld Ri
                        (o3 AND (NOT o2) AND (NOT o1) AND o0) OR                        -- ADD Ri
                        (o3 AND (NOT o2) AND o1 AND o0) OR                              -- XOR Ri
                        (o3 AND o2 AND (NOT o1) AND o0);                                -- AND Ri
    end if;
  end process;
end architecture;
