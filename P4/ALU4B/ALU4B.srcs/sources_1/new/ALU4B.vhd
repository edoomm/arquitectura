library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU4B is
    Port ( a, b, aluop : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           ov, n, z, c, co : out STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0));
           
end ALU4B;

architecture Behavioral of ALU4B is

    component ALU1Bit is
        Port ( a, selA, b, selB, cin : in STD_LOGIC;
               op : in STD_LOGIC_VECTOR (1 downto 0);
               co, res : out STD_LOGIC);
    end component;

    -- Auxiliar de resultados r
    signal auxs : STD_LOGIC_VECTOR(3 downto 0); -- se tiene que declarar una señal porque VHDL no permite trabajar con la salida para generar las banderas
    -- Auxiliar de co
    signal auxco : STD_LOGIC_VECTOR(4 downto 0); -- señal para mapear los "acarreos" auxiliares como cin

begin
    --Primer auxco = selB
    auxco(0) <= aluop(2);
    -- instanciaciones
    inst: for i in 0 to 3 generate
        iaux : ALU1Bit port map (
            a => a(i),
            b => b(i),
            res => auxs(i),
            co => auxco(i+1),
            op => aluop(1 downto 0),
            cin => auxco(i),
            selA => aluop(3),
            selB => aluop(2)
        );
    end generate inst;
    
    -- obtencion de banderas y otras salidas
    c <= auxco(4) when aluop(1 downto 0)="11" else '0';
    co <= auxco(4);
    n <= auxs(3);
    ov <= (auxco(4) xor auxco(3)) when aluop(1 downto 0)="11" else '0';
    z <= not(auxs(3) or auxs(2) or auxs(1) or auxs(0));
    
    s <= auxs;

end Behavioral;
