library ieee;
library std;

use ieee.std_logic_textio.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use std.textio.all;

entity test_bench is
end test_bench;
 
architecture behavior of test_bench is 
	
	component stack
	port(
		PC_IN : in STD_LOGIC_VECTOR (15 downto 0);
        PC_OUT : out STD_LOGIC_VECTOR (15 downto 0);
        SP_OUT : out STD_LOGIC_VECTOR (2 downto 0);
        clk, clr, WPC, UP, DWN : in STD_LOGIC
	);
	end component;
    
	
   --Inputs
   signal CLR : std_logic := '0';
   signal CLK : std_logic := '0';
   signal WPC : std_logic := '0';
   signal UP : std_logic := '0';
   signal DWN : std_logic := '0';
   signal PC_IN : std_logic_vector( 15 downto 0 ) := ( others => '0' );

 	--Outputs
   signal PC_OUT : std_logic_vector( 15 downto 0 );
   signal SP_OUT : std_logic_vector( 0 to 2 );

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
begin
 
	-- Instantiate the Unit Under Test (UUT)
   uut: stack port map (
          PC_OUT => PC_OUT,
          CLR => CLR,
          CLK => CLK,
          WPC => WPC,
          UP => UP,
          DWN => DWN,
          PC_IN => PC_IN,
          SP_OUT => SP_OUT
        );

   -- Clock process definitions
   clock_process :process
   begin
		CLK <= '0';
		wait for clock_period/2;
		CLK <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
		file file_vectors : text;
		variable line_vectors : line;
		variable VAR_PCIN : std_logic_vector( 15 downto 0 );
		variable VAR_CLR : std_logic;
		variable VAR_DWN : std_logic;
		variable VAR_WPC : std_logic;
		variable VAR_UP : std_logic;
		
		file file_results : text;
		variable line_results : line;
		variable VAR_PCOUT : std_logic_vector( 15 downto 0 );
		variable VAR_SPOUT : std_logic_vector( 2 downto 0 );
		variable str : string( 1 to 10 );
		
		begin
			file_open( file_vectors, "C:\Users\mara0\Documents\ESCOM6\PracticasArquitectura\arquitectura\P7\Vectors.txt", read_mode );
			file_open( file_results, "C:\Users\mara0\Documents\ESCOM6\PracticasArquitectura\arquitectura\P7\Results.txt", write_mode );
			
			str := "     CLEAR";
			write( line_results, str, right, str'length + 1 );
			str := "       WPC";
			write( line_results, str, right, str'length + 1 );
			str := "        UP";
			write( line_results, str, right, str'length + 1 );
			str := "       DWN";
			write( line_results, str, right, str'length + 1 );
			str := "     PC IN";
			write( line_results, str, right, str'length + 1 );
			str := "        SP";
			write( line_results, str, right, str'length + 1 );
			str := " PC OUTPUT";
			write( line_results, str, right, str'length + 1 );
			writeline( file_results, line_results );
			
			wait for 100 ns;
			
			for i in 0 to 22 loop
				readline( file_vectors, line_vectors );
				read( line_vectors, VAR_CLR );
				CLR <= VAR_CLR;
				read( line_vectors, VAR_WPC );
				UP <= VAR_UP;
				read( line_vectors, VAR_UP );
				DWN <= VAR_DWN;
				read( line_vectors, VAR_DWN );
				WPC <= VAR_WPC;
				hread( line_vectors, VAR_PCIN );
				PC_IN <= VAR_PCIN;
				
				wait until rising_edge( CLK );
				
				VAR_PCOUT := PC_OUT;
				VAR_SPOUT := SP_OUT;
				write( line_results, VAR_CLR, right, 11 );
				write( line_results, VAR_WPC, right, 11 );
				write( line_results, VAR_UP, right, 11 );
				write( line_results, VAR_DWN, right, 11 );
				hwrite( line_results, VAR_PCIN, right, 11 );
				write( line_results, VAR_SPOUT, right, 11 );
				hwrite( line_results, VAR_PCOUT, right, 11 );
				
				writeline( file_results, line_results );
			end loop;
			file_close( file_results );
			file_close( file_vectors );
      wait;
   end process;

END;