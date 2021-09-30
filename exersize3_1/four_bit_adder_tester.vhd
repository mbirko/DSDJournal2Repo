LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;
--Four_bit_adder "testbench" til test på DE2 board
ENTITY four_bit_adder_tester IS
	GENERIC (--	array size paremeter
		D_W : NATURAL := 4
	);
	PORT (
		-- Input ports
		-- carry in og A og B sker paa switch D_W * 2 til 0. 
		SW : IN STD_LOGIC_VECTOR((D_W * 2) DOWNTO 0);
		-- Output ports
		-- sum og carry bliver vist paa LED D_W til 0
		LEDR : OUT STD_LOGIC_VECTOR(D_W DOWNTO 0)
	);
END four_bit_adder_tester;

ARCHITECTURE implementation OF four_bit_adder_tester IS

BEGIN

	-- direkte instancering af adderen
	DUT : ENTITY four_bit_adder(unsigned_imp)
		PORT MAP
		(
			-- carry in paa switch 0. 
			cin(0) => sw(0),
			-- input A bindes til switches D_W til 1
			a => SW(D_W DOWNTO 1),
			-- input B bindes til switches D_W * 2 til D_W + 1
			b => SW((D_W * 2) DOWNTO (D_W + 1)),
			--  sum bindes til LEDer DATA-WIDTH - 1 
			sum => LEDR((D_W - 1) DOWNTO 0),
			-- Carry ud bindes til LED D_W
			cout => LEDR(D_W)
		);

END implementation;