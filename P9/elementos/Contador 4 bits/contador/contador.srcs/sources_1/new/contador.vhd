library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity contador is
    Port ( clk, clr, LB, EB : in STD_LOGIC;
           QB : out STD_LOGIC_VECTOR (3 downto 0));
end contador;

architecture Behavioral of contador is
    constant db : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
    process (clr, clk)
    variable auxQB : STD_LOGIC_VECTOR(3 downto 0);
    begin
        if (clr = '1') then
            auxQB := "0000";
        elsif (rising_edge(clk)) then
            if (LB = '0' and EB = '0') then
                auxQB := auxQB;
            elsif (LB = '1' and EB = '0') then
                auxQB := DB;
            elsif (LB = '0' and EB = '1') then
                auxQB := auxQB + 1;
            end if;
        end if;
        QB <= auxQB;
    end process;
end Behavioral;
