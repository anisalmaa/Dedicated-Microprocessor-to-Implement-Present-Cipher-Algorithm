----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:02:20 11/07/2023 
-- Design Name: 
-- Module Name:    sbox_map - Behavioral 
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

entity sbox_map is 

	port(
		input: in std_logic_vector(63 downto 0);
		output: out std_logic_vector(63 downto 0);
		clock: in std_logic
		);
	
end sbox_map;

architecture Behavioral of sbox_map is

begin
sProcess: process(clock) is
							begin
							if(RISING_EDGE(clock)) then
							output <= input;
							end if;
							
					  end process;
end Behavioral;

