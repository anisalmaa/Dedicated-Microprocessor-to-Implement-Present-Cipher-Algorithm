----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:49:39 11/07/2023 
-- Design Name: 
-- Module Name:    S_BOX - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity S_box is

	port(
		input: IN STD_LOGIC_VECTOR(3 downto 0);
		output: OUT STD_LOGIC_VECTOR( 3 downto 0)
	);


end S_box;

architecture Behavioral of S_box is

begin
	with input select output <= "1100" when "0000", 
										 "0101" when "0001", 
										 "0110" when "0010", 
										 "1011" when "0011",
										 "1001" when "0100",
										 "0000" when "0101", 
										 "1010" when "0110",
										 "1101" when "0111",
										 "0011" when "1000",
										 "1110" when "1001",
										 "1111" when "1010",
										 "1000" when "1011",
										 "0100" when "1100",
										 "0111" when "1101",
										 "0001" when "1110",
										 "0010" when "1111",
										 (others => 'Z') when others;

end Behavioral;

