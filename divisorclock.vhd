LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY divisorclock IS
	PORT(
		clk_in : IN  STD_LOGIC;
      clk_out: OUT STD_LOGIC);
END divisorclock;

ARCHITECTURE clk1Hz OF divisorclock IS
	SIGNAL aux: STD_LOGIC;
	SIGNAL counter : INTEGER RANGE 0 TO 24999999;
BEGIN
	PROCESS (clk_in) 
		BEGIN
		IF (clk_in = '1') THEN
			IF (counter = 24999999) THEN
				counter <= 0;
				aux <= NOT(aux);
         ELSE
				counter <= counter + 1;
         END IF;
      END IF;
	END PROCESS;    
   clk_out <= aux;
END clk1Hz;