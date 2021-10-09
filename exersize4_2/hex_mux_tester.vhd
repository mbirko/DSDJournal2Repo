LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY hex_mux_tester IS
	PORT (
		-- Input ports
		SW : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		-- Output ports
		HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END hex_mux_tester;

ARCHITECTURE hex_mux_tester_impl OF hex_mux_tester IS
BEGIN
	DUT : ENTITY hex_mux
		PORT MAP
		(
			-- Mapping input
			bin => SW(11 DOWNTO 0),
			sel => KEY(1 DOWNTO 0),
			-- mapping MSB to LSB
			tsseg(20 DOWNTO 14) => HEX2(6 DOWNTO 0), -- MSB
			tsseg(13 DOWNTO 7) => HEX1(6 DOWNTO 0),
			tsseg(6 DOWNTO 0) => HEX0(6 DOWNTO 0) -- LSB
		);
END hex_mux_tester_impl;