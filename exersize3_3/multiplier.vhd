library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
-- Multiplier entity
entity multiplier is
	generic
	(
		-- Constant DataWidth variable 
		D_W : natural := 32
	);	
	port
	(
		-- Input ports
		A	: in  std_logic_vector(D_W-1 downto 0);
		B	: in  std_logic_vector(D_W-1 downto 0);
		-- Output ports
		Prod	: out std_logic_vector(((D_W + D_W)-1) downto 0)				
	);
end multiplier;

architecture multiplier_impl of multiplier is
begin		
-- Casting the two vectors to be signed and then multipling them. 
-- Then recasting them back to a vector
	Prod <= std_logic_vector(signed(A) * signed(B));
end multiplier_impl;
