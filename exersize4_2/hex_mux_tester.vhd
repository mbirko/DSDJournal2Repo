LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

entity hex_mux_tester is
	port
	(
		-- Input ports
		SW	: in  std_logic_vector(11 downto 0);
		KEY: in  std_logic_vector(1 downto 0);		

		-- Output ports
		HEX0	: out std_logic_vector(6 downto 0);
		HEX1	: out std_logic_vector(6 downto 0);
		HEX2	: out std_logic_vector(6 downto 0)		
	);
end hex_mux_tester;



-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture hex_mux_tester_impl of hex_mux_tester is

begin
DUT: entity hex_mux
	port map 
	(
		bin => SW(11 downto 0),
		sel => KEY(1 downto 0),
		tsseg(20 downto 14) => HEX2(6 downto 0),
		tsseg(13 downto 7) => HEX1(6 downto 0),
		tsseg(6 downto 0) => HEX0(6 downto 0)
	);

end hex_mux_tester_impl;
