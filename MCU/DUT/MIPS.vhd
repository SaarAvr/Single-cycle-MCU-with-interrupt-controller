				-- Top Level Structural Model for MIPS Processor Core
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY MIPS IS
	GENERIC ( model_sim : BOOLEAN ;
			  n 		: INTEGER);       -- n=8 modelsim     n=10 Quartus
	PORT( reset, clock, ena				: IN 	STD_LOGIC; 
		BUS_INT_EN_MIPS					: IN STD_LOGIC;
		INTR							: IN STD_LOGIC;
		INTA							: OUT STD_LOGIC;
		-- Output important signals to pins for easy display in Simulator
		PC								: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		Address_out						: OUT  STD_LOGIC_VECTOR( 11 DOWNTO 0 );
		data_bus_MIPS_out				: OUT  STD_LOGIC_VECTOR( 31 DOWNTO 0 );
		data_bus_MIPS_in				: IN  STD_LOGIC_VECTOR( 31 DOWNTO 0 );
		ALU_result_out, read_data_1_out, read_data_2_out, write_data_out,	
     	Instruction_out					: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
		Branch_out, Zero_out, Memwrite_out, 
		Regwrite_out,MemoryWrite_IO_out,
		MemoryRead_IO_out,GIE			: OUT 	STD_LOGIC);
END 	MIPS;

ARCHITECTURE structure OF MIPS IS
	
	COMPONENT Ifetch
		GENERIC( n : integer );
		PORT(	SIGNAL Instruction_out	: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        	SIGNAL PC_plus_4_out 	: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        	SIGNAL Add_result 		: IN 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			SIGNAL ALU_Result 		: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			SIGNAL INT_Address 		: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        	SIGNAL BUS_INT_EN		: IN 	STD_LOGIC;
        	SIGNAL Branch 			: IN 	STD_LOGIC;
			SIGNAL Branch_ne		: IN 	STD_LOGIC;
			SIGNAL Jump		        : IN 	STD_LOGIC;
			SIGNAL jump_immediate   : IN 	STD_LOGIC_VECTOR( 25 DOWNTO 0 );
        	SIGNAL Zero 			: IN 	STD_LOGIC;
			SIGNAL Jump_r 			: IN	STD_LOGIC;
			SIGNAL INTR 			: IN	STD_LOGIC;
			SIGNAL INTA 			: IN	STD_LOGIC;
      		SIGNAL PC_out 			: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        	SIGNAL clock, reset,ena : IN 	STD_LOGIC);
	END COMPONENT; 

	COMPONENT Idecode
		PORT(	read_data_1		: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			read_data_2		: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			shift    		: OUT 	STD_LOGIC_VECTOR( 4  DOWNTO 0 );
			jump_immediate  : OUT 	STD_LOGIC_VECTOR( 25 DOWNTO 0 );
			Instruction 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			read_data 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			read_data_SFR 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			ALU_result		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			PC				: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			RegWrite 		: IN 	STD_LOGIC;
			MemtoReg 		: IN 	STD_LOGIC;
			RegDst 			: IN 	STD_LOGIC;
			Jump			: IN 	STD_LOGIC;
			SFR 			: IN	STD_LOGIC;
			ISR 			: IN	STD_LOGIC;
			INTR 			: IN	STD_LOGIC;
			INTA 			: IN	STD_LOGIC;
			PC_plus_4 		: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			Sign_extend 	: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			GIE			 	: OUT 	STD_LOGIC;
			clock,reset		: IN 	STD_LOGIC );
	END COMPONENT;

	COMPONENT control
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
	END COMPONENT;

	COMPONENT  Execute
		PORT(	Read_data_1 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Read_data_2 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			shift    	        : IN 	STD_LOGIC_VECTOR( 4  DOWNTO 0 );
			shift_ctr 			: IN 	STD_LOGIC;
			Sign_Extend 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Function_opcode		: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
			ALUOp 				: IN 	STD_LOGIC_VECTOR( 3 DOWNTO 0 );
			ALUSrc 				: IN 	STD_LOGIC;
			Zero 				: OUT	STD_LOGIC;
			Jump_r 				: OUT	STD_LOGIC;
			SFR 				: OUT	STD_LOGIC;
			ALU_Result 			: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Add_Result 			: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			PC_plus_4 			: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			clock, reset		: IN 	STD_LOGIC );
	END COMPONENT;

	COMPONENT dmemory
		GENERIC( n : integer );
		PORT(	read_data 			: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			read_data_SFR 		: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			address 			: IN 	STD_LOGIC_VECTOR( n-1 DOWNTO 0 );
			write_data 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			MemRead, Memwrite 	: IN 	STD_LOGIC;
			Clock,reset			: IN 	STD_LOGIC );
	END COMPONENT;

					-- declare signals used to connect VHDL components
	SIGNAL PC_plus_4 		: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL read_data_1 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data_2 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL shift    		: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL jump_immediate	: STD_LOGIC_VECTOR( 25 DOWNTO 0 );
	SIGNAL Sign_Extend 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Add_result 		: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL ALU_result 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data_SFR	: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL INT_Address_MCU	: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL ALUSrc 			: STD_LOGIC;
	SIGNAL Branch 			: STD_LOGIC;
	SIGNAL Branch_ne		: STD_LOGIC;
	SIGNAL shift_ctr		: STD_LOGIC;
	SIGNAL Jump				: STD_LOGIC;
	SIGNAL RegDst 			: STD_LOGIC;
	SIGNAL Regwrite 		: STD_LOGIC;
	SIGNAL Zero 			: STD_LOGIC;
	SIGNAL Jump_r			: STD_LOGIC;
	SIGNAL SFR				: STD_LOGIC;
	SIGNAL MemWrite 		: STD_LOGIC;
	SIGNAL MemtoReg 		: STD_LOGIC;
	SIGNAL MemRead 			: STD_LOGIC;
	SIGNAL MemoryWrite_MEM	: STD_LOGIC;
	--SIGNAL GIE				: STD_LOGIC;
	SIGNAL INTR_line		: STD_LOGIC;
	SIGNAL INTA_line		: STD_LOGIC;
	SIGNAL ISR_MIPS			: STD_LOGIC;
	--SIGNAL MemoryWrite_IO	: STD_LOGIC;
	SIGNAL ALUop 			: STD_LOGIC_VECTOR(  3 DOWNTO 0 );
	SIGNAL Instruction		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	--SIGNAL real_address		: STD_LOGIC_VECTOR( m-1 DOWNTO 0 );	
    SIGNAL RealReset 		: STD_LOGIC;
	SIGNAL address_modelSim	: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL address_quartus	: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL PC_MIPS			: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	--SIGNAL address_GPIO		: STD_LOGIC_VECTOR( 11 DOWNTO 0 );
	

	
BEGIN
	INTA <= INTA_line;
	PC <= PC_MIPS;
    INTR_line <= INTR;
	RealReset <= reset;
	--MemoryWrite_IO_out <= MemoryWrite_IO;
	--real_address <= ALU_Result (9 DOWNTO 2)   WHEN m = 8 ELSE
	--			    ALU_Result (9 DOWNTO 2) & "00";
					
	address_modelSim <=	ALU_Result (9 DOWNTO 2) WHEN INTA_line = '0' ELSE data_bus_MIPS_in(9 DOWNTO 2);
	address_quartus  <= ALU_Result (9 DOWNTO 2) & "00" WHEN INTA_line = '0' ELSE data_bus_MIPS_in(9 DOWNTO 2) & "00";
	
	Address_out  	 <= ALU_Result (11 DOWNTO 0) WHEN INTA_line = '0' ELSE X"82E";
	INT_Address_MCU <= data_bus_MIPS_in;
	
	data_bus_MIPS_out<= read_data_2;
	--Address_out  	 <= address_GPIO;
	
	MemoryWrite_MEM <= '1' when ((MemWrite='1') and (ALU_result(11)='0')) ELSE '0';
	MemoryWrite_IO_out <= '1' when ((MemWrite='1') and (ALU_result(11)='1')) ELSE '0';
	
	MemoryRead_IO_out <= '1' when ((MemRead='1') and (ALU_result(11)='1')) ELSE '0';
	
					-- copy important signals to output pins for easy 
					-- display in Simulator
   Instruction_out 	<= Instruction;
   ALU_result_out 	<= ALU_result;
   read_data_1_out 	<= read_data_1;
   read_data_2_out 	<= read_data_2;
   write_data_out  	<= read_data WHEN MemtoReg = '1' ELSE ALU_result;
   Branch_out 		<= Branch OR Branch_ne;
   Zero_out 		<= Zero;
   RegWrite_out 	<= RegWrite;
   MemWrite_out 	<= MemWrite;	
					-- connect the 5 MIPS components   
  IFE : Ifetch
	GENERIC MAP ( n => n )
	PORT MAP (	Instruction_out	=> Instruction,
    	    	PC_plus_4_out 	=> PC_plus_4,
				Add_result 		=> Add_result,
				ALU_Result		=> ALU_Result,
				INT_Address		=> read_data,
				BUS_INT_EN		=> BUS_INT_EN_MIPS,
				Branch 			=> Branch,
				Branch_ne		=> Branch_ne,
				Jump			=> Jump,
				jump_immediate  => jump_immediate,
				Zero 			=> Zero,
				Jump_r			=> Jump_r,
				INTR			=> INTR_line,
				INTA			=> INTA_line,
				PC_out 			=> PC_MIPS,        		
				clock 			=> clock,  
				reset 			=> RealReset,
				ena				=> ena);

   ID : Idecode
   	PORT MAP (	read_data_1 	=> read_data_1,
        		read_data_2 	=> read_data_2,
				shift           => shift,
				jump_immediate  => jump_immediate,
        		Instruction 	=> Instruction,
        		read_data 		=> read_data,
				read_data_SFR   => data_bus_MIPS_in,
				ALU_result 		=> ALU_result,
				PC		 		=> PC_MIPS,
				RegWrite 		=> RegWrite,
				MemtoReg 		=> MemtoReg,
				RegDst 			=> RegDst,
				Jump			=> Jump,
				SFR				=> SFR,
				ISR				=> ISR_MIPS,
				INTR			=> INTR_line,
				INTA			=> INTA_line,
				PC_plus_4		=> PC_plus_4,
				Sign_extend 	=> Sign_extend,
				GIE			 	=> GIE,
        		clock 			=> clock,  
				reset 			=> RealReset );


   CTL:   control
	PORT MAP ( 	Opcode 			=> Instruction( 31 DOWNTO 26 ),
				RS 				=> Instruction( 25 DOWNTO 21 ),
				RegDst 			=> RegDst,
				ALUSrc 			=> ALUSrc,
				MemtoReg 		=> MemtoReg,
				RegWrite 		=> RegWrite,
				MemRead 		=> MemRead,
				MemWrite 		=> MemWrite,
				Branch 			=> Branch,
				Branch_ne		=> Branch_ne,
				shift_ctr		=> shift_ctr,
				Jump		    => Jump,
				ALUop 			=> ALUop,
				ISR			    => ISR_MIPS,
				INTA		    => INTA_line,
				INTR 			=> INTR_line,
				Jump_r 			=> Jump_r,
                clock 			=> clock,
				reset 			=> RealReset );

   EXE:  Execute
   	PORT MAP (	Read_data_1 	=> read_data_1,
             	Read_data_2 	=> read_data_2,
				shift           => shift,
				shift_ctr		=> shift_ctr,
				Sign_extend 	=> Sign_extend,
                Function_opcode	=> Instruction( 5 DOWNTO 0 ),
				ALUOp 			=> ALUop,
				ALUSrc 			=> ALUSrc,
				Zero 			=> Zero,
				Jump_r			=> Jump_r,
				SFR				=> SFR,
                ALU_Result		=> ALU_Result,
				Add_Result 		=> Add_Result,
				PC_plus_4		=> PC_plus_4,
                Clock			=> clock,
				Reset			=> RealReset );

   MEM_model: IF model_sim GENERATE
	MEM_model_real: dmemory
	GENERIC MAP ( n => n )
	PORT MAP (	read_data 		=> read_data,
				read_data_SFR   => read_data_SFR,
				address 		=> address_modelSim,--jump memory address by 4
				write_data 		=> read_data_2,
				MemRead 		=> MemRead, 
				Memwrite 		=> MemoryWrite_MEM,
                clock 			=> clock,  
				reset 			=> RealReset );
	END GENERATE;

   MEM_Quartus: IF NOT(model_sim) GENERATE
	MEM_Quartus_real: dmemory
	GENERIC MAP ( n => n )
	PORT MAP (	read_data 		=> read_data,
				read_data_SFR   => read_data_SFR,
				address 		=> address_quartus,--jump memory address by 4
				write_data 		=> read_data_2,
				MemRead 		=> MemRead, 
				Memwrite 		=> MemoryWrite_MEM,
                clock 			=> clock,  
				reset 			=> RealReset );
		END GENERATE;

END structure;
















