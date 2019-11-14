library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bcd is
   Port( 
      input    : in  std_logic_vector (7 downto 0);
      centenas : out std_logic_vector (3 downto 0);
      decenas  : out std_logic_vector (3 downto 0);
      unidades  : out std_logic_vector (3 downto 0)
   );
end bcd;
 
architecture Behavioral of bcd is

begin

   binToBCD : process (input)

      variable shift : unsigned(19 downto 0);
      
	
      alias inp is shift(7 downto 0);
      alias uni is shift(11 downto 8);
      alias dec is shift(15 downto 12);
      alias cen is shift(19 downto 16);
   begin
     
      inp := unsigned(input);
      uni := X"0";
      dec := X"0";
      cen := X"0";
      
      for i in 1 to inp'Length loop
	    
         if uni >= 5 then
            uni := uni + 3;
         end if;
         
         if dec >= 5 then
            dec := dec + 3;
         end if;
         
         if cen >= 5 then
            cen := cen + 3;
         end if;
        
         shift := shift_left(shift, 1);
      end loop;
      
      centenas <= std_logic_vector(cen);
      decenas  <= std_logic_vector(dec);
      unidades     <= std_logic_vector(uni);
   end process;
 
end Behavioral;
