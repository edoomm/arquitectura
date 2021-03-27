library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sumador1B is
    Port ( a,b,cin : in STD_LOGIC;
           s,cout : out STD_LOGIC);
end Sumador1B;

architecture Behavioral of Sumador1B is

begin

    s <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);

end Behavioral;
