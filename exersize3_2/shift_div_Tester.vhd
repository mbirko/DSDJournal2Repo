-- Tester Shift_div
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

--Shift_div "testbench" til test på DE2 board
entity shift_div_Tester is
	port
	(
		-- Input ports
		-- Sets the values for a
		SW		: in  std_logic_vector(7 downto 0);    																	
		-- Output ports
		-- Display output of shifted/rotated vector
		LEDR	: out std_logic_vector(17 downto 0);		
		LEDG	: out std_logic_vector(7 downto 0)
	);															
end shift_div_Tester;

architecture shift_div_Tester_impl of shift_div_Tester is
begin
-- direkte instancering af 4-bit adderen
DUT: entity shift_div (a_tot_impl)
port map	
	(
		-- 8-bit input vector a
		a => SW(7 downto 0),	
		-- 8-bit output vector a left shifted		
		a_shR => LEDR( 17 downto 10),	
		-- 8-bit output vector a left shifted	
		a_shL => LEDR( 7 downto 0),
		-- 8-bit output vector a left shifted		
		a_ror => LEDG( 7 downto 0)				
	);	
end shift_div_Tester_impl;