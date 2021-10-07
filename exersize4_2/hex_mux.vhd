LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

entity hex_mux is
	port
	(
		-- Input ports
		bin	: in  std_logic_vector(11 downto 0);
		sel	: in  std_logic_vector(1 downto 0);		

		-- Output ports
		tsseg	: out std_logic_vector(20 downto 0)
		
	);
end hex_mux;



-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture hex_mux_impl of hex_mux is

signal temp : std_logic_vector (20 downto 0);

begin
B2S_1: entity bin2sevenseg
	port map 
	(
	 bin(3 downto 0) => bin(11 downto 8),
	 sseg(6 downto 0) => temp(20 downto 14)
	);
B2S_2: entity bin2sevenseg
	port map 
	(
	 bin(3 downto 0) => bin(7 downto 4),
	 sseg(6 downto 0) => temp(13 downto 7)
	);
B2S_3: entity bin2sevenseg
	port map 
	(
	 bin(3 downto 0) => bin(3 downto 0),
	 sseg(6 downto 0) => temp(6 downto 0)
	);
	
	with sel select tsseg <= 
		"1111111" & "1000000" & "0101011" when not "11",
		"1000000" & "0001110" & "0001110" when not "01",		
		temp when not "10",
		"1111111" & "1111111" & "1111111" when others;
		
end hex_mux_impl;
