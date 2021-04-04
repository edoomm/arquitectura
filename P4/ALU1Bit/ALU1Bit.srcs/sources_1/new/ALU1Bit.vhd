----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2021 06:44:01 PM
-- Design Name: 
-- Module Name: ALU1Bit - Behavioral
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

entity ALU1Bit is
    Port ( a, selA, b, selB, cin : in STD_LOGIC;
           op : in STD_LOGIC_VECTOR (1 downto 0);
           co, res : out STD_LOGIC);
end ALU1Bit;

architecture Behavioral of ALU1Bit is

begin


end Behavioral;
