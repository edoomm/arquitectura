library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use ieee.numeric_std.all; 

entity memoDatos is
    --Parametrizacion 
    generic(
    p: integer :=16;
    d : integer := 16
    );
    -- Debemos definir el tamaño de la memoria : tamaño de palabra x numero de palabra
    Port ( dirW, dirR : in STD_LOGIC_VECTOR (p-1 downto 0);
           dataIn : in STD_LOGIC_VECTOR (d-1 downto 0);
           dataOut :out STD_LOGIC_VECTOR (d-1 downto 0);
           wd : in STD_LOGIC;
           clk : in STD_LOGIC          
     );
end memoDatos;

architecture Behavioral of memoDatos is
-- Organizacion = numero de palabras x tamaño de palabra
type memory is array (0 to 2**p-1) of std_logic_vector(d-1 downto 0);
signal datamemory:memory;

begin

    process (clk)
    begin 
        if (rising_edge(clk)) then
        -- Escritura : mem(dir) = datoIn
            if (wd = '1') then
                datamemory(conv_integer(dirW)) <= dataIn;
            end if;
        end if;
    end process;
dataOut <= datamemory( conv_integer( dirR) );

end Behavioral;
