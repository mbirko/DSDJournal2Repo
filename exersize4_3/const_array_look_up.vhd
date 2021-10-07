
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

entity const_array_look_up is


	port
	(
		-- Input ports
		i1 ,i2, i3	: in std_logic;
		
		
		-- Output ports
		out1	: out std_logic
		
	);
end const_array_look_up;



architecture const_array_look_up_impl of const_array_look_up is
	constant output : std_logic_vector (0 to 7) := "11010--1"; -- 11010--1 1--01011

begin

 out1 <= output(to_integer(unsigned'(i3, i2, i1)));
 

end const_array_look_up_impl;
