library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador4 is
    Port ( a, b : in STD_LOGIC_VECTOR (3 downto 0);
           s : out STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           cout : out STD_LOGIC);
end sumador4;

architecture Behavioral of sumador4 is

component Sumador1B is
    Port ( a,b,cin : in STD_LOGIC;
           s,cout : out STD_LOGIC);
end component;

Signal acarreo: STD_LOGIC_VECTOR (4 downto 0);
Signal aux: STD_LOGIC_VECTOR (3 downto 0);

begin

    acarreo(0) <= cin;
    ciclo : for i in 0 to 3 generate
        aux(i) <= b(i) xor cin;
        caux: Sumador1B port map(
            a => a(i),
            b => aux(i),
            cin => acarreo(i),
            s => s(i),
            cout => acarreo(i+1)
        );        
        
    end generate; 

cout <= acarreo(4);

end Behavioral;
