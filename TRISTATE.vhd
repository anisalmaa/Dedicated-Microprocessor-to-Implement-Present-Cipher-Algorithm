----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:32:05 11/06/2023 
-- Design Name: 
-- Module Name:    TRISTATE - Behavioral 
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

entity TRISTATE is port(  en:in std_logic;
                          inp:in std_logic_vector(63 downto 0);
                          output:out std_logic_vector(63 downto 0));
end TRISTATE;

architecture Behavioral of TRISTATE is
begin

  process(en,inp)
  begin
    if(en= '0')then
	   output <= (others => 'Z');
	 else	
	   output <= inp;
	 end if;
  end process;	 

end Behavioral;



