
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity temp is
	port
	(
		-- Input ports
		bin	: in  std_logic_vector(3 downto 0);

		-- Output ports
		Sseg	: out std_logic_vector(6 downto 0)
	);
end temp;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;


architecture temp_con of temp is
	-- Declarations (optional)
begin

with bin select Sseg <= 
		"0000000" when "0000", -- 0 
		"0000001" when "0001", -- 1
		"1001111" when "0010", -- 2
		"0010010" when "0011", -- 3
		"0000110" when "0100", -- 4
		"1001100" when "0101", -- 5 
		"0100100" when "0110", -- 6
		"1100000" when "0111", -- 7
		"0001111" when "1000", -- 8
		"0000000" when "1001", -- 9
		"1111111" when others; 

end temp_con;
