----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:28:44 11/06/2023 
-- Design Name: 
-- Module Name:    REG_64 - Behavioral 
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

entity REG_64 is
port(
			D: IN STD_LOGIC_VECTOR(63 downto 0);
			Q: OUT STD_LOGIC_VECTOR(63 downto 0);
			CLK,CLR,Regload: IN STD_LOGIC
	);
end REG_64;

architecture Behavioral of REG_64 is


	signal temp: STD_LOGIC_VECTOR(63 downto 0);

begin
	REG64 : process(CLK,CLR,REGLOAD,temp)
	begin 
		if(RISING_EDGE(CLK)) then
			if(CLR = '1') then
				temp <= (others => '0');
				
				elsif(REGLOAD = '1') then 
					temp <= D;
					end if;
					
				end if;
				Q <= temp;
				end process;


end Behavioral;
