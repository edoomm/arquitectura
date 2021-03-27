----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2021 02:56:46 PM
-- Design Name: 
-- Module Name: tbSumador1B - Behavioral
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

entity tbSumador1B is
--  Port ( );
end tbSumador1B;

architecture Behavioral of tbSumador1B is

component Sumador1B is
    Port ( a,b,cin : in STD_LOGIC;
           s,cout : out STD_LOGIC);
end component;

signal a,b,cin : STD_LOGIC;
signal s,cout : STD_LOGIC;

begin

elemento1: Sumador1B    Port map
     (a => a,
      b => b,
      cin => cin,
      s => s,
      cout => cout
      );

process
begin

    a <= '0';
    b <= '1';
    cin <= '0';
    
    wait for 20 ns;
    
    b <= '0';
    wait;    

end process;

end Behavioral;
