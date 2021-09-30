LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;
ENTITY four_bit_adder IS
	GENERIC (--	array size paremeter
		D_W : NATURAL := 4
	);
	PORT (-- name     dir	type	array size, if any
		cin : IN STD_LOGIC_VECTOR 	(0 DOWNTO 0);
		a : IN STD_LOGIC_VECTOR 	((D_W - 1) DOWNTO 0);
		b : IN STD_LOGIC_VECTOR 	((D_W - 1) DOWNTO 0);
		sum : OUT STD_LOGIC_VECTOR 	((D_W - 1) DOWNTO 0);
		cout : OUT STD_LOGIC
	);
END ENTITY;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ARCHITECTURE unsigned_imp OF four_bit_adder IS
	SIGNAL temp : STD_LOGIC_VECTOR (D_W DOWNTO 0);
BEGIN
	-- cast to unsinged, resize to fasilitate carry out
	temp <= STD_LOGIC_VECTOR(
		resize(unsigned(a), (D_W + 1)) +
		resize(unsigned(b), (D_W + 1)) +
		resize(unsigned(cin), (D_W + 1)));
	-- four bit result on sum
	sum <= temp(D_W - 1 DOWNTO 0);
	-- carry out to cout
	cout <= temp(D_W);
END unsigned_imp;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ARCHITECTURE signed_imp OF four_bit_adder IS
	SIGNAL temp : STD_LOGIC_VECTOR (D_W DOWNTO 0);
BEGIN
	-- input array castes til signed og resizes til + 1 af den oprindelige stoerelse.
	temp <= STD_LOGIC_VECTOR(
		resize(signed(a), (D_W + 1)) +
		resize(signed(b), (D_W + 1)) +
		resize(signed(cin), (D_W + 1)));
	-- four bit result on sum									
	sum <= temp((D_W - 1) DOWNTO 0);
	-- carry out to cout		
	cout <= temp(D_W);
END signed_imp;