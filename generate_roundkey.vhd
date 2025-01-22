----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:42:18 11/09/2023 
-- Design Name: 
-- Module Name:    generate_roundkey - Behavioral 
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

entity generate_roundkey is port (key: in std_logic_vector(79 downto 0);
       keyout:out std_logic_vector(63 downto 0);
		--key64: out std_logic_vector(63 downto 0);
		comp_out:out std_logic; --comparator output
		clk,clr,up,KEYload,sel:in std_logic);
end generate_roundkey;

architecture Behavioral of generate_roundkey is
	component  MUX80 port(
		input_0, input_1: IN STD_LOGIC_VECTOR(79 downto 0);
		output: OUT STD_LOGIC_VECTOR(79 downto 0);
		sel: IN STD_LOGIC
	);
	end component;
	
	component key_reg port(
		D: IN STD_LOGIC_VECTOR(79 downto 0);
			Q: OUT STD_LOGIC_VECTOR(79 downto 0);
			CLK,CLR,KEYLOAD: IN STD_LOGIC
	);
	end component;
	
	component s_Box port(
		input: IN STD_LOGIC_VECTOR(3 downto 0);
		output: OUT STD_LOGIC_VECTOR( 3 downto 0)

	);
	end component;
	
	
	component COUNTER is
    port(
        UP, CLK, CLR: IN STD_LOGIC;
        --DONE: OUT STD_LOGIC;    --outputs 1 if count is 1111
        
		  OUTPUT: out STD_LOGIC_VECTOR(4 downto 0)
    );
  end component;

	
	
	signal s_out, reg80_in,rotation, Qin: std_logic_vector(79 downto 0);
	signal s_one: std_logic_vector(14 downto 0);
	signal s_two: std_logic_vector(3 downto 0);
	signal s_in, sub_out: std_logic_vector(3 downto 0);
	signal xor_in: std_logic_vector( 4 downto 0);
	signal mid: std_logic_vector( 40 downto 0);
   signal xor_ans: std_logic_vector( 4 downto 0);
	signal c_out_sig: std_logic_vector (4 downto 0);
	
	signal endd: std_logic_vector(13 downto 0);
	signal middle: std_logic_vector(55 downto 0);
	signal ending: std_logic_vector(14 downto 0);
	signal xor_bit: std_logic_vector(5 downto 0);
	
	
		

begin
 

	connect_mux: MUX80 port map(
		input_0 => key,
		input_1 => s_out,
		output => reg80_in,
		sel => sel
	);
	
	connect_reg: key_reg port map(
		D => reg80_in,
		Q => Qin,
		CLK => clk,
		CLR => clr,
		KEYload=> KEYload
		
	);
	
	
  connectcount: counter port map(
           up=>up,
			  clk=>clk,
			  clr=>clr,
			  output=>c_out_sig
			  );
			  comp_out <= c_out_sig(0) and c_out_sig(1) and c_out_sig(2) and c_out_sig(3) and c_out_sig(4); 
   	
 
	
----------------circular left shift 19-------------------
s_one <= Qin(14 downto 0);
s_two <= Qin(18 downto 15);
mid <= Qin(79 downto 39);
xor_bit<= Qin(38 downto 33);
endd<= Qin(32 downto 19);
rotation <= s_two & s_one & mid & xor_bit& endd; --altered


----------------------operation area--------------------
s_in <= rotation(79 downto 76);
middle <= rotation(75 downto 20);
xor_in <= rotation(19 downto 15);
ending<= rotation( 14 downto 0);



--------------------connect_sbox--------------------------
connectSbox: s_Box port map(
		input => s_in,
		output => sub_out
);


----------------------------Xor portion--------------
xor_ans <= xor_in xor c_out_sig;

----------------------------joining------------------
s_out <= sub_out &middle& xor_ans &ending;
keyout<= Qin(79 downto 16);
--key64 <= s_out(79 downto 16);

 



end Behavioral;