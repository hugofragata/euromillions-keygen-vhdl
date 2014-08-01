library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
 
entity Bin7SegDecoder is 
	port(binInput : in std_logic_vector(7 downto 0); 
		  decOut_n : out std_logic_vector(6 downto 0);
		  decOut_n1 : out std_logic_vector(6 downto 0);
		  decOut_n2 : out std_logic_vector(6 downto 0)); 
end Bin7SegDecoder; 
 
architecture Behavioral of Bin7SegDecoder is 

signal s_bcd0, s_bcd1,s_bcd2 : std_logic_vector(3 downto 0);

begin 
	
	
	process(binInput)
		variable v_rout : unsigned(7 downto 0);
		variable bcd2,bcd1,bcd0 : unsigned(7 downto 0);
	begin
		v_rout := unsigned(binInput);
		bcd2 := v_rout/100;
		bcd1 := unsigned(((v_rout - ((v_rout/100)*100))/10))(7 downto 0);
		bcd0 := v_rout rem 10;
		
		
		s_bcd0 <= std_logic_vector(bcd0)(3 downto 0);
		s_bcd1 <= std_logic_vector(bcd1)(3 downto 0);
		s_bcd2 <= std_logic_vector(bcd2)(3 downto 0);
	

	end process;
	
	with s_bcd0 select 
	decOut_n <= "1111001" when "0001", --1 
					"0100100" when "0010", --2
					"0110000" when "0011", --3 
					"0011001" when "0100", --4 
					"0010010" when "0101", --5 
					"0000010" when "0110", --6 
					"1111000" when "0111", --7 
					"0000000" when "1000", --8 
					"0010000" when "1001", --9 
					"1000000" when others; --0
	
	with s_bcd1 select 
	decOut_n1 <= "1111001" when "0001", --1 
					"0100100" when "0010", --2
					"0110000" when "0011", --3 
					"0011001" when "0100", --4 
					"0010010" when "0101", --5 
					"0000010" when "0110", --6 
					"1111000" when "0111", --7 
					"0000000" when "1000", --8 
					"0010000" when "1001", --9 
					"1000000" when others;
	
	with s_bcd2 select 
	decOut_n2 <= "1111001" when "0001", --1 
					"0100100" when "0010", --2
					"0110000" when "0011", --3 
					"0011001" when "0100", --4 
					"0010010" when "0101", --5 
					"0000010" when "0110", --6 
					"1111000" when "0111", --7 
					"0000000" when "1000", --8 
					"0010000" when "1001", --9 
					"1000000" when others; --0
end Behavioral; 