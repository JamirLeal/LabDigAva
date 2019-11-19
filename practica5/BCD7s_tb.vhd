--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:58:29 11/18/2019
-- Design Name:   
-- Module Name:   /home/jamirleal/Descargas/practica5/bToSev.vhd
-- Project Name:  practica5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: bcdToSeg
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY bToSev IS
END bToSev;
 
ARCHITECTURE behavior OF bToSev IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bcdToSeg
    PORT(
         bcd : IN  std_logic_vector(3 downto 0);
         sevSeg : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
	
   --Inputs
   signal bcd : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal sevSeg : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bcdToSeg PORT MAP (
          bcd => bcd,
          sevSeg => sevSeg
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here 
		
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

      wait;
   end process;

END;
