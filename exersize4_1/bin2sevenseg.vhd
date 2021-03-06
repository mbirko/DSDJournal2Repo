
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY bin2sevenseg IS
	PORT (
		-- Input ports
		bin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

		-- Output ports
		Sseg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)

	);
END bin2sevenseg;

ARCHITECTURE bin2sevenseg_con OF bin2sevenseg IS
BEGIN
	-- lookup table - 4 bin input to SevenSegDis Code
	WITH bin SELECT Sseg <=
		"1000000" WHEN "0000", -- 0 
		"1111001" WHEN "0001", -- 1
		"0100100" WHEN "0010", -- 2 
		"0110000" WHEN "0011", -- 3 
		"0011001" WHEN "0100", -- 4 
		"0010010" WHEN "0101", -- 5 
		"0000010" WHEN "0110", -- 6 
		"1111000" WHEN "0111", -- 7
		"0000000" WHEN "1000", -- 8 
		"0010000" WHEN "1001", -- 9 
		"0001000" WHEN "1010", -- A (10d)
		"0000011" WHEN "1011", -- B (11d)
		"1000110" WHEN "1100", -- C (12d)
		"0100001" WHEN "1101", -- D (13d)
		"0000110" WHEN "1110", -- E (14d)
		"0001110" WHEN "1111", -- F (15d)
		"1111111" WHEN OTHERS;
END bin2sevenseg_con;