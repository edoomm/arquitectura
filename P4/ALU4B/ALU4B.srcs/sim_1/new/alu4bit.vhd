library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu4bit is
-- Port()
end alu4bit;

architecture Behavioral of alu4bit is
component ALU4B is
    Port ( a, b, aluop : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           c, co, n, ov, z : out STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0));
end component;

Signal a, b, aluop, s: STD_LOGIC_VECTOR (3 downto 0);
Signal c, co, n, ov, z, cin : STD_LOGIC;

begin

alu: ALU4B
    Port map(
        a => a,
        b => b,
        aluop => aluop,
        s => s,
        c => c,
        co => co,
        n => n,
        ov => ov, 
        z => z,
        cin => cin
    );

process
begin
    -- A= 5   B= -2
    a <= "0101";
    b <= "1110";
    -- A+B
    aluop <= "0011";
    wait for 20 ns;
    --A-B
    aluop <= "0111";
    wait for 20 ns;
    --AND
    aluop <= "0000";
    wait for 20 ns;
    --NAND
    aluop <= "1101";
    wait for 20 ns;
    --OR
    aluop <= "0001";
    wait for 20 ns;
    --NOR
    aluop <= "1100";
    wait for 20 ns;
    --XOR
    aluop <= "0010";
    wait for 20 ns;
    --XNOR
    aluop <= "1010";
    wait for 20 ns;
    
    -- A= 5   B= 7
    a <= "0101";
    b <= "0111";
    -- A+B
    aluop <= "0011";
    wait for 20 ns;
    
    -- A= A   B= B
    a <= "0101";
    b <= "0101";
    --A-B
    aluop <= "0111";
    wait for 20 ns;
    --NAND
    aluop <= "1101";
    wait;
    
end process;
end Behavioral;