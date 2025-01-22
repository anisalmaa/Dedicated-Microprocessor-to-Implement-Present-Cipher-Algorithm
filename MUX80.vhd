----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:27:43 11/06/2023 
-- Design Name: 
-- Module Name:    MUX80 - Behavioral 
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

entity MUX80 is
	port(
	input_0, input_1: IN STD_LOGIC_VECTOR(79 downto 0);
	output: OUT STD_LOGIC_VECTOR(79 downto 0);
	sel: IN STD_LOGIC
	);

end MUX80;

architecture Behavioral of MUX80 is

begin
--	with sel select OUTPUT <= input_0 when '0',
--		input_1 when '1';
  process(sel,input_0,input_1)
  begin
    if(sel = '0')then
	   output <= input_0;
	 else	
	   output <= input_1;
	 end if;
  end process;	 

end Behavioral;

