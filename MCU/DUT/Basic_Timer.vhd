LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY Basic_Timer IS
   PORT(
	clock 					: IN	STD_LOGIC;
	reset 					: IN	STD_LOGIC;
	CS	 					: IN	STD_LOGIC;
	Reg_sel					: IN	STD_LOGIC;
	WR_en					: IN	STD_LOGIC;
	Data_in					: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0 );
	BTIFG					: OUT 	STD_LOGIC);
END Basic_Timer;

ARCHITECTURE arch OF Basic_Timer IS

	SIGNAL 	BTCTL	: STD_LOGIC_VECTOR(7 DOWNTO 0 );
	SIGNAL 	BTCNT	: STD_LOGIC_VECTOR(31 DOWNTO 0 );
	SIGNAL 	MCLK	: STD_LOGIC_VECTOR(4 DOWNTO 0 );
	
	SIGNAL 	BTIP		: STD_LOGIC_VECTOR(2 DOWNTO 0 );
	SIGNAL 	BTSSEL		: STD_LOGIC_VECTOR(1 DOWNTO 0 );
	SIGNAL 	BTHOLD		: STD_LOGIC;
	SIGNAL 	MCLK0		: STD_LOGIC;
	SIGNAL 	MCLK2		: STD_LOGIC;
	SIGNAL 	MCLK4		: STD_LOGIC;
	SIGNAL 	MCLK8		: STD_LOGIC;
	SIGNAL 	BTclk		: STD_LOGIC;
	SIGNAL 	Set_BTIFG	: STD_LOGIC;
	SIGNAL 	BTIFG_flag	: STD_LOGIC;

BEGIN

	BTIP	<= 	BTCTL(2 DOWNTO 0);
	BTSSEL	<=  BTCTL(4 DOWNTO 3);
	BTHOLD	<=  BTCTL(5);
	
	MCLK0 <= MCLK(0);	
	MCLK2 <= MCLK(1);
	MCLK4 <= MCLK(2);
	MCLK8 <= MCLK(3);

	BTclk <= 	MCLK0 WHEN BTSSEL = "00" ELSE
				MCLK2 WHEN BTSSEL = "01" ELSE
				MCLK4 WHEN BTSSEL = "10" ELSE
				MCLK8 WHEN BTSSEL = "11";
			
	Set_BTIFG <=	BTCNT(0)  WHEN BTIP = "000" ELSE
					BTCNT(3)  WHEN BTIP = "001" ELSE
					BTCNT(7)  WHEN BTIP = "010" ELSE
					BTCNT(11) WHEN BTIP = "011" ELSE
					BTCNT(15) WHEN BTIP = "100" ELSE
					BTCNT(19) WHEN BTIP = "101" ELSE
					BTCNT(23) WHEN BTIP = "110" ELSE
					BTCNT(25) WHEN BTIP = "111";

					
	PROCESS (clock,reset)
	BEGIN
		IF (reset ='1') THEN		
			BTCTL <= (others => '0');
			MCLK  <= (others => '0');
		ELSIF(clock'EVENT AND clock='1') THEN
			MCLK <= MCLK + 1;
		
			IF (WR_en = '1' and Reg_sel = '0' and CS = '1') THEN
				BTCTL <= Data_in( 7 DOWNTO 0);
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS (BTclk,reset)
	BEGIN
		IF (reset ='1') THEN		
			BTCNT <= (others => '0');
		ELSIF(BTclk'EVENT AND BTclk='1') THEN
			IF (WR_en = '1' and Reg_sel = '1' and CS = '1') THEN
				BTCNT <= Data_in;
			ELSIF (BTHOLD = '0') THEN
				BTCNT <= BTCNT + 1;
			END IF;
		END IF;
	END PROCESS;

	PROCESS (clock,reset)
	BEGIN
		IF (reset ='1') THEN		
			BTIFG <= '0';
		ELSIF(clock'EVENT AND clock='1') THEN
			BTIFG_flag <= Set_BTIFG;
			
			if (BTIFG_flag = '0' and Set_BTIFG = '1') then 
				BTIFG <= '1';
			ELSE 
			BTIFG <= '0';
			END IF;	
		END IF;
	END PROCESS;























END arch;