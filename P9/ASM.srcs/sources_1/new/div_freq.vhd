library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity div_freq is
    generic ( n : integer := (100*(10**6)/2) - 1 );
    port (
        clk, clr    : in std_logic;
        clk_hz      : out std_logic := '0'
    );
end div_freq;

architecture Behavioral of div_freq is

    signal temp  : std_logic := '0';
    signal conta : integer range 0 to n := 0;

begin

    df: process(clk, clr)
    begin
        if clr = '0' then
            temp  <= '0';
            conta <= 0;
        elsif rising_edge(clk) then
            if conta = n then
                temp <= not temp;
                conta <= 0;
            else
                conta <= conta + 1;
            end if;
        end if;
    end process df;

    clk_hz <= temp;

end Behavioral;
