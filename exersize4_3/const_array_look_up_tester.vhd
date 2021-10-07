
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

entity const_array_look_up_tester is


	port
	(
		-- Input ports
		SW : in std_logic_vector(2 downto 0);
		-- Output ports
		LEDR	: out std_logic_vector(0 downto 0)
		
	);
end const_array_look_up_tester;



architecture const_array_look_up_tester_impl of const_array_look_up_tester is

begin
	DUT: entity const_array_look_up
port map 
	(	
		i1 => SW(0),
		i2 => SW(1),
		i3 => SW(2),
		out1 => LEDR(0)
	);

end const_array_look_up_tester_impl;
