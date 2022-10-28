-- Ifetch module (provides the PC and instruction 
--memory for the MIPS computer)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY Ifetch IS
	GENERIC (n : INTEGER);       -- n=8 modelsim     n=10 Quartus
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
END Ifetch;

ARCHITECTURE behavior OF Ifetch IS
	SIGNAL PC, PC_plus_4 	 : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL next_PC			 : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL Mem_Addr 		 : STD_LOGIC_VECTOR( n-1 DOWNTO 0 );
	SIGNAL Instruction 		 : STD_LOGIC_VECTOR( 31 DOWNTO 0 );

BEGIN
						--ROM for Instruction Memory
inst_memory: altsyncram
	
	GENERIC MAP (
		operation_mode => "ROM",
		width_a => 32,
		widthad_a => n,
		lpm_type => "altsyncram",
		outdata_reg_a => "UNREGISTERED",
		init_file => "C:\Users\eldar\Desktop\University\Coding\VHDL\ModelSim\LAB5\ASM\program.hex",
		intended_device_family => "Cyclone"
	)
	PORT MAP (
		clock0     => clock,
		address_a 	=> Mem_Addr, 
		q_a 			=> Instruction );
		
		
		
		Instruction_out <= Instruction WHEN (INTR = '0' and INTA = '0') ELSE (others => '0');
					-- Instructions always start on word address - not byte
		PC(1 DOWNTO 0) <= "00";
					-- copy output signals - allows read inside module
		PC_out 			<= PC;
		PC_plus_4_out 	<= PC_plus_4;
						-- send address to inst. memory address register
		Mem_Addr <= Next_PC WHEN n = 8 ELSE
					Next_PC & "00" ;
						-- Adder to increment PC by 4        
      	PC_plus_4( 9 DOWNTO 2 )  <= PC( 9 DOWNTO 2 ) + 1;
       	PC_plus_4( 1 DOWNTO 0 )  <= "00";
						-- Mux to select Branch Address or PC + 4        
		Next_PC  <= X"00" WHEN Reset = '1' ELSE
					Add_result  WHEN (( ( Branch = '1' ) AND ( Zero = '1' ) ) OR ( ( Branch_ne = '1' ) AND ( Zero = '0' ) )) ELSE 
					jump_immediate( 7 DOWNTO 0 ) WHEN Jump = '1' ELSE
					ALU_Result( 9 DOWNTO 2 ) WHEN Jump_r = '1' ELSE
					INT_Address(9 downto 2) WHEN INTA='1' ELSE
					PC_plus_4( 9 DOWNTO 2 );
	PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
			IF reset = '1' THEN
				   PC( 9 DOWNTO 2) <= "00000000" ; 
			ELSE 
				  if (ena = '1') THEN
				   PC( 9 DOWNTO 2 ) <= next_PC;
				  end if; 
			END IF;
	END PROCESS;
END behavior;


