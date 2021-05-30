library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paq_asm is

    component cartaASM is
        Port(
            clk, clr, ini, z, a0: in STD_LOGIC;
            la, lb, ea, eb, ec: out STD_LOGIC
        );
    end component;
    
    component arreglo is
        Port ( clk, clr, LA, EA : in STD_LOGIC;
               DA : in STD_LOGIC_VECTOR (8 downto 0);
               QA : out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    
    component contador is
        Port ( clk, clr, LB, EB : in STD_LOGIC;
               QB : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component deco is
        port (
            Q_B  : in std_logic_vector(3 downto 0);
            Qout : out std_logic_vector(6 downto 0)
        );
    end component;    

end package;
