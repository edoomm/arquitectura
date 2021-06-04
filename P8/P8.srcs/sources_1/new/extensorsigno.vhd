library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity extensorsigno is
    Port (
        ENTRADA : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		SALIDA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
     );
end extensorsigno;

architecture Behavioral of extensorsigno is

begin

    SALIDA <= ENTRADA(11) & ENTRADA(11) &ENTRADA(11) & ENTRADA(11) & ENTRADA;

end Behavioral;
