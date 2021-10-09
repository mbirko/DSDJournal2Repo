
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY const_array_look_up IS
	PORT (
		-- Input ports
		i1, i2, i3 : IN STD_LOGIC;
		-- Output ports
		out1 : OUT STD_LOGIC
	);
END const_array_look_up;

ARCHITECTURE const_array_look_up_impl OF const_array_look_up IS
	-- constant array containg output from look up table
	CONSTANT output : STD_LOGIC_VECTOR (0 TO 7) := "11010--1";
BEGIN
	-- combining ' i3..i1, typing as unsigned. 
	-- interger value is used for index to const array
	out1 <= output(to_integer(unsigned'(i3, i2, i1)));
END const_array_look_up_impl;