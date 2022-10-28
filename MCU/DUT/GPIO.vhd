LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY GPIO IS
	PORT( clock				: IN STD_LOGIC;
		reset				: IN STD_LOGIC;
		Address 			: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		Data_bus_in_GP		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		Data_bus_out_GP		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		MemoryWrite_IO_in	: IN STD_LOGIC; 
		MemoryRead_IO_in	: IN STD_LOGIC;
		SW_GPIO_in			: IN STD_LOGIC_VECTOR(7 downto 0);
		Keys_GPIO_in		: IN STD_LOGIC_VECTOR(3 downto 0);
		LEDGreen_GP_out		: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		LEDRed_GP_out		: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		HEX0_GP_out			: OUT 	STD_LOGIC_VECTOR(6 downto 0);
		HEX1_GP_out			: OUT 	STD_LOGIC_VECTOR(6 downto 0);
		HEX2_GP_out			: OUT 	STD_LOGIC_VECTOR(6 downto 0);
		HEX3_GP_out			: OUT 	STD_LOGIC_VECTOR(6 downto 0);
		CS_out				: OUT 	STD_LOGIC_VECTOR(15 downto 0)
		);
END 	GPIO;


ARCHITECTURE GPIO_Arch OF GPIO IS
	
	component HEX_decoder is
		port(	HEX_in : in std_logic_vector(3 downto 0);
				HEX_out : out std_logic_vector(6 downto 0)
		);
	end component;	

	SIGNAL CS 			   : STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL HEX_decoder_out : STD_LOGIC_VECTOR (6 downto 0);

	
	SIGNAL enable_write_LG : STD_LOGIC;
	SIGNAL enable_read_LG : STD_LOGIC;
	SIGNAL enable_write_LR : STD_LOGIC;
	SIGNAL enable_read_LR : STD_LOGIC;
	SIGNAL enable_write_HEX0  : STD_LOGIC;
	SIGNAL enable_read_HEX0 : STD_LOGIC;
	SIGNAL enable_write_HEX1 : STD_LOGIC;
	SIGNAL enable_read_HEX1 : STD_LOGIC;
	SIGNAL enable_write_HEX2 : STD_LOGIC;
	SIGNAL enable_read_HEX2 : STD_LOGIC;
	SIGNAL enable_write_HEX3 : STD_LOGIC;
	SIGNAL enable_read_HEX3 : STD_LOGIC;
	SIGNAL enable_write_SW : STD_LOGIC;
	SIGNAL enable_read_SW : STD_LOGIC;
	SIGNAL enable_write_KEYS : STD_LOGIC;
	SIGNAL enable_read_KEYS : STD_LOGIC;
	SIGNAL enable_write_UCTL : STD_LOGIC;
	SIGNAL enable_read_UCTL : STD_LOGIC;
	SIGNAL enable_write_RXBUF : STD_LOGIC;
	SIGNAL enable_read_RXBUF : STD_LOGIC;
	SIGNAL enable_write_TXBUF : STD_LOGIC;
	SIGNAL enable_read_TXBUF : STD_LOGIC;
	SIGNAL enable_write_BTCTL : STD_LOGIC;
	SIGNAL enable_read_BTCTL : STD_LOGIC;
	SIGNAL enable_write_IE : STD_LOGIC;
	SIGNAL enable_read_IE : STD_LOGIC;
	SIGNAL enable_write_IFG : STD_LOGIC;
	SIGNAL enable_read_IFG : STD_LOGIC;
	SIGNAL enable_write_TYPE : STD_LOGIC;
	SIGNAL enable_read_TYPE : STD_LOGIC;
	
	
	
	
	
	
	
	


BEGIN

	CS <= "0000000000000001" when Address = X"800" else --LEDG : 1
		  "0000000000000010" when Address = X"804" else	--LEDR : 2
		  "0000000000000100" when Address = X"808" else --HEX0 : 3
		  "0000000000001000" when Address = X"80C" else --HEX1 : 4
		  "0000000000010000" when Address = X"810" else --HEX2 : 5
		  "0000000000100000" when Address = X"814" else --HEX3 : 6
		  "0000000001000000" when Address = X"818" else --SWs  : 7
		  "0000000010000000" when Address = X"81C" else --KEYS : 8
		  "0000000100000000" when Address = X"820" else --UCTL : 9
		  "0000001000000000" when Address = X"821" else --RXBUF : 10
		  "0000010000000000" when Address = X"822" else --TXBUF : 11
		  "0000100000000000" when Address = X"824" else --BTCTL : 12
		  "0001000000000000" when Address = X"828" else --BTCNT : 13
		  "0010000000000000" when Address = X"82C" else --IE : 14
		  "0100000000000000" when Address = X"82D" else --IFG : 15
		  "1000000000000000" when Address = X"82E" else --TYPE : 16
		  "0000000000000000";


	enable_write_LG <= '1' when (MemoryWrite_IO_in='1' AND CS(0) = '1') ELSE '0';
	enable_read_LG <= '1' when (MemoryRead_IO_in='1' AND CS(0) = '1') ELSE '0';
	
	enable_write_LR <= '1' when (MemoryWrite_IO_in='1' AND CS(1) = '1') ELSE '0';
	enable_read_LR <= '1' when (MemoryRead_IO_in='1' AND CS(1) = '1') ELSE '0';
	
	enable_write_HEX0 <= '1' when (MemoryWrite_IO_in='1' AND CS(2) = '1') ELSE '0';
	enable_read_HEX0 <= '1' when (MemoryRead_IO_in='1' AND CS(2) = '1') ELSE '0';
	
	enable_write_HEX1 <= '1' when (MemoryWrite_IO_in='1' AND CS(3) = '1') ELSE '0';
	enable_read_HEX1 <= '1' when (MemoryRead_IO_in='1' AND CS(3) = '1') ELSE '0';
	
	enable_write_HEX2 <= '1' when (MemoryWrite_IO_in='1' AND CS(4) = '1') ELSE '0';
	enable_read_HEX2 <= '1' when (MemoryRead_IO_in='1' AND CS(4) = '1') ELSE '0';
	
	enable_write_HEX3 <= '1' when (MemoryWrite_IO_in='1' AND CS(5) = '1') ELSE '0';
	enable_read_HEX3 <= '1' when (MemoryRead_IO_in='1' AND CS(5) = '1') ELSE '0';
	
	enable_write_SW <= '1' when (MemoryWrite_IO_in='1' AND CS(6) = '1') ELSE '0';
	enable_read_SW <= '1' when (MemoryRead_IO_in='1' AND CS(6) = '1') ELSE '0';
	
	enable_write_KEYS <= '1' when (MemoryWrite_IO_in='1' AND CS(7) = '1') ELSE '0';
	enable_read_KEYS <= '1' when (MemoryRead_IO_in='1' AND CS(7) = '1') ELSE '0';
	
	enable_write_UCTL <= '1' when (MemoryWrite_IO_in='1' AND CS(8) = '1') ELSE '0';
	enable_read_UCTL <= '1' when (MemoryRead_IO_in='1' AND CS(8) = '1') ELSE '0';
	
	enable_write_RXBUF <= '1' when (MemoryWrite_IO_in='1' AND CS(9) = '1') ELSE '0';
	enable_read_RXBUF <= '1' when (MemoryRead_IO_in='1' AND CS(9) = '1') ELSE '0';
	
	enable_write_TXBUF <= '1' when (MemoryWrite_IO_in='1' AND CS(10) = '1') ELSE '0';
	enable_read_TXBUF <= '1' when (MemoryRead_IO_in='1' AND CS(10) = '1') ELSE '0';
	
	enable_write_BTCTL <= '1' when (MemoryWrite_IO_in='1' AND CS(11) = '1') ELSE '0';
	enable_read_BTCTL <= '1' when (MemoryRead_IO_in='1' AND CS(11) = '1') ELSE '0';
	
	enable_write_IE <= '1' when (MemoryWrite_IO_in='1' AND CS(13) = '1') ELSE '0';
	enable_read_IE <= '1' when (MemoryRead_IO_in='1' AND CS(13) = '1') ELSE '0';
	
	enable_write_IFG <= '1' when (MemoryWrite_IO_in='1' AND CS(14) = '1') ELSE '0';
	enable_read_IFG <= '1' when (MemoryRead_IO_in='1' AND CS(14) = '1') ELSE '0';
	
	enable_write_TYPE <= '1' when (MemoryWrite_IO_in='1' AND CS(15) = '1') ELSE '0';
	enable_read_TYPE <= '1' when (MemoryRead_IO_in='1' AND CS(15) = '1') ELSE '0';
	
	CS_out <= CS;
	Data_bus_out_GP <= X"000000" & SW_GPIO_in WHEN enable_read_SW = '1' ELSE 
						X"0000000" & Keys_GPIO_in WHEN enable_read_KEYS = '1' ELSE (others => '0');

	PROCESS (clock,reset)
	BEGIN
		IF (reset='1') then 
			LEDGreen_GP_out	<= (others => '0');
			LEDRed_GP_out	<= (others => '0');
			HEX0_GP_out 	<= (others => '0');
			HEX1_GP_out 	<= (others => '0');
			HEX2_GP_out 	<= (others => '0');
			HEX3_GP_out 	<= (others => '0');
		ELSIF (clock'EVENT and clock='1') THEN
			IF (enable_write_LG = '1') THEN
				LEDGreen_GP_out <= Data_bus_in_GP(7 DOWNTO 0);
			End IF;
			IF (enable_write_LR = '1') THEN
				LEDRed_GP_out <= Data_bus_in_GP(7 DOWNTO 0);	
			End IF;		
			IF (enable_write_HEX0 = '1') THEN
				HEX0_GP_out <= HEX_decoder_out;
			End IF;
			IF (enable_write_HEX1 = '1') THEN
				HEX1_GP_out <= HEX_decoder_out;
			End IF;
			IF (enable_write_HEX2 = '1') THEN
				HEX2_GP_out <= HEX_decoder_out;
			End IF;
			IF (enable_write_HEX3 = '1') THEN
				HEX3_GP_out <= HEX_decoder_out;
			End IF;
			
	END IF;
	END PROCESS;






HEX_dec : HEX_decoder
	PORT MAP (	HEX_in 	=> Data_bus_in_GP(3 DOWNTO 0),
    	    	HEX_out => HEX_decoder_out);


END GPIO_Arch;






















