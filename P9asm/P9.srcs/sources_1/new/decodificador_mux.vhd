library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decodificador_mux is
    Port ( OP_CODE : in STD_LOGIC_VECTOR (3 downto 0);
           LED : inout STD_LOGIC_VECTOR (6 downto 0);
           SEL : in STD_LOGIC;
           outMux : out STD_LOGIC_VECTOR (6 downto 0));
end decodificador_mux;

architecture Behavioral of decodificador_mux is

begin
    with OP_CODE select
    LED <= "0000110" when "0001",
           "1011011" when "0010",
           "1001111" when "0011",
           "1100110" when "0100",
           "1101101" when "0101",
           "1111101" when "0110",
           "0000111" when "0111",
           "1111111" when "1000",
           "1101111" when "1001",
           "1111110" when others;
    
    mux: process (OP_CODE, LED, SEL)
    begin
        if sel = '1' then
            outMux <= LED;
        else
            outMux <= "0000000";
        end if;
    end process;

end Behavioral;
