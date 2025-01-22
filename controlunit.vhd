----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:38:16 11/15/2023 
-- Design Name: 
-- Module Name:    controlunit - Behavioral 
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


entity controlunit is
	port(
		clk,clr: in std_logic;
		comp_out: in std_logic;
		 regload, sel,up,en,keyload, dp_clr:out std_logic
		
	);
end controlunit;

architecture Behavioral of controlunit is

	type state_type is (ST0, ST1, ST2, ST3, ST4);
	signal PS, NS : state_type;
	signal control : std_logic_vector(5 downto 0);
begin
	init_proc: process(clk, clr) is
	begin

          if(clr = '1') then 
            PS <= ST0;
          elsif(rising_Edge(clk)) then
            PS <= NS;
          end if;
        end process;
	
	compute_proc : process(PS,NS, comp_out) is
						begin
							case (PS) is
								when ST0 => 
									NS <= ST1;
									
								when ST1 =>
									NS <= ST2;
									
							   when ST2 =>
									NS <= ST3;
									
								when ST3 =>
								    if (comp_out = '1') then 
									    NS<=ST4;
									 else
									    NS <= ST2;
									end if;
									
								when ST4 =>
									NS <= ST4;
									
						end case;
					end process;
					
	outputProc : process(PS,control) is 
						begin
							case (PS) is
								when ST0 =>
									control <= "100000";
									
								when ST1 =>
							
									control <= "001110";
									
								when ST2 =>
								   control <= "011110";
									
								when ST3 =>
                           control <= "000000";
									
								when ST4 =>
									control <= "000001";
								
							end case;

					end process;		
					
			     dp_clr <= control(5);					
				  sel <=control(4);
				  regload <= control(3);
				  keyload<=control(2);
				  up<=control(1);
				  en<= control(0);
				

	
end Behavioral;