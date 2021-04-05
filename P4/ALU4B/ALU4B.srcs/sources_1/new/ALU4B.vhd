----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2021 07:17:15 PM
-- Design Name: 
-- Module Name: ALU4B - Behavioral
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

entity ALU4B is
    Port ( a, aluop : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           c, co, n, ov, z : out STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0));
end ALU4B;

architecture Behavioral of ALU4B is

begin


end Behavioral;
