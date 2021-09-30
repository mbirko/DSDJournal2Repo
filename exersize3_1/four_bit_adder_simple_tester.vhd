library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


--Four_bit_adder "testbench" til test pÃ¥ DE2 board
entity four_bit_adder_simple_tester is

	port
	(
		-- Input ports
		SW	: in  std_logic_vector(7 downto 0); 	-- Der bruges 2 x 4 switches til 
																-- de to 4-bit tal A og B og 1 switch til carry ind 		
		-- Output ports
		LEDR	: out std_logic_vector(3 downto 0) 	-- Der bruges 4 LEDer til 4-bit tal sum 
	);															-- Der bruges 1 LED til carry out
end four_bit_adder_simple_tester;

architecture implementation of four_bit_adder_simple_tester is

begin

-- direkte instancering af 4-bit adderen
DUT: entity four_bit_adder_simple(signed_impl)

port map	
	(	
		-- 4-bit tal A bindes til switches 4, 3, 2 og 1 
		a => SW( 3 downto 0),	
		-- 4-bit tal B bindes til switches 8, 7, 6 og 5
		b => SW(7 downto 4),	
		-- 4-bit tal sum bindes til LEDer 3, 3, 1 og 0	
		sum => LEDR(3 downto 0)
	);	

end implementation;