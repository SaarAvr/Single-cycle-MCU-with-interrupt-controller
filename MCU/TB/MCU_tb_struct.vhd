-- VHDL Entity MIPS.MIPS_tb.symbol
--
-- Created:
--          by - kolaman.UNKNOWN (KOLAMAN-PC)
--          at - 09:22:45 17/02/2013
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2011.1 (Build 18)
--


ENTITY MCU_tb IS
-- Declarations

END MCU_tb ;

--
-- VHDL Architecture MIPS.MIPS_tb.struct
--
-- Created:
--          by - kolaman.UNKNOWN (KOLAMAN-PC)
--          at - 09:22:45 17/02/2013
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2011.1 (Build 18)
--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

LIBRARY work;

ARCHITECTURE struct OF MCU_tb IS

   -- Architecture declarations

   -- Internal signal declarations
	SIGNAL clock			: STD_LOGIC;

	SIGNAL Switches			: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL Keys				: STD_LOGIC_VECTOR( 3 DOWNTO 0 );
	SIGNAL LEDGreen			: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL LEDRed			: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL HEX0				: STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL HEX1				: STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL HEX2				: STD_LOGIC_VECTOR(6 downto 0);
	SIGNAL HEX3				: STD_LOGIC_VECTOR(6 downto 0);

   -- Component Declarations
   COMPONENT MCU
	PORT( clock				: IN 	STD_LOGIC; 
		Switches			: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		Keys				: IN 	STD_LOGIC_VECTOR( 3 DOWNTO 0 );
		LEDGreen			: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		LEDRed				: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		HEX0				: OUT 	STD_LOGIC_VECTOR(6 downto 0);
		HEX1				: OUT 	STD_LOGIC_VECTOR(6 downto 0);
		HEX2				: OUT 	STD_LOGIC_VECTOR(6 downto 0);
		HEX3				: OUT 	STD_LOGIC_VECTOR(6 downto 0));

   END COMPONENT;
   COMPONENT MCU_tester
   	PORT( LEDGreen			: IN	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		LEDRed				: IN	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		HEX0				: IN 	STD_LOGIC_VECTOR(6 downto 0);
		HEX1				: IN 	STD_LOGIC_VECTOR(6 downto 0);
		HEX2				: IN 	STD_LOGIC_VECTOR(6 downto 0);
		HEX3				: IN 	STD_LOGIC_VECTOR(6 downto 0);		
		clock				: OUT 	STD_LOGIC; 
		Switches			: OUT 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		Keys				: OUT 	STD_LOGIC_VECTOR( 3 DOWNTO 0 ));
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : MCU USE ENTITY work.MCU;
   FOR ALL : MCU_tester USE ENTITY work.MCU_tester;
   -- pragma synthesis_on


BEGIN
	--geni : process
    --    begin
	--	Switches_signal <= "00000001";
	--	  wait for 1500 ns;
	--	Switches_signal <= "00000010";
	--	wait;
    --  end process;


   -- Instance port mappings.
   U_0 : MCU
      PORT MAP (
         clock		=> clock,
         Switches   => Switches,
         Keys		=> Keys,
         LEDGreen   => LEDGreen,
         LEDRed		=> LEDRed,
         HEX0		=> HEX0,
         HEX1		=> HEX1,
         HEX2		=> HEX2,
         HEX3		=> HEX3
		 );
   U_1 : MCU_tester
      PORT MAP (
         clock		=> clock,
         Switches   => Switches,
         Keys		=> Keys,
         LEDGreen   => LEDGreen,
         LEDRed		=> LEDRed,
         HEX0		=> HEX0,
         HEX1		=> HEX1,
         HEX2		=> HEX2,
         HEX3		=> HEX3
		 );

END struct;
