library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
-- Multiplier test entity to test on DE2 board
entity multiplier_tester is
	generic
	(
		-- Constant DataWidth variable 
		D_W : natural := 32
	);
	port
	(
		-- Input ports
		SW	: in  std_logic_vector(((D_W+D_W)-1) downto 0);		
		-- Output ports
		LEDR	: out std_logic_vector(((D_W+D_W)-1) downto 0)			
	);
end multiplier_tester;

architecture multiplier_impl of multiplier_tester is
begin
-- Mapping according to the IBD from the exercise file
DUT: entity multiplier
	port map
	(
		A => SW((D_W-1) downto 0),
		B => SW (((D_W+D_W)-1) downto D_W),
		Prod => LEDR(((D_W+D_W)-1) downto 0)
	);
end multiplier_impl;
