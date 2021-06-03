library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.paq_asm.all;

entity asm is
    port (
        ini, clr, clk   : in std_logic;
        D               : in std_logic_vector(8 downto 0);
        qa              : out std_logic_vector(8 downto 0);
        disp            : out std_logic_vector(6 downto 0)
    );
end asm;

architecture Behavioral of asm is

    signal la, ea, a0, z, lb, ec, eb : std_logic;
    signal qa_aux : std_logic_vector(8 downto 0);
    signal qb : std_logic_vector(3 downto 0);
    signal disp_aux : std_logic_vector(6 downto 0);

begin

    uc : cartaASM
    port map (
        -- inputs
        ini => ini,
        clr => clr,
        clk => clk,
        z   => z,
        a0  => a0,
        -- outputs
        la  => la,
        ea  => ea,
        lb  => lb,
        eb  => eb,
        ec  => ec
    );

    arr : arreglo
    port map (
        -- inputs
        clr => clr,
        clk => clk,
        DA  => D,
        LA  => la,
        EA  => ea,
        -- outputs
        QA  => qa_aux
    );

    -- calculando senales
    a0 <= qa_aux(0);
    z <= not(qa_aux(8) or qa_aux(7) or qa_aux(6) or qa_aux(5) or qa_aux(4) or qa_aux(3) or qa_aux(2) or qa_aux(1) or qa_aux(0));

    cont : contador
    port map (
        -- inputs
        clk => clk,
        clr => clr,
        LB  => lb,
        EB  => eb,
        -- outputs
        QB  => qb
    );

    Decodificador : deco
    port map (
        -- input    
        Q_B     => qb,
        -- output
        Qout    => disp_aux
    );

    disp <= disp_aux when ec = '1' else "1111110";
    
    qa <= qa_aux;

end Behavioral;
