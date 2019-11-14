LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY T_bcd IS
END T_bcd;
 
ARCHITECTURE behavior OF T_bcd IS 
 
   component bcd
      port(
			input : in  std_logic_vector(7 downto 0);
         centenas : out std_logic_vector(3 downto 0);
         decenas     : out std_logic_vector(3 downto 0);
         unidades     : out std_logic_vector(3 downto 0)
      );
   end component;
   
   signal input   : std_logic_vector(7 downto 0) := (others => '0');
	
   signal centenas : std_logic_vector(3 downto 0);
   signal decenas     : std_logic_vector(3 downto 0);
   signal unidades    : std_logic_vector(3 downto 0);
 
BEGIN
 
   uut: bcd
      port map (
         input   => input,
         centenas => centenas,
         decenas     => decenas,
         unidades     => unidades
      );
 
   stim_proc: process
   begin      
      loop
         input <= std_logic_vector(unsigned(input) + 1);
         
         wait for 10 ns;
      end loop;
      
      wait;
   end process;
 
end;
