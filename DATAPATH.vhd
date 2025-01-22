----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:38:10 11/06/2023 
-- Design Name: 
-- Module Name:    DATAPATH - Behavioral 
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

entity DATAPATH is 
port( plaintext: in std_logic_vector(63 downto 0);
key: in std_logic_vector(79 downto 0);
sel,rst,regload,keyload,clk,count: in std_logic;
en: in std_logic;
ciphertext:  out std_logic_vector(63 downto 0);
comp_out: out std_logic);

end DATAPATH;



architecture Behavioral of DATAPATH is

 component MUX64 is Port( input_0,input_1: in std_logic_vector(63 downto 0);
                     sel:in std_logic;
							output: out std_logic_vector(63 downto 0));
 end component;
 

 component reg_64 is Port( D: in std_logic_vector(63 downto 0);
                          clk, regload,clr:in std_logic;
							     Q: out std_logic_vector(63 downto 0));
 end component;
 
 
 component p_layer is Port( input: in std_logic_vector(63 downto 0);
							   output: out std_logic_vector(63 downto 0));
 end component;
 
 
 component S_box is Port( input: in std_logic_vector(3 downto 0);
							 output: out std_logic_vector(3 downto 0));
 end component;
 
 
 component sbox_map port (
		input: in std_logic_vector(63 downto 0);
		output: out std_logic_vector(63 downto 0);
		clock: in std_logic);
		end component;
 
 
 component tristate Port( inp: in std_logic_vector(63 downto 0);
                          en:in std_logic;
							     output: out std_logic_vector(63 downto 0));
		end component;						  
								  
 component counter is port( clk,clr,up:in std_logic;
									 output:out std_logic_vector(4 downto 0));
 end component;	
 
 
 
 component generate_roundkey is port( key: in std_logic_vector(79 downto 0);
      keyout: out std_logic_vector(63 downto 0);
		--key64: out std_logic_vector(63 downto 0);
		comp_out:out std_logic; --comparator output
		keyload: in std_logic;
		clk,clr,up,sel:in std_logic);
 end component;
 
 
 
 signal p_out : std_logic_vector(63 downto 0);
 signal reg64_in:std_logic_vector(63 downto 0);
 signal sbox_out:std_logic_vector(63 downto 0);
 Signal xor_out,xor_in1:std_logic_vector(63 downto 0);
 signal xor_in2: std_logic_vector(63 downto 0);
 signal S_box15,S_box14,S_box13,S_box12,S_box11,S_box10,S_box9,S_box8,S_box7,S_box6,S_box5,S_box4,S_box3,S_box2,S_box1,S_box0:std_logic_vector(3 downto 0);
 signal S_box15out,S_box14out,S_box13out,S_box12out,S_box11out,S_box10out,S_box9out,S_box8out,S_box7out,S_box6out,S_box5out,S_box4out,S_box3out,S_box2out,S_box1out,S_box0out:std_logic_vector(3 downto 0);
 --signal s_boxout:std_logic_vector(63 downto 0);
 --signal keyout:std_logic_vector(63 downto 0);
 
 
begin
 --xor_in2 <= Qinput(79 downto 16); 
 MUX1: MUX64 PORT map( input_0=>plaintext,
                      input_1=> p_out,
							 sel=>sel,
							 output=> reg64_in); 
							 
 reg1: REG_64 port map( D=> reg64_in,
                        Q=> xor_in1,
								clk=>clk,
								regload=>regload,
								clr=>rst);
 
 genkey: generate_roundkey port map( key=>key,
                                    keyout=>xor_in2,
												 comp_out=>comp_out,
												 clk=>clk,
												 clr=>rst,
												 up=>count,
												 keyload=>keyload,
												 sel=>sel);								
								
 xor_out<= xor_in1 XOR xor_in2; 															 
 
								
 
 


								
 trist: tristate port map(	output=> ciphertext,
                           inp=>xor_out,
									en=> en);
									
									
 
 
 
                                     												 
									
 player_connection: P_layer port map( input=> sbox_out,
                                     output=> p_out);
 
 SMAP : SBOX_MAP port map(
		input => xor_out,
		clock=>clk,
		output(63 downto 60) => S_box15,
		output(59 downto 56) => S_box14,
		output(55 downto 52) => S_box13,
		output(51 downto 48) => S_box12,
		output(47 downto 44) => S_box11,
		output(43 downto 40) => S_box10,
		output(39 downto 36) => S_box9,
		output(35 downto 32) => S_box8,
		output(31 downto 28) => S_box7,
		output(27 downto 24) => S_box6,
		output(23 downto 20) => S_box5,
		output(19 downto 16) => S_box4,
		output(15 downto 12) => S_box3,
		output(11 downto 8) => S_box2,
		output(7 downto 4) => S_box1,
		output(3 downto 0) => S_box0
		
		);
	
		
  substitution0: S_box port map(
		input => S_box15,
		output => S_box15out
	 );
	 
	  substitution1 : S_box port map(
		input => S_box14,
		output => S_box14out
	 );
	 
	  substitution2 : S_box port map(
		input => S_box13,
		output => S_box13out
	 );
	 
	  substitution3 : S_box port map(
		input => S_box12,
		output => S_box12out
	 );
	 
	  substitution4 : S_box port map(
		input => S_box11,
		output => S_box11out
	 );
	 
	  substitution5 : S_box port map(
		input => S_box10,
		output => S_box10out
	 );
	 
	  substitution6 : S_box port map(
		input => S_box9,
		output => S_box9out
	 );
	 
	  substitution7 : S_box port map(
		input => S_box8,
		output => S_box8out
	 );
	 
	  substitution8 : S_box port map(
		input => S_box7,
		output => S_box7out
	 );
	 
	  substitution9 : S_box port map(
		input => S_box6,
		output => S_box6out
	 );
	 
	  substitution10 : S_box port map(
		input => S_box5,
		output =>S_box5out
	 );
	 
	  substitution11 : S_box port map(
		input => S_box4,
		output => S_box4out
	 );
	 
	  substitution12 : S_box port map(
		input => S_box3,
		output => S_box3out
	 );
	 
	  substitution13 : S_box port map(
		input => S_box2,
		output =>S_box2out
	 );
	 
	  substitution14 : S_box port map(
		input => S_box1,
		output => S_box1out
	 );
	 
	  substitution15 : S_box port map(
		input => S_box0,
		output => S_box0out
	 );


	sbox_out <= (S_box15out & S_box14out & S_box13out & S_box12out & S_box11out&S_box10out&S_box9out&S_box8out&S_box7out&S_box6out&S_box5out&S_box4out&S_box3out&S_box2out&S_box1out&S_box0out);	
	
	
		
 
									
								



end Behavioral;

