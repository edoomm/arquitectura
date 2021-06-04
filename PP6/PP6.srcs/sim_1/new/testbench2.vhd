library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 

USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;


entity testbench_ram is
--  Port ( );
end testbench_ram;

architecture Behavioral of testbench_ram is
    component memoriaDatos is
    Port ( dir : in STD_LOGIC_VECTOR (15 downto 0);
           dataIn : in STD_LOGIC_VECTOR (15 downto 0);
           dataOut :out STD_LOGIC_VECTOR (15 downto 0);
           wd : in STD_LOGIC;
           clk : in STD_LOGIC          
     );
    end component;

Signal dir : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
Signal dataIn : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
Signal dataOut : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
Signal wd : STD_LOGIC := '0';
Signal clk : STD_LOGIC := '0';

constant clock_period : time := 30 ns;

begin
ul: memoriaDatos port map (
    dir => dir,
    dataIn => dataIn,
    dataOut => dataOut, 
    wd => wd,
    clk => clk
);

process
begin
    clk <= '0';
    wait for clock_period/2;
    clk <= '1';
    wait for clock_period/2;
end process; 


-- Estimulos del proceso
file_sim : process 
    file file_vectors : text;
		variable line_vector : line;
		variable var_dir : std_logic_vector( 15 downto 0 ); -- dir
		variable var_dataIn : std_logic_vector( 15 downto 0 ); -- DataIn
		variable var_wd : std_logic;

		file file_results : text;
		variable line_result : line;
		variable var_dataOut : std_logic_vector( 15 downto 0 ); -- Data out.
		variable CADENA : string( 1 downto 10 );

		begin
			file_open( file_vectors, "C:\Users\mara0\Documents\ESCOM6\PracticasArquitectura\arquitectura\PP6\Vectors.txt", read_mode );
			file_open( file_results, "C:\Users\mara0\Documents\ESCOM6\PracticasArquitectura\arquitectura\PP6\Results.txt", write_mode );

        CADENA := "ADD";
		write(line_result, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA
		CADENA := "WD";
		write(line_result, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA 
		CADENA := " DATA_IN";
		write(line_result, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA 
		CADENA := "DATA_OUT";
		write(line_result, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA 
		writeline(file_results,line_result);-- escribe la linea en el archivo

			wait for 100 ns;

			for i in 0 to 11 loop
				readline ( file_vectors, line_vector );
				hread( line_vector, var_dir );
				dir <= var_dir;
				hread( line_vector, var_dataIn );
				dataIn <= var_dataIn;
				read( line_vector, var_wd );
				wd <= var_wd;

				wait until rising_edge ( clk );

				dir <= var_dir;
				var_dataOut := dataOut;
				hwrite( line_result, var_dir, right, 10 );
				write( line_result, var_wd, right, 10 );
				hwrite( line_result, var_dataIn, right, 10 );
				hwrite( line_result, var_dataOut, right, 10 );

				writeline ( file_results, line_result );
			end loop;

			file_close ( file_vectors );
			file_close ( file_results );

		wait;

end process; 

end Behavioral;