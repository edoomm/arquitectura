library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU4B is
    Port ( a, b, aluop : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           c, co, n, ov, z : out STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0));
end ALU4B;

architecture Behavioral of ALU4B is

    component ALU1Bit is
        Port ( a, selA, b, selB, cin : in STD_LOGIC;
               op : in STD_LOGIC_VECTOR (1 downto 0);
               co, res : out STD_LOGIC);
    end component;

    signal auxs : STD_LOGIC_VECTOR(3 downto 0); -- se tiene que declarar una señal porque VHDL no permite trabajar con la salida para generar las banderas
    signal auxco : STD_LOGIC; -- este no supe donde mapearlo y declaré una señal para que no quede sin mapear, este es el correspondiente a s(3), pero cuando mapeaba co con co el esquematico se diseñaba de manera extraña

begin

    -- instanciaciones
    inst: for i in 0 to 3 generate
        iaux : ALU1Bit port map (
            a => a(i),
            b => b(i),
            res => auxs(i),
            cin => aluop(2),
            selA => aluop(3),
            selB => aluop(2),
            op => aluop(1 downto 0),
            co => auxco
        );
    end generate inst;

    -- obtencion de banderas y otras salidas
    c <= auxs(3);
    co <= auxs(3);
    n <= auxs(3);
    ov <= auxs(3) xor auxs(2);
    z <= not(auxs(3) or auxs(2) or auxs(1) or auxs(0));
    
    s <= auxs;

end Behavioral;
