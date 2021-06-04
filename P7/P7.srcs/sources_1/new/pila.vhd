library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stack is
     generic (
        n: integer :=16;
        m: integer :=8
        );
    Port ( PC_IN : in STD_LOGIC_VECTOR (n-1 downto 0);
           PC_OUT : out STD_LOGIC_VECTOR (n-1 downto 0);
           SP_OUT : out STD_LOGIC_VECTOR (2 downto 0);
           clk, clr, WPC, UP, DWN : in STD_LOGIC
        );
end stack;

architecture Behavioral of stack is

    type type_stack is array (0 to m-1) of std_logic_vector(n-1 downto 0);

begin

    process(clr, clk)
    --Stack pointer variable 
    variable SP : integer range 0 to m-1; 
    --Contrador de programa PC
    variable PC : type_stack;
    
    begin
            if (clr = '1') then 
                -- CLEAR
                for i in 0 to m-1 loop 
                    PC(i) := (others => '0');
                end loop;
                SP := 0;
            elsif (clk'event and clk = '1') then
                -- PC increment
                if(WPC = '0' and UP = '0' and DWN ='0') then
                    PC(SP) := PC(SP)+ 1;
                end if; 
                --Branch, conditional and unconditional
                if(WPC = '1' and UP = '0' and DWN ='0') then
                    PC(SP) := PC_IN;
                end if; 
                --Call
                if(WPC = '1' and UP = '1' and DWN ='0') then
                    SP := SP + 1;
                    PC(SP) := PC_IN;
                end if;
                --Ret
                if(WPC = '0' and UP = '0' and DWN ='1') then
                    SP := SP - 1;
                    PC(SP) := PC(SP) + 1;
                end if;  
            end if; 
            SP_OUT <= std_logic_vector (to_unsigned(SP, SP_OUT'length));
            PC_OUT <= PC(SP);
    
    end process;  

end Behavioral;
