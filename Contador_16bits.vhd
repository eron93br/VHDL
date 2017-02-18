LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Contado_16bits IS
	PORT(
		clock,reset, up_down, E: IN STD_LOGIC;
		carga: IN  STD_LOGIC_VECTOR (15 DOWNTO 0);  --INTEGER RANGE 0 TO 65535;
		saida: OUT  STD_LOGIC_VECTOR (15 DOWNTO 0)); --INTEGER RANGE 0 TO 65535);
END Contado_16bits;

ARCHITECTURE ARCH OF Contado_16bits IS
	
	SIGNAL counter: unsigned(15 DOWNTO 0); --INTEGER RANGE 0 TO 65535;

BEGIN

	IF (reset = '1') THEN
		counter <= "0000000000000000";
	END IF;
	
	IF (E = '1') THEN
		counter <= carga;
	END IF;
	
	saida <= STD_LOGIC_VECTOR(counter);
	
	PROCESS (clock) 
	BEGIN
	
	IF (clock = '1') THEN
			
		IF (up_down = '1') THEN
			
			IF (counter = "1111111111111111") THEN
				counter <= "0000000000000000";
			ELSE
					counter <= counter + 1;
			END IF;
		
		ELSE
		
			IF (counter = "0000000000000000") THEN
				counter <= "1111111111111111";
			ELSE
					counter <= counter - 1;
			END IF;
		END IF;	
						
	END IF;
	END PROCESS;    
   
END ARCH;