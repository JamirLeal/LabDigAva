----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:52:13 10/09/2019 
-- Design Name: 
-- Module Name:    MultiplicadorBooth - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MultiplicadorBooth is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (7 downto 0));
end MultiplicadorBooth;

architecture Behavioral of MultiplicadorBooth is

component HalfAdder is

	Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S : out STD_LOGIC;
			  C : out STD_LOGIC);
end component;

component FullAdder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

	signal b0 : STD_LOGIC_VECTOR(3 downto 0);
	signal b1 : STD_LOGIC_VECTOR(3 downto 0);
	signal b2 : STD_LOGIC_VECTOR(3 downto 0);
	signal b3 : STD_LOGIC_VECTOR(3 downto 0);
	signal p1 : STD_LOGIC_VECTOR(2 downto 0);
	signal p2 : STD_LOGIC_VECTOR(2 downto 0);
	signal carry : STD_LOGIC_VECTOR(15 downto 0);
	signal carryFp1 : STD_LOGIC;
	signal carryFp2 : STD_LOGIC;

begin

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
	
	p1der : FullAdder port map(b0(2), b1(1), carry(1), p1(0), carry(2));
	p1med : FullAdder port map(b0(3), b1(2), carry(2), p1(1), carry(3));
	p1izq : FUllAdder port map('1'  , b1(3), carry(3), p1(2), carryFp1);
	
	
	iP2 : HalfAdder port map(p1(0), b2(0), z(2), carry(4));
	
	p2der : FullAdder port map(p1(1), b2(1), carry(4), p2(0), carry(5));
	p2med : FullAdder port map(p1(2), b2(2), carry(5), p2(1), carry(6));
	p2izq : FullAdder port map(carryFp1, b2(3), carry(6), p2(2), carryFp2);
	
	z3 : HalfAdder port map(p2(0), b3(0), z(3), carry(7));
	z4 : FullAdder port map(p2(1), b3(1), carry(7), z(4), carry(8));
	z5 : FullAdder port map(p2(2), b3(2), carry(8), z(5), carry(9));
	z6 : FullAdder port map(carryFp2, b3(3), carry(9), z(6), carry(10));
	z7 : HalfAdder port map('1', carry(10), z(7), carry(11));

end Behavioral;
