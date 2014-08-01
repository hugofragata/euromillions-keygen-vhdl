library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity eurotop is
	port(SW : in std_logic_vector(7 downto 0);
		CLOCK_50 : in std_logic;
		KEY : in std_logic_vector(0 downto 0);
		HEX0 : out std_logic_vector(6 downto 0);
		HEX1 : out std_logic_vector(6 downto 0);
		HEX2 : out std_logic_vector(6 downto 0);
		HEX3 : out std_logic_vector(6 downto 0);
		HEX4 : out std_logic_vector(6 downto 0);
		HEX5 : out std_logic_vector(6 downto 0);
		HEX6 : out std_logic_vector(6 downto 0)
		LEDR : out std_logic);		
end eurotop;

architecture Shell of eurotop is

		
		signal s_num0,s_num1,s_num2,s_num3,s_num4 : std_logic_vector(5 downto 0);
		signal s_num0hex, s_num1hex, s_est0hex : std_logic_vector(7 downto 0);
		signal s_est0, s_est1 : std_logic_vector(3 downto 0);
		
begin
		
		num0 : entity work.counter50(archi)
		port map(C => CLOCK_50,
				 CLR => SW(7),
				 hold => SW(0),
				 Q => s_num0);

		num1 : entity work.counter50(archi)
		port map(C => CLOCK_50,
				 CLR => SW(7),
				 hold => SW(1),
				 Q => s_num1);

--------num2 : entity work.counter50(archi)
--------port map(C => CLOCK_50,
---------------- CLR => SW(7),
---------------- hold => SW(2),
---------------- Q => s_num2)

--------num3 : entity work.counter50(archi)
--------port map(C => CLOCK_50,
---------------- CLR => SW(7),
---------------- hold => SW(3),
---------------- Q => s_num3)

--------num4 : entity work.counter50(archi)
--------port map(C => CLOCK_50,
---------------- CLR => SW(7),
---------------- hold => SW(4),
---------------- Q => s_num4)

		est0 : entity work.counter11(archi)
		port map(C => CLOCK_50,
				 CLR => SW(7),
				 hold => SW(5),
				 Q => s_est0);

--------est1 : entity work.counter11(archi)
--------port map(C => CLOCK_50,
---------------- CLR => SW(7),
---------------- hold => SW(6),
---------------- Q => s_est1)

		s_num0hex <= "00" & s_num0; 
		s_num1hex <= "00" & s_num1;
		s_est0hex <= "0000" & s_est0;
		hexnum0 : entity work.Bin7SegDecoder(Behavioral)
		port map(binInput => s_num0hex,
				 decOut_n => HEX0,
				 decOut_n1 => HEX1,
				 decOut_n2 => HEX2);

		hexnum1 : entity work.Bin7SegDecoder(Behavioral)
		port map(binInput => s_num1hex,
				 decOut_n => HEX3,
				 decOut_n1 => HEX4);

		hexnum2 : entity work.Bin7SegDecoder(Behavioral)
		port map(binInput => s_est0hex,
				 decOut_n => HEX5,
				 decOut_n1 => HEX6);

		clkdiv : entity work.

end Shell;