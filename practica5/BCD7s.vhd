library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity bcdToSeg is
Port(bcd : in STD_LOGIC_VECTOR(3 downto 0);
sevSeg : out STD_LOGIC_VECTOR(6 downto 0));
end bcdToSeg;
 
architecture Behavioral of bcdToSeg is
 
begin
 
process(bcd)
begin
 
case bcd is
when "0000" =>
sevSeg <= "0000001";
when "0001" =>
sevSeg <= "1001111";
when "0010" =>
sevSeg <= "0010010";
when "0011" =>
sevSeg <= "0000110";
when "0100" =>
sevSeg <= "1001100";
when "0101" =>
sevSeg <= "0100100";
when "0110" =>
sevSeg <= "0100000"; 
when "0111" =>
sevSeg <= "0001111"; 
when "1000" =>
sevSeg <= "0000000";
when "1001" =>
sevSeg <= "0000100";
when others =>
sevSeg <= "1111111";
end case;

end process;

end Behavioral;
