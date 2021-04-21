----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2021 10:38:40
-- Design Name: 
-- Module Name: fileReg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fileReg is
    Port ( writeReg : in STD_LOGIC_VECTOR (3 downto 0);
           writeData : in STD_LOGIC_VECTOR (15 downto 0);
           readReg1 : in STD_LOGIC_VECTOR (3 downto 0);
           readReg2 : in STD_LOGIC_VECTOR (3 downto 0);
           shamt : in STD_LOGIC_VECTOR (3 downto 0);
           clk, clr, wr, she, dir : in STD_LOGIC;
           readData1 : out STD_LOGIC_VECTOR (15 downto 0);
           readData2 : out STD_LOGIC_VECTOR (15 downto 0));
end fileReg;

architecture Behavioral of fileReg is
-- organizaci�n = n�mero palabras * tama�o palabra = 2^4 palabras * 16 bits
type matriz is array (0 to 15) of std_logic_vector(15 downto 0);
signal registros:matriz;
begin
process (clk, clr)
begin
    --reset
    if (clr = '1')
        then for i in 0 to 15 loop
            registros(i) <= "0000000000000000";
        end loop;
    --secuenciales
    elsif (rising_edge(clk)) then
        --retenci�n
        if (wr = '0') and (she = '0') and (dir = '0') then
            registros <= registros;
        end if;
        --carga
        if (wr = '1') and (she = '0') then
            registros(conv_integer(writeReg)) <= writeData;
        end if;
        --corrimiento derecha
        if (wr = '1') and (she = '1') and (dir = '0') then
            registros(conv_integer(writeReg)) <= to_stdlogicvector(to_bitvector(registros(conv_integer(dir))) srl (conv_integer(shamt)));
        end if;
        --corrimiiento izquierda
        if (wr = '1') and (she = '1') and (dir = '1')then
           registros(conv_integer(writeReg)) <= to_stdlogicvector(to_bitvector(registros(conv_integer(dir))) sll (conv_integer(shamt)));
        end if;
    end if;
end process;
--as�ncronas
--lectura
readData1 <= registros(conv_integer(readReg1));
readData2 <= registros(conv_integer(readReg2));
end Behavioral;
