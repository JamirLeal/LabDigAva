--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:47:26 10/09/2019
-- Design Name:   
-- Module Name:   /home/jamirleal/Documentos/14.7/ISE_DS/practica5/PruebaMultiplicador.vhd
-- Project Name:  practica5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MultiplicadorBooth
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PruebaMultiplicador IS
END PruebaMultiplicador;
 
ARCHITECTURE behavior OF PruebaMultiplicador IS 

    COMPONENT MultiplicadorBooth is
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         z : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	component HalfAdder is
	Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : out STD_LOGIC;
			  C : out STD_LOGIC);
	end component;

	component FullAdder is

    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
	end component;

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal z : std_logic_vector(7 downto 0);
	signal b0 : STD_LOGIC_VECTOR(3 downto 0);
	signal b1 : STD_LOGIC_VECTOR(3 downto 0);
	signal b2 : STD_LOGIC_VECTOR(3 downto 0);
	signal b3 : STD_LOGIC_VECTOR(3 downto 0);
	signal p1 : STD_LOGIC_VECTOR(2 downto 0);
	signal p2 : STD_LOGIC_VECTOR(2 downto 0);
	signal carry : STD_LOGIC_VECTOR(10 downto 0);
	signal carryFp1 : STD_LOGIC;
	signal carryFp2 : STD_LOGIC;
 
BEGIN

	b0(3) <= a(3) nand b(0);
	b0(2) <= a(2) and b(0);
	b0(1) <= a(1) and b(0);
	b0(0) <= a(0) and b(0);
	
	b1(3) <= a(3) nand b(1);
	b1(2) <= a(2) and b(1);
	b1(1) <= a(1) and b(1);
	b1(0) <= a(0) and b(1);
	
	b2(3) <= a(3) nand b(2);
	b2(2) <= a(2) and b(2);
	b2(1) <= a(1) and b(2);
	b2(0) <= a(0) and b(2);
	
	b3(3) <= a(3) and b(3);
	b3(2) <= a(2) nand b(3);
	b3(1) <= a(1) nand b(3);
	b3(0) <= a(0) nand b(3);
   
	z(0) <= b0(0);
	
	iP1 : HalfAdder port map(b0(1), b1(0), z(1), carry(0));
	
	p1der : FullAdder port map(b0(2), b1(1), carry(0), p1(0), carry(1));
	p1med : FullAdder port map(b0(3), b1(2), carry(1), p1(1), carry(2));
	p1izq : FUllAdder port map('1' , b1(3), carry(2), p1(2), carryFp1);

	iP2 : HalfAdder port map(p1(0), b2(0), z(2), carry(3));
	
	p2der : FullAdder port map(p1(1), b2(1), carry(3), p2(0), carry(4));
	p2med : FullAdder port map(p1(2), b2(2), carry(4), p2(1), carry(5));
	p2izq : FullAdder port map(carryFp1, b2(3), carry(5), p2(2), carryFp2);
	
	z3 : HalfAdder port map(p2(0), b3(0), z(3), carry(6));
	z4 : FullAdder port map(p2(1), b3(1), carry(6), z(4), carry(7));
	z5 : FullAdder port map(p2(2), b3(2), carry(7), z(5), carry(8));
	z6 : FullAdder port map(carryFp2, b3(3), carry(8), z(6), carry(9));
	z7 : HalfAdder port map('1', carry(9), z(7), carry(10));

 stimulus: process
 begin
	a <= "0000";
	b <= "0100";
	wait for 100 ns;
	
	a <= "0001";
	wait for 100 ns;
	
	a <= "0010";
	wait for 100 ns;
	
	a <= "0011";
	wait for 100 ns;
	
	a <= "0100";
	wait for 100 ns;
	
	a <= "0101";
	wait for 100 ns;
	
	a <= "0110";
	wait for 100 ns;
	
	a <= "0111";
	wait for 100 ns;
	
	a <= "1000";
	wait for 100 ns;
	
	a <= "1001";
	wait for 100 ns;
	
	a <= "1010";
	wait for 100 ns;
	
	a <= "1011";
	wait for 100 ns;
	
	a <= "1100";
	wait for 100 ns;
	
	a <= "1101";
	wait for 100 ns;
	
	a <= "1110";
	wait for 100 ns;
	
	a <= "1111";
	wait for 100 ns;
	
	a <= "0000";
	b <= "0101";
	wait for 100 ns;
	
	a <= "0001";
	wait for 100 ns;
	
	a <= "0010";
	wait for 100 ns;
	
	a <= "0011";
	wait for 100 ns;
	
	a <= "0100";
	wait for 100 ns;
	
	a <= "0101";
	wait for 100 ns;
	
	a <= "0110";
	wait for 100 ns;
	
	a <= "0111";
	wait for 100 ns;
	
	a <= "1000";
	wait for 100 ns;
	
	a <= "1001";
	wait for 100 ns;
	
	a <= "1010";
	wait for 100 ns;
	
	a <= "1011";
	wait for 100 ns;
	
	a <= "1100";
	wait for 100 ns;
	
	a <= "1101";
	wait for 100 ns;
	
	a <= "1110";
	wait for 100 ns;
	
	a <= "1111";
	wait for 100 ns;
	
	a <= "0000";
	b <= "0010";
	wait for 100 ns;
	
	a <= "0001";
	wait for 100 ns;
	
	a <= "0010";
	wait for 100 ns;
	
	a <= "0011";
	wait for 100 ns;
	
	a <= "0100";
	wait for 100 ns;
	
	a <= "0101";
	wait for 100 ns;
	
	a <= "0110";
	wait for 100 ns;
	
	a <= "0111";
	wait for 100 ns;
	
	a <= "1000";
	wait for 100 ns;
	
	a <= "1001";
	wait for 100 ns;
	
	a <= "1010";
	wait for 100 ns;
	
	a <= "1011";
	wait for 100 ns;
	
	a <= "1100";
	wait for 100 ns;
	
	a <= "1101";
	wait for 100 ns;
	
	a <= "1110";
	wait for 100 ns;
	
	a <= "1111";
	wait for 100 ns;
	
	a <= "0010";
	wait for 100 ns;
	
	a <= "0011";
	wait for 100 ns;
	
	a <= "0100";
	wait for 100 ns;
	
	a <= "0101";
	wait for 100 ns;
	
	a <= "0110";
	wait for 100 ns;
	
	a <= "0111";
	wait for 100 ns;
	
	a <= "1000";
	wait for 100 ns;
	
	a <= "1001";
	wait for 100 ns;
	
	a <= "1010";
	wait for 100 ns;
	
	a <= "1011";
	wait for 100 ns;
	
	a <= "1100";
	wait for 100 ns;
	
	a <= "1101";
	wait for 100 ns;
	
	a <= "1110";
	wait for 100 ns;
	
	a <= "1111";
	wait for 100 ns;
	
	a <= "0000";
	b <= "0011";
	wait for 100 ns;
	
	a <= "0001";
	wait for 100 ns;
	
	a <= "0010";
	wait for 100 ns;
	
	a <= "0011";
	wait for 100 ns;
	
	a <= "0100";
	wait for 100 ns;
	
	a <= "0101";
	wait for 100 ns;
	
	a <= "0110";
	wait for 100 ns;
	
	a <= "0111";
	wait for 100 ns;
	
	a <= "1000";
	wait for 100 ns;
	
	a <= "1001";
	wait for 100 ns;
	
	a <= "1010";
	wait for 100 ns;
	
	a <= "1011";
	wait for 100 ns;
	
	a <= "1100";
	wait for 100 ns;
	
	a <= "1101";
	wait for 100 ns;
	
	a <= "1110";
	wait for 100 ns;
	
	a <= "1111";
	wait for 100 ns;
	
	a <= "0000";
	b <= "0111";
	wait for 100 ns;
	
	a <= "0010";
	wait for 100 ns;
	
	a <= "0011";
	wait for 100 ns;
	
	a <= "0100";
	wait for 100 ns;
	
	a <= "0101";
	wait for 100 ns;
	
	a <= "0110";
	wait for 100 ns;
	
	a <= "0111";
	wait for 100 ns;
	
	a <= "1000";
	wait for 100 ns;
	
	a <= "1001";
	wait for 100 ns;
	
	a <= "1010";
	wait for 100 ns;
	
	a <= "1011";
	wait for 100 ns;
	
	a <= "1100";
	wait for 100 ns;
	
	a <= "1101";
	wait for 100 ns;
	
	a <= "1110";
	wait for 100 ns;
	
	a <= "1111";
	wait for 100 ns;
	
	end process;
END behavior;
