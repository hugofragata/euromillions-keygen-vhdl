use IEEE.std_logic_1164.all;

library IEEE;

entity coord is 

 port(
 		--primeiro hex
		n0 : in std_logic_vector(6 downto 0);
		n1 : in std_logic_vector(6 downto 0);
		n2 : in std_logic_vector(6 downto 0);
		n3 : in std_logic_vector(6 downto 0);
		n4 : in std_logic_vector(6 downto 0);
		e0 : in std_logic_vector(6 downto 0);
		e1 : in std_logic_vector(6 downto 0);

		--segundo hex	
		n01 : in std_logic_vector(6 downto 0);
		n11 : in std_logic_vector(6 downto 0);
		n21 : in std_logic_vector(6 downto 0);
		n31 : in std_logic_vector(6 downto 0);
		n41 : in std_logic_vector(6 downto 0);
		e01 : in std_logic_vector(6 downto 0);
		e11 : in std_logic_vector(6 downto 0);
		
		
		trigger : in std_logic;
		
		--o que vai aparecer nos hexdisplays (estas saídas são ligadas directgamente aos hexes)
		outputhex0 : out std_logic_vector(7 downto 0);
		outputhex1 : out std_logic_vector(7 downto 0);
		outputhex2 : out std_logic_vector(7 downto 0);
		outputhex3 : out std_logic_vector(7 downto 0);
		outputhex4 : out std_logic_vector(7 downto 0);
		outputhex5 : out std_logic_vector(7 downto 0);
		outputhex6 : out std_logic_vector(7 downto 0)

	);

end coord;


architecture arch1 of coord is

	--criar variável unsigned ou numeric idk que vai ser o numero de outputs. incrementa quando se clica no botao e vai ate tres
	type state is (E0, E1, E2);
	signal Q : state := E0; 


begin
	
  
  



end arch1;