library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use ieee.numeric_std.all; 


entity test_ram is
--  Port ( );
end test_ram;

architecture Behavioral of test_ram is
component memoDatos is
    Port ( dirW, dirR : in STD_LOGIC_VECTOR (15 downto 0);
           dataIn : in STD_LOGIC_VECTOR (15 downto 0);
           dataOut :out STD_LOGIC_VECTOR (15 downto 0);
           wd : in STD_LOGIC;
           clk : in STD_LOGIC          
     );
end component;

Signal dirR : STD_LOGIC_VECTOR (15 downto 0);
Signal dirW : STD_LOGIC_VECTOR (15 downto 0);
Signal dataIn : STD_LOGIC_VECTOR (15 downto 0);
Signal dataOut : STD_LOGIC_VECTOR (15 downto 0);
Signal wd : STD_LOGIC;
Signal clk : STD_LOGIC;

begin

ul: memoDatos port map (
    dirW => dirW,
    dirR => dirR,
    dataIn => dataIn,
    dataOut => dataOut, 
    wd => wd,
    clk => clk
);

process
begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
end process; 

process 
begin
    dirW <= "0000000000000110";
    dataIn <= x"14";
    wd <= '1';
    wait for 78 ns;
    dirR <= "0000000000000110"; 
end process; 

end Behavioral;
