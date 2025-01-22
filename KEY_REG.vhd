----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:45:03 11/07/2023 
-- Design Name: 
-- Module Name:    KEY_REG - Behavioral 
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

entity KEY_REG is
port(
			D: IN STD_LOGIC_VECTOR(79 downto 0);
			Q: OUT STD_LOGIC_VECTOR(79 downto 0);
			CLK,CLR,keyLOAD: IN STD_LOGIC
	);
end KEY_REG;

architecture Behavioral of KEY_REG is


	signal temp: STD_LOGIC_VECTOR(79 downto 0);

begin
	KEYREG : process(CLK,CLR,keyLOAD,temp)
	begin 
		if(RISING_EDGE(CLK)) then
			if(CLR = '1') then
				temp <= (others => '0');
				
				elsif(keyLOAD = '1') then 
					temp <= D;
					end if;
					
				end if;
				Q <= temp;
				end process;


end Behavioral;
