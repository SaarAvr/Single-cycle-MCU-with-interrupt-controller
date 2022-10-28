		-- control module (implements MIPS control unit)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY control IS	
 PORT( 	Opcode 		: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
		RS	 		: IN 	STD_LOGIC_VECTOR( 4 DOWNTO 0 );
		RegDst 		: OUT 	STD_LOGIC;
		ALUSrc 		: OUT 	STD_LOGIC;
		MemtoReg 	: OUT 	STD_LOGIC;
		RegWrite 	: OUT 	STD_LOGIC;
		MemRead 	: OUT 	STD_LOGIC;
		MemWrite 	: OUT 	STD_LOGIC;
		Branch 		: OUT 	STD_LOGIC;
		Branch_ne	: OUT 	STD_LOGIC;
		shift_ctr	: OUT 	STD_LOGIC;
		Jump		: OUT 	STD_LOGIC;
		ALUop 		: OUT 	STD_LOGIC_VECTOR( 3 DOWNTO 0 );
		ISR			: OUT 	STD_LOGIC;
		INTA		: OUT 	STD_LOGIC;
		INTR		: IN	STD_LOGIC;	
		Jump_r		: IN	STD_LOGIC;	
		clock, reset: IN 	STD_LOGIC );

END control;

ARCHITECTURE behavior OF control IS

	SIGNAL  R_format, Lw, Sw, Beq, addi, andi, ori, xori, slti, mul, lui, bne, jump_com, jump_al_com,EOI: STD_LOGIC;
	SIGNAL tmp_INTA  :	STD_LOGIC := '0'; 
	--SIGNAL INTA_del  :	STD_LOGIC := '0'; 

BEGIN           
				-- Code to generate control signals using opcode bits
	R_format 	<=  '1'  WHEN  Opcode = "000000"  ELSE '0';
	Lw          <=  '1'  WHEN  Opcode = "100011"  ELSE '0';
 	Sw          <=  '1'  WHEN  Opcode = "101011"  ELSE '0';
   	Beq         <=  '1'  WHEN  Opcode = "000100"  ELSE '0';
	addi        <=  '1'  WHEN  Opcode = "001000"  ELSE '0';
	andi        <=  '1'  WHEN  Opcode = "001100"  ELSE '0';
	ori         <=  '1'  WHEN  Opcode = "001101"  ELSE '0';
	slti        <=  '1'  WHEN  Opcode = "001010"  ELSE '0';
	xori        <=  '1'  WHEN  Opcode = "001110"  ELSE '0';
	mul         <=  '1'  WHEN  Opcode = "011100"  ELSE '0';
	lui         <=  '1'  WHEN  Opcode = "001111"  ELSE '0';
	bne         <=  '1'  WHEN  Opcode = "000101"  ELSE '0';
	jump_com	<=  '1'  WHEN  Opcode = "000010"  ELSE '0';
	jump_al_com	<=  '1'  WHEN  Opcode = "000011"  ELSE '0';
	

  	RegDst    	<=  R_format OR mul;
 	ALUSrc  	<=  Lw OR Sw OR addi OR andi OR ori OR xori OR slti OR lui;
	MemtoReg 	<=  Lw;
  	RegWrite 	<=  R_format OR mul OR Lw OR addi OR andi OR ori OR xori OR slti OR lui OR jump_al_com;
  	MemRead 	<=  Lw;
   	MemWrite 	<=  Sw;
	Branch_ne   <=  bne;
 	Branch      <=  Beq;
	shift_ctr	<=  R_format;
	Jump		<=  jump_com OR jump_al_com;
	ALUOp( 3 ) 	<=  addi OR andi OR ori OR xori OR slti OR mul OR lui;
	ALUOp( 2 ) 	<=  xori OR slti OR mul;
	ALUOp( 1 ) 	<=  R_format OR addi OR slti OR lui;
	ALUOp( 0 ) 	<=  Beq OR bne OR ori OR slti OR mul OR lui; 
	
	EOI			<=  '1' when (Jump_r='1') and (RS = "11011") else '0';
	INTA		<= tmp_INTA;
	
	PROCESS (clock)
	BEGIN
		IF (reset = '1') THEN
			tmp_INTA <= '0';
			ISR		 <= '0';
		ELSIF (clock'EVENT and clock='1') THEN
				if (INTR='1') then  
					tmp_INTA <= '1';
					ISR 	 <= '1';					
				ELSif (tmp_INTA='1') then 
					tmp_INTA <= '0';
				ELSif (EOI='1') then 
					tmp_INTA <= '0';
					ISR		 <= '0';
				ELSE 
					tmp_INTA <= '0';
				END IF;
		END IF;
	END PROCESS;
	
	
	
	
	
	
	
	
	
   END behavior;

