library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
 
entity counter50 is 
  port(C, CLR, hold : in  std_logic;  
        Q : out std_logic_vector(5 downto 0));  
end counter50; 
architecture archi of counter50 is  
  signal tmp: std_logic_vector(5 downto 0); 
  begin  
      process (C, CLR, hold) 
        begin
          if (hold = '0')  then
            if (CLR='1') then  
              tmp <= "000000";  
            elsif (C'event and C='1') then 
              if (tmp = "110011") then
                tmp <= "000001";
              else
                tmp <= tmp + 1;
              end if; 
            end if;
          end if;  
      end process; 
      Q <= tmp;  
end archi; 