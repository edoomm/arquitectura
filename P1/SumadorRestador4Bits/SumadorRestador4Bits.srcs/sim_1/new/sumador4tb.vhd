
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador4tb is
--  Port ( );
end sumador4tb;

architecture Behavioral of sumador4tb is

component sumador4 is
    Port ( a, b : in STD_LOGIC_VECTOR (3 downto 0);
           s : out STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           cout : out STD_LOGIC);
end component;

signal a, b, s : STD_LOGIC_VECTOR (3 downto 0);
signal cin, cout : STD_LOGIC;

begin

e : sumador4 port map (
    a => a,
    b => b,
    cin => cin,
    cout => cout,
    s => s
);

process
begin

    -- 6 + 7
    a <= "0110";
    b <= "0111";
    cin <= '0';
    wait for 20 ns;
    
    a <= "0110";
    b <= "1001";
    cin <= '0';
    wait for 20 ns;
    
    a <= "0100";
    b <= "1001";
    cin <= '0';
    wait for 20 ns;
    
    a <= "1111";
    b <= "0001";
    cin <= '1';
    wait for 20 ns;
    
    a <= "0011";
    b <= "1010";
    cin <= '0';
    wait for 20 ns;
    
    a <= "1100";
    b <= "0101";
    cin <= '1';
    wait for 20 ns;
    
    a <= "1110";
    b <= "1000";
    cin <= '1';
    wait for 20 ns;
    
    a <= "1010";
    b <= "0110";
    cin <= '1';
    wait for 20 ns;
    
    a <= "1001";
    b <= "0100";
    cin <= '1';
    wait;

end process;

end Behavioral;
