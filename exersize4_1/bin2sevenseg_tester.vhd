
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

entity bin2sevenseg_tester is
	port
	(
		-- Input ports
		SW	: in  std_logic_vector(3 downto 0);

		-- Output ports
		HEX0 : out std_logic_vector(6 downto 0)
		
	);
end bin2sevenseg_tester;


architecture bin2sevenseg_tester_impl of bin2sevenseg_tester is
	-- Declarations (optional)
begin
DUT: entity bin2sevenseg
	port map
	(
		bin => SW(3 downto 0),
		Sseg => HEX0(6 downto 0)
	);
	
end bin2sevenseg_tester_impl;