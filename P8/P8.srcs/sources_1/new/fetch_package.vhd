library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package fetch_package is
    component ALU4B is
    Port ( a, b : in STD_LOGIC_VECTOR (15 downto 0);
	   aluop : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           ov, n, z, c, co : out STD_LOGIC;
           s : out STD_LOGIC_VECTOR (15 downto 0)
    );
    
    end component;

    component memoriaPrograma is
        --Parametrizacion 
        generic(
        p: integer :=10;
        d : integer := 25
        );
        -- Debemos definir el tamaño de la memoria : tamaño de palabra x numero de palabra
        Port ( dir : in STD_LOGIC_VECTOR (p-1 downto 0);
               dataOut :out STD_LOGIC_VECTOR (d-1 downto 0)       
         );
    end component;
    
    component stack is
         generic (
            n: integer :=16;
            m: integer :=8
            );
        Port ( PC_IN : in STD_LOGIC_VECTOR (n-1 downto 0);
               PC_OUT : out STD_LOGIC_VECTOR (n-1 downto 0);
               SP_OUT : out STD_LOGIC_VECTOR (2 downto 0);
               clk, clr, WPC, UP, DWN : in STD_LOGIC
            );
    end component;
    
    component memoriaDatos is
        --Parametrizacion 
        generic(
        p: integer :=10;
        d : integer := 16
        );
        -- Debemos definir el tamaño de la memoria : tamaño de palabra x numero de palabra
        Port ( dir : in STD_LOGIC_VECTOR (p-1 downto 0);
               dataIn : in STD_LOGIC_VECTOR (d-1 downto 0);
               dataOut :out STD_LOGIC_VECTOR (d-1 downto 0);
               wd : in STD_LOGIC;
               clk : in STD_LOGIC          
         );
    end component;
    
    component fileReg is
        Port ( writeReg : in STD_LOGIC_VECTOR (3 downto 0);
               writeData : in STD_LOGIC_VECTOR (15 downto 0);
               readReg1 : in STD_LOGIC_VECTOR (3 downto 0);
               readReg2 : in STD_LOGIC_VECTOR (3 downto 0);
               shamt : in STD_LOGIC_VECTOR (3 downto 0);
               clk, clr, wr, she, dir : in STD_LOGIC;
               readData1 : out STD_LOGIC_VECTOR (15 downto 0);
               readData2 : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
end package;


