--  Execute module (implements the data ALU and Branch Address Adder  
--  for the MIPS computer)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.Numeric_std.all;

ENTITY  Execute IS
	PORT(	Read_data_1 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Read_data_2 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			shift    	    : IN 	STD_LOGIC_VECTOR( 4  DOWNTO 0 );
			shift_ctr		: IN 	STD_LOGIC;
			Sign_extend 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Function_opcode : IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
			ALUOp 			: IN 	STD_LOGIC_VECTOR( 3 DOWNTO 0 );
			ALUSrc 			: IN 	STD_LOGIC;
			Zero 			: OUT	STD_LOGIC;
			Jump_r 			: OUT	STD_LOGIC;
			SFR 			: OUT	STD_LOGIC;
			ALU_Result 		: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Add_Result 		: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			PC_plus_4 		: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			clock, reset	: IN 	STD_LOGIC );
END Execute;

ARCHITECTURE behavior OF Execute IS
SIGNAL Ainput, Binput 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
SIGNAL ALU_output_mux		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
SIGNAL Branch_Add 			: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
SIGNAL ALU_ctl				: STD_LOGIC_VECTOR( 2 DOWNTO 0 );
SIGNAL shift_res    		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
----shifer signals
SIGNAL mux1 				: std_logic_vector(31 DOWNTO 0);     	  --output of first line of muxs in the Barrel-shifter Module
SIGNAL mux2 				: std_logic_vector(31 DOWNTO 0);      	  --output of second line of muxs in the Barrel-shifter Module
SIGNAL mux3 				: std_logic_vector(31 DOWNTO 0);  	   	  --output of third line of muxs in the Barrel-shifter Module
SIGNAL mux4 				: std_logic_vector(31 DOWNTO 0);		  --output of fourth line of muxs in the Barrel-shifter Module
SIGNAL mux5 				: std_logic_vector(31 DOWNTO 0);		  --output of fifth line of muxs in the Barrel-shifter Module
SIGNAL Read_data_right 		: std_logic_vector(31 DOWNTO 0);
SIGNAL input_shifter 		: std_logic_vector(31 DOWNTO 0);
SIGNAL Read_data_right2		: std_logic_vector(31 DOWNTO 0);


BEGIN
	Ainput <= Read_data_1;
						-- ALU input mux
	Binput <= Read_data_2 
		WHEN ( ALUSrc = '0' ) 
  		ELSE  Sign_extend( 31 DOWNTO 0 );
						-- Generate ALU control bits
	ALU_ctl( 0 ) <= ( Function_opcode( 0 ) OR Function_opcode( 3 ) ) AND ALUOp( 1 )
		WHEN ( ALUOp( 3 ) = '0' )
		ELSE  ALUOp( 0 );
	ALU_ctl( 1 ) <= ( NOT Function_opcode( 2 ) ) OR (NOT ALUOp( 1 ) )
		WHEN ( ALUOp( 3 ) = '0' )
		ELSE  ALUOp( 1 );
	ALU_ctl( 2 ) <= ( Function_opcode( 1 ) AND ALUOp( 1 )) OR ALUOp( 0 )
		WHEN ( ALUOp( 3 ) = '0' )
		ELSE  ALUOp( 2 );
						-- Generate Zero Flag
	Zero <= '1' WHEN ( ALU_output_mux( 31 DOWNTO 0 ) = X"00000000"  ) ELSE
			'1' WHEN ((shift_res( 31 DOWNTO 0 ) = X"00000000")AND(shift_ctr = '1'))	ELSE
			'0'; 
	Jump_r <= '1' WHEN ((ALUOp = "0010") AND (Function_opcode = "001000")) ELSE
			  '0'; 
						-- Select ALU output        
	ALU_result <= X"0000000" & B"000"  & ALU_output_mux( 31 ) WHEN  ALU_ctl = "111" ELSE
				  shift_res( 31 DOWNTO 0 ) WHEN ((shift_ctr = '1') AND ((Function_opcode = "000000") OR (Function_opcode = "000010"))) ELSE
				  Sign_extend( 15 DOWNTO 0 ) & X"0000" WHEN ALUOp = "1011" ELSE
				  ALU_output_mux( 31 DOWNTO 0 );
	SFR <= ALU_output_mux(11);			
						-- Adder to compute Branch Address
	Branch_Add	<= PC_plus_4( 9 DOWNTO 2 ) +  Sign_extend( 7 DOWNTO 0 ) ;
	Add_result 	<= Branch_Add( 7 DOWNTO 0 );
	

PROCESS ( ALU_ctl, Ainput, Binput )
	BEGIN
					-- Select ALU operation
 	CASE ALU_ctl IS
						-- ALU performs ALUresult = A_input AND B_input
		WHEN "000" 	=>	ALU_output_mux 	<= Ainput AND Binput; 
						-- ALU performs ALUresult = A_input OR B_input
     	WHEN "001" 	=>	ALU_output_mux 	<= Ainput OR Binput;
						-- ALU performs ALUresult = A_input + B_input
	 	WHEN "010" 	=>	ALU_output_mux 	<= Ainput + Binput;
						-- ALU performs ALUresult = 0 + B_input (move)
 	 	WHEN "011" 	=>	ALU_output_mux <= Ainput + Binput;
						-- ALU performs ALUresult = A_input XOR B_input
 	 	WHEN "100" 	=>	ALU_output_mux 	<= Ainput XOR Binput;
						-- ALU performs ?
 	 	WHEN "101" 	=>	ALU_output_mux 	<= std_logic_vector(to_signed(to_integer(signed(Ainput))*to_integer(signed(Binput)), ALU_output_mux'length));
						-- ALU performs ALUresult = A_input -B_input
 	 	WHEN "110" 	=>	ALU_output_mux 	<= Ainput - Binput;
						-- ALU performs SLT
  	 	WHEN "111" 	=>	ALU_output_mux 	<= Ainput - Binput ;
 	 	WHEN OTHERS	=>	ALU_output_mux 	<= X"00000000" ;
  	END CASE;
  END PROCESS;
  
  --Shifter Module based on Barrel-Shifter 32-bit taken from lab-1
  
	reverse :for i in 0 to 31 generate      			  --if needed, reversed the signal for shift right
		Read_data_right(i) <= Read_data_2(31-i);
	end generate;

 	WITH Function_opcode SELECT
 	input_shifter <= Read_data_2 WHEN "000000",								  --control bit for left/right shifting
 		             Read_data_right WHEN OTHERS;	 
  
  
  ------------------------------first columm------------------------------------------------

	mux1(0) <= ((input_shifter(0) NAND (NOT shift(0))) NAND ('0' NAND shift(0)));                --first mux, input bit = 0
	first : for j in 1 to 31 GENERATE
		mux1(j) <= ((input_shifter(j) NAND (NOT shift(0))) NAND (input_shifter(j-1) NAND shift(0)));        --rest of mux, input of desired signal
	end generate;
	
------------------------------second columm--------------------------------------------------

	rest :for i in 0 to 1 generate
		mux2(i) <= ((mux1(i) NAND (NOT shift(1))) NAND ('0' NAND shift(1)));          --first two muxs, input bit = 0
	end generate;
	
	rest1:for i in 2 to 31 generate
		mux2(i) <= ((mux1(i) NAND (NOT shift(1))) NAND (mux1(i-2) NAND shift(1)));    --rest of mux, input of desired signal
	end generate;
	
------------------------------third columm------------------------------------------------

	rest2 :for i in 0 to 3 generate
		mux3(i) <= ((mux2(i) NAND (NOT shift(2))) NAND ('0' NAND shift(2)));          --first four muxs, input bit = 0
	end generate;
	
	rest3:for i in 4 to 31 generate
		mux3(i) <= ((mux2(i) NAND (NOT shift(2))) NAND (mux2(i-4) NAND shift(2)));    --rest of mux, input of desired signal
	end generate;

----------------------------fourth columm--------------------------------------------------

	rest4 :for i in 0 to 7 generate
		mux4(i) <= ((mux3(i) NAND (NOT shift(3))) NAND ('0' NAND shift(3)));          --first eight muxs, input bit = 0
	end generate;
	
	rest5:for i in 8 to 31 generate
		mux4(i) <= ((mux3(i) NAND (NOT shift(3))) NAND (mux3(i-8) NAND shift(3)));    --rest of mux, input of desired signal
	end generate;

----------------------------fifth columm--------------------------------------------------

	rest6 :for i in 0 to 15 generate
		mux5(i) <= ((mux4(i) NAND (NOT shift(4))) NAND ('0' NAND shift(4)));          --first sixteen muxs, input bit = 0
	end generate;
	
	rest7:for i in 16 to 31 generate
		mux5(i) <= ((mux4(i) NAND (NOT shift(4))) NAND (mux4(i-16) NAND shift(4)));   --rest of mux, input of desired signal
	end generate;
  
  
	revese2 :for i in 0 to 31 generate                                         --reverse back in case of shift right
		Read_data_right2(i) <= mux5(31-i);
	end generate;


  	WITH Function_opcode SELECT                                                           --final output
  	shift_res <= mux5(31 downto 0) WHEN "000000",
  		         Read_data_right2 WHEN OTHERS;   
  
  
  
  
  
  
  
END behavior;

