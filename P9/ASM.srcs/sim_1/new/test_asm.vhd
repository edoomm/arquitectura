----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2021 17:16:04
-- Design Name: 
-- Module Name: test_asm - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity test_asm is
--  Port ( );
end test_asm;

architecture Behavioral of test_asm is
component asm is
    port (
        ini, clr, clk   : in std_logic;
        D               : in std_logic_vector(8 downto 0);
        qa              : out std_logic_vector(8 downto 0);
        disp            : out std_logic_vector(6 downto 0)
    );
end component;

signal ini, clr, clk : std_logic := '0';
signal D, qa :  std_logic_vector(8 downto 0) := (others => '0');
signal disp:  std_logic_vector(6 downto 0) := (others => '0');

begin
    asm1 : asm Port Map(
        ini => ini,
        clr => clr,
        clk => clk,
        D => D,
        qa => qa,
        disp => disp
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
        wait for 20 ns;
        
		clr<='0';
		wait for 20 ns;
		D<="101101011";
		wait for 20 ns;
		ini<='1';
		wait for 100 ns;
		
		clr <= '1';
        wait for 20 ns;
		clr<='0';
		wait for 20 ns;
		D<="000011101";
		wait for 20 ns;
		ini<='1';
		wait for 100 ns;
		
        wait;
    end process;

end Behavioral;
