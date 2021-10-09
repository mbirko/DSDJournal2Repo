LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;
ENTITY hex_mux IS
	PORT (
		-- Input ports
		bin : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		-- Output ports
		tsseg : OUT STD_LOGIC_VECTOR(20 DOWNTO 0)
	);
END hex_mux;

ARCHITECTURE hex_mux_impl OF hex_mux IS
	SIGNAL temp : STD_LOGIC_VECTOR (20 DOWNTO 0);
BEGIN
	-- mapping number input with bin2sevenseg
	-- MSB input D3
	B2S_1 : ENTITY bin2sevenseg
		PORT MAP 
		(
			bin(3 DOWNTO 0) => bin(11 DOWNTO 8),
			sseg(6 DOWNTO 0) => temp(20 DOWNTO 14)
		);
	-- D2 input map
	B2S_2 : ENTITY bin2sevenseg
		PORT MAP
		(
			bin(3 DOWNTO 0) => bin(7 DOWNTO 4),
			sseg(6 DOWNTO 0) => temp(13 DOWNTO 7)
		);
	-- LSB D3 
	B2S_3 : ENTITY bin2sevenseg
		PORT MAP
		(
			bin(3 DOWNTO 0) => bin(3 DOWNTO 0),
			sseg(6 DOWNTO 0) => temp(6 DOWNTO 0)
		);
	tsseg <=
		-- display on when nothing is pressed
		"1111111" & "1000000" & "0101011" WHEN sel = "11" ELSE
		-- displayed off when key0 is pressed Off displayed
		"1000000" & "0001110" & "0001110" WHEN sel = "01" ELSE
		-- key1 press display input number
		temp WHEN sel = "10" ELSE
		-- all others display nothing
		"1111111" & "1111111" & "1111111";

END hex_mux_impl;