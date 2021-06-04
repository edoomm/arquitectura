library ieee;
library std;

use ieee.std_logic_textio.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use std.textio.all;

entity testbench_rom is
--  Port ( );
end testbench_rom;

architecture Behavioral of testbench_rom is
component memoriaPrograma is
    -- Debemos definir el tamaño de la memoria : tamaño de palabra x numero de palabra
    Port ( dir : in STD_LOGIC_VECTOR (9 downto 0);
           dataOut :out STD_LOGIC_VECTOR (24 downto 0)       
     );
end component;
   Signal dir : STD_LOGIC_VECTOR (9 downto 0);
   Signal dataOut : STD_LOGIC_VECTOR (24 downto 0);   

begin

ul: memoriaPrograma port map(
    dir => dir,
    dataOut => dataOut
);

  -- Stimulus process
--    manual_sim : process
--	begin
--			wait for 50 ns;
--			dir <= x"0000";
--			wait for 50 ns;
--			dir <= x"0001";
--			wait for 500 ns;
--			dir <= x"0002";
--			wait for 50 ns;
--			dir <= x"0003";
--			wait for 50 ns;
--			dir <= x"0004";
--			wait for 50 ns;
--			dir <= x"0002";
--			wait for 50 ns;
--			dir <= x"0003";
--			wait;
--		end process;

file_sim : process
		file file_vectors : text;
		variable line_vector : line;
		variable var_dir : std_logic_vector( 9 downto 0 ); -- Address bus.

		file file_results : text;
		variable line_result : line;
		variable var_dataOut : std_logic_vector( 24 downto 0 ); 
		variable var_opcode : std_logic_vector( 4 downto 0 ); -- opcode column.
		variable var_19_16 : std_logic_vector( 3 downto 0 ); -- 19 ... 16 bits column.
		variable var_15_12 : std_logic_vector( 3 downto 0 ); -- 15 ... 12 bits column.
		variable var_11_08 : std_logic_vector( 3 downto 0 ); -- 11 ... 8 bits column.
		variable var_07_04 : std_logic_vector( 3 downto 0 ); -- 7 ... 4 bits column.
		variable var_03_00 : std_logic_vector( 3 downto 0 ); -- 3 ... 0 bits column.
		variable str : string( 1 to 9 );

		begin
		  file_open( file_vectors, "C:\Users\mara0\Documents\ESCOM6\PracticasArquitectura\arquitectura\P6.2\VECTORS.txt", read_mode );
		  file_open( file_results, "C:\Users\mara0\Documents\ESCOM6\PracticasArquitectura\arquitectura\P6.2\RESULTS.txt", write_mode );

		  str := "  ADDRESS";
		  write( line_result, str, right, str'length + 1 );
		  str := "   OPCODE";
		  write( line_result, str, right, str'length + 1 );
		  str := "  19...16";
		  write( line_result, str, right, str'length + 1 );
		  str := "  15...12";
		  write( line_result, str, right, str'length + 1 );
		  str := "  11...08";
		  write( line_result, str, right, str'length + 1 );
		  str := "  07...04";
		  write( line_result, str, right, str'length + 1 );
		  str := "  03...00";
		  write( line_result, str, right, str'length + 1 );
		  writeline ( file_results, line_result );

		  wait for 100 ns;

		  for i in 0 to 17 loop
			 readline ( file_vectors, line_vector );
			 Hread( line_vector, var_dir );
			 dir <= var_dir;
			 
             var_dataOut := dataOut;
			 wait for 50 ns;

			 var_opcode := std_logic_vector( dataOut( 24 downto 20 ) );
			 var_19_16 := std_logic_vector( dataOut( 19 downto 16 ) );
			 var_15_12 := std_logic_vector( dataOut( 15 downto 12 ) );
			 var_11_08 := std_logic_vector( dataOut( 11 downto 8 ) );
			 var_07_04 := std_logic_vector( dataOut( 7 downto 4 ) );
			 var_03_00 := std_logic_vector( dataOut( 3 downto 0 ) );

			 hwrite( line_result, var_dir, right, 10 );
			 write( line_result, var_opcode, right, 10 );
			 write( line_result, var_19_16, right, 10 );
			 write( line_result, var_15_12, right, 10 );
			 write( line_result, var_11_08, right, 10 );
			 write( line_result, var_07_04, right, 10 );
			 write( line_result, var_03_00, right, 10 );

			 writeline ( file_results, line_result );
		  end loop;

		  file_close ( file_vectors );
		  file_close ( file_results );

		  wait;
		end process;

end Behavioral;
