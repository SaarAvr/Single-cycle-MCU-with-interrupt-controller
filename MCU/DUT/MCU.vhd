-- Top Level Structural Model for the MCU 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY MCU IS
	PORT( clock				: IN 	STD_LOGIC; 
		Switches			: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		Keys				: IN 	STD_LOGIC_VECTOR( 3 DOWNTO 0 );
		LEDGreen			: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		LEDRed				: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		HEX0				: OUT 	STD_LOGIC_VECTOR(6 downto 0);
		HEX1				: OUT 	STD_LOGIC_VECTOR(6 downto 0);
		HEX2				: OUT 	STD_LOGIC_VECTOR(6 downto 0);
		HEX3				: OUT 	STD_LOGIC_VECTOR(6 downto 0));
END 	MCU;

ARCHITECTURE MCU_Arch OF MCU IS

	----------------- Model sim or Quartus ----------------
	Constant model_sim   : BOOLEAN := false;
	Constant m			 : INTEGER := 10;  -- n=8 modelsim     n=10 Quartus




component MIPS IS
	GENERIC ( model_sim : BOOLEAN ; n : INTEGER);       -- n=8 modelsim     n=10 Quartus
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
END 	component;

	component BidirPin is
	generic( width: integer:= 32 );
	port(   Dout: 	in 		std_logic_vector(width-1 downto 0);
			en:		in 		std_logic;
			Din:	out		std_logic_vector(width-1 downto 0);
			IOpin: 	inout 	std_logic_vector(width-1 downto 0)
	);
	END component ;


	component GPIO IS
	PORT( clock				: IN STD_LOGIC;
		reset				: IN STD_LOGIC;
		Address 			: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		Data_bus_in_GP		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		Data_bus_out_GP		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		MemoryWrite_IO_in	: IN STD_LOGIC; 
		MemoryRead_IO_in	: IN STD_LOGIC;
		SW_GPIO_in			: IN STD_LOGIC_VECTOR(7 downto 0);
		Keys_GPIO_in		: IN STD_LOGIC_VECTOR(3 downto 0);
		LEDGreen_GP_out		: OUT STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		LEDRed_GP_out		: OUT STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		HEX0_GP_out			: OUT STD_LOGIC_VECTOR(6 downto 0);
		HEX1_GP_out			: OUT STD_LOGIC_VECTOR(6 downto 0);
		HEX2_GP_out			: OUT STD_LOGIC_VECTOR(6 downto 0);
		HEX3_GP_out			: OUT STD_LOGIC_VECTOR(6 downto 0);
		CS_out				: OUT STD_LOGIC_VECTOR(15 downto 0)
		);
	END 	component;

	component Interrupt_controller IS
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
	END component;
	
	component Basic_Timer IS
	PORT(
		clock 					: IN	STD_LOGIC;
		reset 					: IN	STD_LOGIC;
		CS						: IN	STD_LOGIC;
		Reg_sel					: IN	STD_LOGIC;
		WR_en					: IN	STD_LOGIC;
		Data_in					: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0 );
		BTIFG					: OUT 	STD_LOGIC);
	END component;


	SIGNAL BidirPin_bus 	:STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL data_bus_MIPS_in :STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL data_bus_MIPS_out:STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL Data_bus_in_GP 	:STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL Data_bus_out_GP 	:STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL Data_bus_in_INT 	:STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL Data_bus_out_INT	:STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL Data_bus_in_BT	:STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL Data_bus_out_BT	:STD_LOGIC_VECTOR(31 downto 0);
	
	SIGNAL Address_MCU	 	:STD_LOGIC_VECTOR(11 downto 0);
	SIGNAL SW_GPIO_MCU	 	:STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL Keys_GPIO_MCU 	:STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL CS_out_MCU	 	:STD_LOGIC_VECTOR(15 downto 0);
	
	SIGNAL reset_real	 	:STD_LOGIC;
	SIGNAL MemoryWrite_IO_MCU:STD_LOGIC;
	SIGNAL MemoryRead_IO_MCU :STD_LOGIC;
	SIGNAL MemoryRead_GPIO :STD_LOGIC;
--SIGNAL INT_CS			 :STD_LOGIC;
	SIGNAL INTR				 :STD_LOGIC;
	SIGNAL INTA				 :STD_LOGIC;
	SIGNAL GIE				 :STD_LOGIC;
	SIGNAL CS_in_MCU		 :STD_LOGIC;
	SIGNAL BUS_INT_WR_MCU	 :STD_LOGIC;
	SIGNAL BUS_INT_EN_MCU	 :STD_LOGIC;
	SIGNAL BUS_BT_EN_MCU	 :STD_LOGIC;
	SIGNAL RX_q				 :STD_LOGIC;
	SIGNAL TX_q				 :STD_LOGIC;
	SIGNAL BT_Reg_sel		 :STD_LOGIC;
	SIGNAL CS_BT_MCU		 :STD_LOGIC;
	SIGNAL BTIFG_MCU		 :STD_LOGIC;

BEGIN
	-----------------------reset proccess---------------------------
	PROCESS (clock)BEGIN
        if(rising_edge(clock)) then
            reset_real <= not Keys(0); 
        end if;   
    END PROCESS;
	

	MIPS_bus :  BidirPin generic map (32) port map(data_bus_MIPS_out,MemoryWrite_IO_MCU,data_bus_MIPS_in,BidirPin_bus);
	GPIO_bus :  BidirPin generic map (32) port map(Data_bus_out_GP,MemoryRead_GPIO,Data_bus_in_GP,BidirPin_bus);
	INTR_bus :  BidirPin generic map (32) port map(Data_bus_out_INT,BUS_INT_EN_MCU,Data_bus_in_INT,BidirPin_bus);
	BTIM_bus :  BidirPin generic map (32) port map(Data_bus_out_BT,BUS_BT_EN_MCU,Data_bus_in_BT,BidirPin_bus);
	
	SW_GPIO_MCU		<= Switches(7 downto 0);
	Keys_GPIO_MCU	<= Keys(3 downto 0);
	CS_in_MCU <= '1' WHEN CS_out_MCU(15) = '1' or CS_out_MCU(14) = '1' or CS_out_MCU(13) = '1' ELSE '0';
	BUS_INT_EN_MCU <= '1' WHEN BUS_INT_WR_MCU = '1' or INTA = '1' ELSE '0';
	MemoryRead_GPIO <= '1' WHEN MemoryRead_IO_MCU = '1' and BUS_INT_WR_MCU = '0' ELSE '0';
	BUS_BT_EN_MCU <= '1' WHEN MemoryRead_IO_MCU = '1' and (CS_out_MCU(13) = '1' or CS_out_MCU(12) = '1') ELSE '0';
	
	BT_Reg_sel <= '1' WHEN CS_out_MCU(12) = '1' ELSE '0';
	CS_BT_MCU <= '1' WHEN CS_out_MCU(12) = '1' or CS_out_MCU(11) = '1' ELSE '0';
	
	RX_q <= '0';
	TX_q <= '0';
	
	CPU : MIPS
	GENERIC MAP (	model_sim => model_sim,
					n => m )
	PORT MAP (	reset 				=> reset_real,
				clock 				=> clock,
				ena 				=> Switches(9),
				BUS_INT_EN_MIPS		=> BUS_INT_WR_MCU,
				INTR 				=> INTR,
				INTA 				=> INTA,
				Address_out			=> Address_MCU,
				data_bus_MIPS_out 	=> data_bus_MIPS_out,
				data_bus_MIPS_in	=> data_bus_MIPS_in,
				MemoryWrite_IO_out  => MemoryWrite_IO_MCU,
				MemoryRead_IO_out   => MemoryRead_IO_MCU,
				GIE				    => GIE);

	Periphery : GPIO
	PORT MAP (	clock 				=> clock,
				reset 				=> reset_real,
				Address 			=> Address_MCU,
				Data_bus_in_GP 		=> Data_bus_in_GP,
				Data_bus_out_GP		=> Data_bus_out_GP,
				MemoryWrite_IO_in 	=> MemoryWrite_IO_MCU,
				MemoryRead_IO_in	=> MemoryRead_IO_MCU,
				SW_GPIO_in			=> SW_GPIO_MCU,
				Keys_GPIO_in		=> Keys_GPIO_MCU,
				LEDGreen_GP_out  	=> LEDGreen,
				LEDRed_GP_out  		=> LEDRed,
				HEX0_GP_out  		=> HEX0,
				HEX1_GP_out  		=> HEX1,
				HEX2_GP_out  		=> HEX2,
				HEX3_GP_out   		=> HEX3,
				CS_out				=> CS_out_MCU);

	interrupt : Interrupt_controller
	PORT MAP( 	Address				=> Address_MCU,
				MemoryRead_IO_in	=> MemoryRead_IO_MCU,
				MemoryWrite_IO_in	=> MemoryWrite_IO_MCU,
				Data				=> Data_bus_out_INT,
				Data_in				=> Data_bus_in_INT,
				BUS_INT_EN			=> BUS_INT_WR_MCU,
				INTR				=> INTR,
				INTA				=> INTA,
				GIE					=> GIE,
				irq0				=> RX_q,
				irq1				=> TX_q,
				irq2				=> BTIFG_MCU,
				irq3				=> not Keys(1),
				irq4				=> not Keys(2),
				irq5				=> not Keys(3),
				CS_in				=> CS_in_MCU,
				clock				=> clock,
				reset				=> reset_real);									
				
	Timer_int : Basic_Timer
	PORT MAP( 	clock				=> clock,
				reset				=> reset_real,
				CS					=> CS_BT_MCU,
				Reg_sel				=> BT_Reg_sel,
				WR_en				=> MemoryWrite_IO_MCU,
				Data_in				=> Data_bus_in_BT,
				BTIFG				=> BTIFG_MCU);

END MCU_Arch;