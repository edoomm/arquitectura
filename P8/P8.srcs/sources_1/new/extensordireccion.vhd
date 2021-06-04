library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity extensordireccion is
    Port (
	ENTRADA : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
	SALIDA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
end extensordireccion;

architecture Behavioral of extensordireccion is

begin

    SALIDA <= "0000" & ENTRADA;
    
end Behavioral;
