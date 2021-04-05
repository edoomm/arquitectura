library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU1Bit is
    Port ( a, selA, b, selB, cin : in STD_LOGIC;
           op : in STD_LOGIC_VECTOR (1 downto 0);
           co, res : out STD_LOGIC);
end ALU1Bit;

architecture Behavioral of ALU1Bit is

    component Sumador1B is
        Port ( a,b,cin : in STD_LOGIC;
               s,cout : out STD_LOGIC);
    end component;

    signal auxa, auxb, auxand, auxor, auxxor, suma : STD_LOGIC;

begin

    -- Primer multiplexor
    auxa <= a xor selA;
    auxb <= b xor selB;

    -- Compuertas
    auxand <= auxa and auxb;
    auxor <= auxa or auxb;
    auxxor <= auxa xor auxb;
    sumador : Sumador1B port map (
        a => auxa,
        b => auxb,
        cin => cin,
        s => suma,
        cout => co
    );

    mux: process(auxand, auxor, auxxor, suma, op)
    begin
        case op is
            when "00" =>
                res <= auxand;
            when "01" =>
                res <= auxor;
            when "10" =>
                res <= auxxor;        
            when others =>
                res <= suma;
        
        end case;
    end process mux;

end Behavioral;
