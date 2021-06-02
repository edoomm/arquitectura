----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.06.2021 14:20:19
-- Design Name: 
-- Module Name: tb_mux - Behavioral
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

entity tb_mux is
--  Port ( );
end tb_mux;

architecture Behavioral of tb_mux is

component deco is
    port (
        Q_B  : in std_logic_vector(3 downto 0);
        Qout : out std_logic_vector(6 downto 0)
    );
end component;

signal Q_B  : std_logic_vector(3 downto 0):= (others => '0');
signal Qout : std_logic_vector(6 downto 0):= (others => '0');


begin

deco1: deco port map (
        Q_B  => Q_B,
        Qout => Qout
);

 stim_proc: process
   begin
   Q_B <= "0000";
   wait for 20 ns;
   Q_B <= "0001";
   wait for 20 ns;	
   Q_B <= "0010";
   wait for 20 ns;
   Q_B <= "0011";
   wait for 20 ns;	
   Q_B <= "0100";
   wait for 20 ns;	
   Q_B <= "0101";
   wait for 20 ns;	
   Q_B <= "0110";
   wait for 20 ns;	
   Q_B <= "0111";
   wait for 20 ns;	
   Q_B <= "1000";
   wait for 20 ns;	
   Q_B <= "1001";	
   wait for 20 ns;
   Q_B <= "1101";	
   wait for 20 ns;
   Q_B <= "1111";	
   wait for 20 ns;
   end process;

end Behavioral;
