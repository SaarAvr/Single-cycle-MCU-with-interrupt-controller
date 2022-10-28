LIBRARY ieee;
USE ieee.std_logic_1164.all;

------------------------------------------------------------
entity HEX_decoder is
	port(	HEX_in : in std_logic_vector(3 downto 0);
			HEX_out : out std_logic_vector(6 downto 0)
	);
end HEX_decoder;
--------------------------------------------------------------------
ARCHITECTURE HEX_Arch OF HEX_decoder IS

begin 
	process(all)
	begin
		case HEX_in is
		when "0000" => HEX_out <= "1000000"; -- "0"     
		when "0001" => HEX_out <= "1111001"; -- "1" 
		when "0010" => HEX_out <= "0100100"; -- "2" 
		when "0011" => HEX_out <= "0110000"; -- "3" 
		when "0100" => HEX_out <= "0011001"; -- "4" 
		when "0101" => HEX_out <= "0010010"; -- "5" 
		when "0110" => HEX_out <= "0000010"; -- "6" 
		when "0111" => HEX_out <= "1111000"; -- "7" 
		when "1000" => HEX_out <= "0000000"; -- "8"     
		when "1001" => HEX_out <= "0011000"; -- "9" 
		when "1010" => HEX_out <= "0001000"; -- a
		when "1011" => HEX_out <= "0000011"; -- b
		when "1100" => HEX_out <= "1000110"; -- C
		when "1101" => HEX_out <= "0100001"; -- d
		when "1110" => HEX_out <= "0000110"; -- E
		when "1111" => HEX_out <= "0001110"; -- F
		when others => HEX_out <= "0000000";
		end case;
	end process;
end HEX_Arch;