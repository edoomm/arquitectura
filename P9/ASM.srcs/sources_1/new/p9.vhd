library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p9 is
    port (
        ini, clr, clk   : in std_logic;
        D               : in std_logic_vector(8 downto 0);
        qa              : out std_logic_vector(8 downto 0);
        disp            : out std_logic_vector(6 downto 0)
    );
end p9;

architecture Behavioral of p9 is

    component div_freq is
        generic ( n : integer := (100*(10**6)/2) - 1 );
        port (
            clk, clr    : in std_logic;
            clk_hz      : out std_logic := '0'
        );
    end component;

    component asm is
        port (
            ini, clr, clk   : in std_logic;
            D               : in std_logic_vector(8 downto 0);
            qa              : out std_logic_vector(8 downto 0);
            disp            : out std_logic_vector(6 downto 0)
        );
    end component;

    signal fo : std_logic;

begin

    divisor : div_freq
    port map (
        clk     => clk,
        clr     => clr,
        clk_hz  => fo
    );

    carta : asm
    port map (
        ini     => ini,
        clr     => clr,
        clk     => fo,
        D       => D,
        qa      => qa,
        disp    => disp
    );

end Behavioral;
