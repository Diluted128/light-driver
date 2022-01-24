library ieee ;

use ieee.std_logic_1164.all;

use ieee.std_logic_unsigned.all;

 

entity Lab6 is

port( writedata: in std_logic_vector(7 downto 0);

      clk_clk, reset_reset:   in std_logic;

      wr, cs : in std_logic;

      leds_out: out std_logic;
		
		hexOne_out : OUT std_logic_vector(0 to 6);
		
		hexTwo_out : OUT std_logic_vector(0 to 6);
		
		hexThree_out : OUT std_logic_vector(0 to 6));
		

end Lab6;

 

architecture rtl of Lab6 is

signal sliders: std_logic_vector(6 downto 0);

signal direction: std_logic;

signal firstRoomCounter: std_logic_vector(3 downto 0) := "0000";   

signal secondRoomCounter: std_logic_vector(3 downto 0) := "0000";   

signal thridRoomCounter: std_logic_vector(3 downto 0) :="0000";  

signal error_flag: std_logic := '0';

begin


process(clk_clk)

begin

   if (clk_clk'event and clk_clk='1') then

      if(wr='1' and cs='1') then

        sliders <= writedata(6 downto 0);
		  
		  direction <= writedata(7);
		  
        end if;

    end if;

end process;

 

process(clk_clk)

  begin

    if (clk_clk'event and clk_clk='1') then
	     
		 
        case sliders is
		  
          when "0000001" =>
			 
            if(direction ='1') then
				
				   if(firstRoomCounter = 0) then    
						 error_flag <= '1';
					else	 
				       firstRoomCounter <= firstRoomCounter - 1;
						 error_flag <= '0';
				   end if;			 
					
				else
				   
				   if(firstRoomCounter = 9) then  
						 error_flag <= '1';
					else	 	   
					    firstRoomCounter <= firstRoomCounter + 1;
						 error_flag <= '0';
					end if;	
					
				end if;	
			 
          when "0000010" =>
			
            if(direction = '1') then
				   
				   if(thridRoomCounter = 9) then
						 error_flag <= '1';
					else	
				       thridRoomCounter <= thridRoomCounter + 1;
						 error_flag <= '0'; 
					end if;	
					
				else
				
					if(thridRoomCounter = 0) then
						 error_flag <= '1';
					else	
					    thridRoomCounter <= thridRoomCounter - 1;
						 error_flag <= '0';	 
					end if;	 
					
				end if;	
				
			 when "0000100" =>
			
            if(direction = '1') then
				   
					if(firstRoomCounter = 9 OR thridRoomCounter = 0) then
					    error_flag <= '1';
					else	 
				       firstRoomCounter <= firstRoomCounter + 1;
				       thridRoomCounter <= thridRoomCounter - 1;
						 error_flag <= '0';
					end if;		 
					
				else
				   
					if(firstRoomCounter = 9 OR thridRoomCounter = 0) then
					    error_flag <= '1';
					else	 
				       firstRoomCounter <= firstRoomCounter - 1;
				       thridRoomCounter <= thridRoomCounter + 1;
						 error_flag <= '0';
					end if;
					
				end if;	

		    when "0001000" =>
			
            if(direction = '1') then
				
				   if(secondRoomCounter = 9) then
						 error_flag <= '1';
					else	
					    secondRoomCounter <= secondRoomCounter + 1;
						 error_flag <= '0';	 
					end if;
					
				else
				   
					if(secondRoomCounter = 0) then
						 error_flag <= '1';
					else	
					    secondRoomCounter <= secondRoomCounter - 1;
						 error_flag <= '0';	 
					end if;
					
				end if;	
				
			 when "0010000" =>
			 
            if(direction = '1') then
				
			      if(firstRoomCounter = 9 OR secondRoomCounter = 0) then
					    error_flag <= '1';
					else	 
				       firstRoomCounter <= firstRoomCounter + 1;
				       secondRoomCounter <= secondRoomCounter - 1;
						 error_flag <= '0';
					end if;
							   		
				else
				   
					if(firstRoomCounter = 0 OR secondRoomCounter = 9) then
					    error_flag <= '1';
					else	 
				       firstRoomCounter <= firstRoomCounter - 1;
				       secondRoomCounter <= secondRoomCounter + 1;
						 error_flag <= '0';
					end if;
					
				end if;	
				
			 when "0100000" =>
			
            if(direction = '1') then
				
				   if(secondRoomCounter = 0) then
						 error_flag <= '1';
					else	
					    secondRoomCounter <= secondRoomCounter - 1;
						 error_flag <= '0';	 
					end if;
				
				else
				   
					if(secondRoomCounter = 9) then
						 error_flag <= '1';
					else	
					    secondRoomCounter <= secondRoomCounter + 1;
						 error_flag <= '0';	 
					end if;
				
				end if;	
				
			 when "1000000" =>
			
            if(direction = '1') then
				
				   if(secondRoomCounter = 9) then
						 error_flag <= '1';
					else	
					    secondRoomCounter <= secondRoomCounter + 1;
						 error_flag <= '0';	 
					end if;
					
				else
				   
					if(secondRoomCounter = 0) then
						 error_flag <= '1';
					else	
					    secondRoomCounter <= secondRoomCounter - 1;
						 error_flag <= '0';	 
					end if;
					
				end if;
				
		    when others => 		
			         
        end case;
		  
		 
		
			if(error_flag = '1') then
		   hexOne_out <= "0110000";
			hexTwo_out <= "0101111";
			hexThree_out <= "0101111";
			leds_out <= '1';
		else
		
		  leds_out <= '0';
		  
        case firstRoomCounter is
           when "0000" =>
             hexOne_out  <= "0000001";	
           when "0001" =>
              hexOne_out <= "1001111";	
			  when "0010" =>
             hexOne_out  <= "0010010";	
           when "0011" =>
              hexOne_out <= "0000110";	
			  when "0100" =>
             hexOne_out  <= "0000110";	
           when  "0101" =>
              hexOne_out <= "0100100";	
			  when "0110" =>
             hexOne_out  <= "0100000";	
           when  "0111" =>
              hexOne_out <= "0001111";	
			  when "1000" =>
             hexOne_out  <= "0000000";	
           when  "1001" =>
              hexOne_out <= "0000100";	 
			  when others => 	  
        end case;
  
		  case secondRoomCounter is
           when "0000" =>
             hexTwo_out  <= "0000001";	
           when "0001" =>
              hexTwo_out <= "1001111";	
			  when "0010" =>
             hexTwo_out  <= "0010010";	
           when "0011" =>
              hexTwo_out <= "0000110";	
			  when "0100" =>
             hexTwo_out  <= "0000110";	
           when  "0101" =>
              hexTwo_out <= "0100100";	
			  when "0110" =>
             hexTwo_out  <= "0100000";	
           when  "0111" =>
              hexTwo_out <= "0001111";	
			  when "1000" =>
             hexTwo_out  <= "0000000";	
           when  "1001" =>
              hexTwo_out <= "0000100";
			  when others => 	  
        end case;

        case thridRoomCounter is
           when "0000" =>
             hexThree_out  <= "0000001";	
           when "0001" =>
              hexThree_out <= "1001111";	
			  when "0010" =>
             hexThree_out  <= "0010010";	
           when "0011" =>
              hexThree_out <= "0000110";	
			  when "0100" =>
             hexThree_out  <= "0000110";	
           when  "0101" =>
              hexThree_out <= "0100100";	
			  when "0110" =>
             hexThree_out  <= "0100000";	
           when  "0111" =>
              hexThree_out <= "0001111";	
			  when "1000" =>
             hexThree_out  <= "0000000";	
           when  "1001" =>
              hexThree_out <= "0000100";	
			  when others => 	  
        end case;		  
			
		end if;
    end if;
  

end process;


end rtl;