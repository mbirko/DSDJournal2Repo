
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;
ENTITY const_array_look_up_tester IS
	PORT (
		-- Input ports
		SW : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		-- Output ports
		LEDR : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
	);
END const_array_look_up_tester;

ARCHITECTURE const_array_look_up_tester_impl OF const_array_look_up_tester IS
BEGIN
	-- direct instanstiation
	DUT : ENTITY const_array_look_up
		PORT MAP
		(
			i1 => SW(0),
			i2 => SW(1),
			i3 => SW(2),
			out1 => LEDR(0)
		);
END const_array_look_up_tester_impl;