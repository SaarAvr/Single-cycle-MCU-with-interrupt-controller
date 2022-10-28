LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY Interrupt_controller IS
   PORT( 	
	Address				: IN 	STD_LOGIC_VECTOR(11 DOWNTO 0 );
	MemoryRead_IO_in	: IN	STD_LOGIC;
	MemoryWrite_IO_in	: IN	STD_LOGIC;
	Data				: OUT 	STD_LOGIC_VECTOR(31 DOWNTO 0 );
	Data_in				: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0 );
	BUS_INT_EN			: OUT 	STD_LOGIC;
	INTR				: OUT 	STD_LOGIC;
	INTA				: IN 	STD_LOGIC;
	GIE					: IN 	STD_LOGIC;
	irq0, irq1, irq2	: IN 	STD_LOGIC;
	irq3, irq4, irq5	: IN 	STD_LOGIC;
	CS_in				: IN 	STD_LOGIC;
	clock, reset		: IN 	STD_LOGIC );
END Interrupt_controller;

ARCHITECTURE arch OF Interrupt_controller IS

	SIGNAL	IFG,IFG_reg,IE,TYPEx,TYPEx_reg		: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL	INT_flag			: STD_LOGIC;
	SIGNAL	INTR_sig			: STD_LOGIC;
	SIGNAL	BUS_INT_EN_flag		: STD_LOGIC;
	--variable Data_var : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
BEGIN 

	--INTR <= INT_flag WHEN GIE = '1' ELSE '0';
	INTR <= INTR_sig;
	
	---
	PROCESS(clock,reset,INTA)
	variable type_var : STD_LOGIC_VECTOR( 7 DOWNTO 0 ) := (others => '0');
	
		BEGIN	
		IF (reset = '1') THEN
			IFG_reg  <= (others => '0');
			--Data 	 <= (others => '0');
			IE		 <= (others => '0');
			TYPEx	 <= (others => '0');
			--BUS_INT_EN 		<= '0';
			--BUS_INT_EN_flag <= '0';
		ELSIF (clock'EVENT and clock='1') THEN
			IF (GIE = '1') THEN
				INTR_sig <= INT_flag;
			ELSE
				INTR_sig <= '0';
			END IF;
			--INTR <= INT_flag WHEN GIE = '1' ELSE '0';
			
			IF (INT_flag = '1') THEN
				IFG_reg(2 downto 0) <= IFG(2 downto 0);	
				IFG_reg(5 downto 3) <= IFG_reg(5 downto 3) or IFG(5 downto 3);	
			END IF;
			

			IF (MemoryWrite_IO_in = '1' and CS_in = '1') THEN
				IF (Address = X"82C") THEN
					IE <= Data_in(7 downto 0);
				ELSIF (Address = X"82D") THEN
					IFG_reg <= Data_in(7 downto 0);
				END IF;
			END IF;
		END IF;
	END PROCESS;

	PROCESS (reset,irq0, irq1, irq2, irq3, irq4,irq5,INTR_sig,INT_flag)
	BEGIN
		IF (reset = '1') THEN
			IFG 	 <= (others => '0');
			INT_flag <= '0';
			
		ELSIF (INTR_sig ='1') THEN 
				INT_flag <= '0';
				
		ELSE
			IF (irq0 = '1' AND IE(0) = '1')  THEN --RXIE
				IFG(0) <= '1';
				INT_flag <= '1' ;
			ELSE
				IFG(0) <= '0';
			END IF; 
			
			IF (irq1 = '1' AND IE(1) = '1')  THEN --TXIE
				IFG(1) <= '1';
				INT_flag <= '1' ;
			ELSE
				IFG(1) <= '0';	
			END IF; 
			
			IF (irq2 = '1' AND IE(2) = '1')  THEN --BTIE
				IFG(2) <= '1';
				INT_flag <= '1' ;
			ELSE
				IFG(2) <= '0';	
			END IF; 

			IF (irq3 = '1' AND IE(3) = '1')  THEN --Key1
				IFG(3) <= '1'; 
				INT_flag <= '1' ;
			ELSE
				IFG(3) <= '0';	
			END IF; 

			IF (irq4 = '1' AND IE(4) = '1') THEN --Key2
				IFG(4) <= '1';
				INT_flag <= '1' ;
			ELSE
				IFG(4) <= '0';	
			END IF;

			IF (irq5 = '1' AND IE(5) = '1')  THEN --Key3
				IFG(5) <= '1';   
				INT_flag <= '1' ;
			ELSE
				IFG(5) <= '0';	
			END IF;
		END IF;
	END PROCESS;



	PROCESS (all)
	BEGIN
		IF (reset = '1') THEN
			Data <= (others => '0');
			TYPEx_reg <= (others => '0');
			BUS_INT_EN 		<= '0';
			BUS_INT_EN_flag <= '0';
		ELSE
			IF (INTA = '1') THEN
				IF (IFG_reg(0) = '1') THEN
					TYPEx_reg <= X"08";
				ELSIF (IFG_reg(1) = '1') THEN
					TYPEx_reg <= X"0C";					
				ELSIF (IFG_reg(2) = '1') THEN
					TYPEx_reg <= X"10";
				ELSIF (IFG_reg(3) = '1') THEN
					TYPEx_reg <= X"14";					
				ELSIF (IFG_reg(4) = '1') THEN
					TYPEx_reg <= X"18";
				ELSIF (IFG_reg(5) = '1') THEN
					TYPEx_reg <= X"1C";
				END IF;
			END IF;
			
			IF (INTA = '1') THEN
				Data <= X"000000" & TYPEx_reg;		
			ELSIF (MemoryRead_IO_in = '1' and CS_in = '1') THEN
				IF (Address = X"82C") THEN
					Data <= X"000000" & IE;
				ELSIF (Address = X"82D") THEN
					Data <= X"000000" & IFG_reg;
				ELSIF (Address = X"82E") THEN
					Data <= X"000000" & TYPEx_reg;					
				END IF;
				BUS_INT_EN		<= '1';
				BUS_INT_EN_flag <= '1';
			ELSE
				Data <= (others => '0');
				BUS_INT_EN <= '0';
			END IF;
		END IF;
	END PROCESS;





































END arch;