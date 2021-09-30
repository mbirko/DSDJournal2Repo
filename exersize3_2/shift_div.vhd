library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_div is
	generic
	(
		DATA_WIDTH : natural := 8
	);	
	port
	(
		a : in std_logic_vector(DATA_WIDTH-1 downto 0);
		a_shL, a_shR, a_ror : out std_logic_vector(DATA_WIDTH-1 downto 0)
	);
end shift_div;

-- When using ambersand to concatenate bits we use the concept of taking a "slice" of the given bits 
-- that we wish to "shift"

-- Implementing a shifted left one time
-- Here the Least Significant bit is thrown out to make room for the logical left shift
-- This is specificed in the brackets after a, where (DATA_WIDTH-2 downto 0),
-- instead would sacrifice the Most significant bit.
architecture a_shL_impl of shift_div is
begin
	a_shL <= a(DATA_WIDTH-2 downto 0) & "0";
end a_shL_impl;

-- Implementing a shifted right two times
-- Here the Least Significant bit is thrown out to make room for the two logical right shifts
-- This is specificed in the brackets after a, where (DATA_WIDTH-3 downto 0),
-- instead would sacrifice the Most significant bit.
architecture a_shR_impl of shift_div is
begin
	a_shR <= "00" & a(DATA_WIDTH-3 downto 0);
end a_shR_impl;

-- Implementing a rotation to the right, three times
-- This is done by slicing of three bits from the Least Significant bit and appending it to the left side,
-- of a slice that contains the remaing five bits.
architecture a_ror_impl of shift_div is
begin
	a_ror <= a(DATA_WIDTH-6 downto 0) & a(DATA_WIDTH-1 downto DATA_WIDTH-5);
end a_ror_impl;

-- Implementing all together
architecture a_tot_impl of shift_div is
begin
	a_shL <= a(DATA_WIDTH-2 downto 0) & "0";	
	a_shR <= "00" & a(DATA_WIDTH-3 downto 0);
	a_ror <= a(DATA_WIDTH-6 downto 0) & a(DATA_WIDTH-1 downto DATA_WIDTH-5);
	
end a_tot_impl;

