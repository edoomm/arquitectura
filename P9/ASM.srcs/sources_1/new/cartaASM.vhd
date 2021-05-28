library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cartaASM is
    Port(
        clk, clr, ini, z, a0: in STD_LOGIC;
        la, lb, ea, eb, ec: out STD_LOGIC
    );
end cartaASM;

architecture Behavioral of cartaASM is
type estados is (e0, e1, e2);
signal edo_act, edo_sig : estados; 

begin

    process (clk, clr)
    begin
        if (clr = '1') then
            edo_act <= e0;
        elsif (rising_edge(clk)) then
            edo_act <= edo_sig;
        end if;
    end process;

    process
    begin
        la <= '0';
        ea <= '0';
        lb <= '0';
        eb <= '0';
        ec <= '0';
        
        case edo_act is
            when e0 =>
                lb <= '1';
                if(ini = '1') then
                    edo_sig <= e1;
                else
                    la <= '1';
                    edo_sig <= e0;
                end if;
            when e1 =>
                ea <= '1';
                if (z = '1') then
                    edo_sig <= e2;
                else
                    if(a0 = '1') then
                        eb <= '1';
                        edo_sig <= e1;
                    else
                        edo_sig <= e1;
                     end if;
                 end if;
            when e2 =>
                ec <= '1';
                if (ini = '1') then 
                    edo_sig <= e2;
                else
                    edo_sig <= e0;
                end if;
            when others =>
                edo_sig <= edo_act;            
        end case;
        
    end process;
    
end Behavioral;