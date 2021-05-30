library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arreglo is
    Port ( clk, clr, LA, EA : in STD_LOGIC;
           DA : in STD_LOGIC_VECTOR (8 downto 0);
           QA : out STD_LOGIC_VECTOR (8 downto 0));
end arreglo;

architecture Behavioral of arreglo is

begin
    
    process(clk, clr)
    variable aux : bit_vector (8 downto 0);
    variable aux_QA : STD_LOGIC_VECTOR (8 downto 0);

    begin
        if(clr = '1') then
            aux_QA := "000000000";
        elsif (rising_edge(clk)) then
            aux := to_bitvector(aux_QA);
            if(LA = '0' and EA ='0') then
                aux_QA := aux_QA;
            elsif(LA = '1' and EA ='0') then
                aux_QA := DA;
            elsif(LA = '0' and EA ='1') then
                aux_QA := to_stdlogicvector(aux srl 1);
            end if;
        end if;
        QA <= aux_QA;
    end process;

end Behavioral;
