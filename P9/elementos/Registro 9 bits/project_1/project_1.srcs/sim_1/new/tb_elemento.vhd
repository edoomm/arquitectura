----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.06.2021 13:12:59
-- Design Name: 
-- Module Name: tb_elemento - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_elemento is
--  Port ( );
end tb_elemento;

architecture Behavioral of tb_elemento is

component arreglo is
    Port ( clk, clr, LA, EA : in STD_LOGIC;
           DA : in STD_LOGIC_VECTOR (8 downto 0);
           QA : out STD_LOGIC_VECTOR (8 downto 0));
end component;

signal clk, clr, LA, EA : STD_LOGIC := '0';
signal DA, QA: STD_LOGIC_VECTOR (8 downto 0) := (others => '0');
constant clk_period : time := 10 ns;

begin

elemento1: arreglo Port map ( 
           clk => clk, 
           clr => clr, 
           LA => LA, 
           EA => EA, 
           DA => DA,
           QA => QA
);

 clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   
      stim_proc: process
   begin		
        clr<='1';
        wait for 20 ns;
        clr<='0';
        DA <= "111111111";
        wait for 20 ns;
        LA <= '1';
        wait for 20 ns;
        LA <= '0';
        EA <= '1';
        wait for 20 ns;
   end process;

end Behavioral;
