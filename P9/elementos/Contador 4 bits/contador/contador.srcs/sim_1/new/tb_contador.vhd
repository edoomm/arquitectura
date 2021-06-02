----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.06.2021 13:53:04
-- Design Name: 
-- Module Name: tb_contador - Behavioral
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

entity tb_contador is
--  Port ( );
end tb_contador;

architecture Behavioral of tb_contador is

component contador is
    Port ( clk, clr, LB, EB : in STD_LOGIC;
           QB : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal  clk, clr, LB, EB : STD_LOGIC := '0';
signal QB : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

constant clk_period : time := 10 ns;

begin


contador1: contador Port map( 
    clk => clk, 
    clr => clr, 
    LB => LB, 
    EB => EB,
    QB => QB
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
	   lb<='0';
	   eb<='0';
	   wait for 20 ns;
	   lb<='1';
	   eb<='0';
	   wait for 20 ns;
	   lb<='0';
	   eb<='1';
	   wait for 20 ns;
	   lb<='0';
	   eb<='0';
	   wait for 20 ns;
	   lb<='0';
	   eb<='1';
	   wait for 20 ns;
	   lb<='0';
	   eb<='1';
	   wait for 20 ns;
	   lb<='0';
	   eb<='1';
	   wait for 20 ns;
	   clr<='1';
	   wait for 20 ns;
   end process;
end Behavioral;
