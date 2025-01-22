----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:29 11/19/2023 
-- Design Name: 
-- Module Name:    top_level - Behavioral 
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

entity top_level is port( 
 plaintext: in std_logic_vector(63 downto 0);
 keytext: in std_logic_vector(79 downto 0);
 clk,rst: in std_logic;
 output: out std_logic_vector(63 downto 0));
end top_level;

architecture Behavioral of top_level is

 component DATAPATH is 
   port( plaintext: in std_logic_vector(63 downto 0);
   key: in std_logic_vector(79 downto 0);
   sel,rst,REGload,keyload,clk,count: in std_logic;
   en: in std_logic;
   ciphertext:  out std_logic_vector(63 downto 0);
   comp_out: out std_logic);

 end component;

 component controlunit is
	port(
		clk,clr: in std_logic;
		comp_out: in std_logic;
		keyload, regload, sel,up,en, dp_clr : out std_logic
		
	);
	
 end component;

	signal keyl, selct,regl,upcounter,enable,comparator, dp_clr_sig: std_logic;
 begin
  datapath_connect:datapath port map( 
  plaintext=>plaintext,
  key=>keytext,
  sel=>selct,
  rst=>dp_clr_sig,
  clk=>clk,
  regload=>regl,
  keyload=>keyl,
  count=>upcounter,
  comp_out=>comparator,
  ciphertext=>output,
  en=>enable);
 
 
 controlunit_connect: controlunit port map(
  clk=>clk,
  clr=>rst,
  comp_out=>comparator,
  keyload=>keyl,
  regload=>regl,
  sel=>selct,
  up=>upcounter,
  en=>enable,
  dp_clr => dp_clr_sig);
  
  
end Behavioral;



