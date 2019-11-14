library ieee;
use ieee.std_logic_1164.all;
 
entity tbBcdToseg is
end tbBcdToseg;
 
architecture behavior of tbBcdToseg is
 
component bcdToSeg
port(
bcd : in std_logic_vector(3 downto 0);
sevSeg : out std_logic_vector(6 downto 0)
);
end component;
 
signal bcd : std_logic_vector(3 downto 0) := (others => '0');

signal sevSeg : std_logic_vector(6 downto 0);
 
begin

uut: bcdToSeg port map(
bcd => bcd,
sevSeg => sevSeg
);
 
stim_proc: process
begin
 
bcd <= "0000";
wait for 100 ns;
bcd <= "0001";
wait for 100 ns;
bcd <= "0010";
wait for 100 ns;
bcd <= "0011";
wait for 100 ns;
bcd <= "0100";
wait for 100 ns;
bcd <= "0101";
wait for 100 ns;
bcd <= "0110";
wait for 100 ns;
bcd <= "0111";
wait for 100 ns;
bcd <= "1000";
wait for 100 ns;
bcd <= "1001";
wait for 100 ns;
end process;
 
end;
