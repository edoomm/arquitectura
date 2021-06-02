library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity deco is
    port (
        Q_B  : in std_logic_vector(3 downto 0);
        Qout : out std_logic_vector(6 downto 0)
    );
end deco;

architecture Behavioral of deco is

    constant guion  : std_logic_vector(6 downto 0) := "1111110"; -- '-' en CA | Hex:00
    constant n0     : std_logic_vector(6 downto 0) := "0000001"; -- '1' en CA | Hex:7E
    constant n1     : std_logic_vector(6 downto 0) := "1001111"; -- '1' en CA | Hex:30
    constant n2     : std_logic_vector(6 downto 0) := "0010010"; -- '2' en CA | Hex:6D
    constant n3     : std_logic_vector(6 downto 0) := "0000110"; -- '3' en CA | Hex:79
    constant n4     : std_logic_vector(6 downto 0) := "1001100"; -- '4' en CA | Hex:33
    constant n5     : std_logic_vector(6 downto 0) := "0100100"; -- '5' en CA | Hex:5B
    constant n6     : std_logic_vector(6 downto 0) := "0100000"; -- '6' en CA | Hex:5F
    constant n7     : std_logic_vector(6 downto 0) := "0001111"; -- '7' en CA | Hex:70
    constant n8     : std_logic_vector(6 downto 0) := "0000000"; -- '8' en CA | Hex:7F
    constant n9     : std_logic_vector(6 downto 0) := "0001100"; -- '9' en CA | Hex:73

begin

    d: process(Q_B)
    begin
        case Q_B is
            when "0000" =>
                Qout <= n0;
            when "0001" =>
                Qout <= n1;
            when "0010" =>
                Qout <= n2;
            when "0011" =>
                Qout <= n3;
            when "0100" =>
                Qout <= n4;
            when "0101" =>
                Qout <= n5;
            when "0110" =>
                Qout <= n6;
            when "0111" =>
                Qout <= n7;
            when "1000" =>
                Qout <= n8;
            when "1001" =>
                Qout <= n9;
            
            when others =>
                Qout <= guion;
        end case;
    end process d;

end Behavioral;