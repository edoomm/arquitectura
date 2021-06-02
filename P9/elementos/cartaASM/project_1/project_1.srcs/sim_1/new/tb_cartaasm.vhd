library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity test_asm is
--  Port ( );
end test_asm;

architecture Behavioral of test_asm is
component cartaASM is
    Port(
        clk, clr, ini, z, a0: in STD_LOGIC;
        la, lb, ea, eb, ec: out STD_LOGIC
    );
end component;

signal ini, clr, clk, z, a0 : std_logic := '0';
signal la, lb, ea, eb, ec : std_logic := '0';

begin
    uu : cartaASM Port Map(
        ini => ini,
        clr => clr,
        clk => clk,
        z => z,
        a0 => a0,
        la => la,
        lb => lb,
        ea => ea,
        eb => eb,
        ec => ec
    );
    
    clock : process
    begin
        clk <= '0';
        wait for 5ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    
    test : process 
    begin
        clr <= '1';
        wait for 30 ns;
        clr <= '0';
        wait for 60 ns;
        ini <= '1';
        wait for 10 ns;
        ini <= '0';
        wait for 50 ns;
        a0 <= '1';
        wait for 10 ns;
        a0 <= '0';
        wait for 20 ns;
        a0 <= '1';
        wait for 10 ns;
        a0 <= '0';
        wait for 120 ns;
        z <= '1';
        wait;
    end process;

end Behavioral;
