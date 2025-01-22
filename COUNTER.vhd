----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:36:23 11/06/2023 
-- Design Name: 
-- Module Name:    COUNTER - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNTER is
    port(
        UP, CLK, CLR: IN STD_LOGIC;
        --DONE: OUT STD_LOGIC;    --outputs 1 if count is 1111
        OUTPUT: out STD_LOGIC_VECTOR(4 downto 0)
    );
end COUNTER;

--architecture
architecture Behavioral of COUNTER is
    
    signal cntn: STD_LOGIC_VECTOR(4 downto 0);

begin
    --synchronous upcounter
    cnt: process(CLK, CLR, cntn)
    begin
      if (CLR = '1') then
             cntn <= "00000";
				 
      elsif (RISING_EDGE(CLK))then
				  if (UP = '1') then
					  cntn <= cntn + 1;							 
				  else
					  cntn <= cntn;
				  end if ;
		
	  end if ;
		  
		  

        OUTPUT <=cntn;
		       

 
    end process ;



end Behavioral;
