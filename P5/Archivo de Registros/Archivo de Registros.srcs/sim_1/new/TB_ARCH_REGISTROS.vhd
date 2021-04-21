----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2021 02:17:01 PM
-- Design Name: 
-- Module Name: TB_ARCH_REGISTROS - Behavioral
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


LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 

USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_ARCH_REGISTROS IS
END TB_ARCH_REGISTROS;

architecture behavior of TB_ARCH_REGISTROS is

    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fileReg
    PORT(
       writeReg : in STD_LOGIC_VECTOR (3 downto 0);
       writeData : in STD_LOGIC_VECTOR (15 downto 0);
       readReg1 : in STD_LOGIC_VECTOR (3 downto 0);
       readReg2 : in STD_LOGIC_VECTOR (3 downto 0);
       shamt : in STD_LOGIC_VECTOR (3 downto 0);
       clk, clr, wr, she, dir : in STD_LOGIC;
       readData1 : out STD_LOGIC_VECTOR (15 downto 0);
       readData2 : out STD_LOGIC_VECTOR (15 downto 0)
    );
    END COMPONENT;
    
    -- Inputs
    signal writeReg : std_logic_vector(3 downto 0) := (others => '0');
    signal writeData : std_logic_vector(15 downto 0) := (others => '0');
    signal readReg1 : std_logic_vector(3 downto 0) := (others => '0');
    signal readReg2 : std_logic_vector(3 downto 0) := (others => '0');
    signal shamt : std_logic_vector(3 downto 0) := (others => '0');
    signal clk : std_logic := '0';
    signal clr : std_logic := '0';
    signal wr : std_logic := '0';
    signal she : std_logic := '0';
    signal dir : std_logic := '0';

    -- Outputs
    signal readData1 : STD_LOGIC_VECTOR (15 downto 0);
    signal readData2 : STD_LOGIC_VECTOR (15 downto 0);

    -- Clock period definitions
   constant CLK_period : time := 10 ns;    

begin

    
    -- Instantiate the Unit Under Test (UUT)
    uut: fileReg PORT MAP (
          writeReg => writeReg,
          writeData => writeData,
          readReg1 => readReg1,
          readReg2 => readReg2,
          shamt => shamt,
          clk => clk,
          clr => clr,
          wr => wr,
          she => she,
          dir => dir,
          readData1 => readData1,
          readData2 => readData2
        );
       
   -- Clock process definitions
   CLK_process :process
   begin
		clk <= '0';
		wait for CLK_period/2;
		clk <= '1';
		wait for CLK_period/2;
   end process;

   -- Stimulus process																	
   stim_proc: process
	file ARCH_RES : TEXT;																					
	variable LINEA_RES : line;
   VARIABLE VAR_readData1 : STD_LOGIC_VECTOR (15 downto 0);
   VARIABLE VAR_readData2 : STD_LOGIC_VECTOR (15 downto 0);
	
	file ARCH_VEC : TEXT;
	variable LINEA_VEC : line;
   VARIABLE VAR_writeReg : std_logic_vector(3 downto 0);
   VARIABLE VAR_writeData : std_logic_vector(15 downto 0);
   VARIABLE VAR_readReg1 : std_logic_vector(3 downto 0);
   VARIABLE VAR_readReg2 : std_logic_vector(3 downto 0);
   VARIABLE VAR_shamt : std_logic_vector(3 downto 0);
   VARIABLE VAR_clr : std_logic;
   VARIABLE VAR_wr : std_logic;
   VARIABLE VAR_she : std_logic;
   VARIABLE VAR_dir : std_logic;
	VARIABLE CADENA : STRING(1 TO 4); -- !!!ACÃ? CHANCE SE TIENE QUE CAMBIAR A (1 TO 5) PARA PODER ESCRIBIR "SHAMT"
   begin		
		file_open(ARCH_VEC, "VECTORES.TXT", READ_MODE); 	-- !!!ACÃ? IGUAL PIENSO QUE SE LE DEBE CAMBIAR POR LA RUTA DE NUESTRAS COMPUTADORAS DONDE TENEMOS ESOS ARCHIVOS DE TEXTO
		file_open(ARCH_RES, "RESULTADO.TXT", WRITE_MODE); 	-- !!!ACÃ? IGUAL PIENSO QUE SE LE DEBE CAMBIAR POR LA RUTA DE NUESTRAS COMPUTADORAS DONDE TENEMOS ESOS ARCHIVOS DE TEXTO

		CADENA := "RR1";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "RR1"
      CADENA := " RR2";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " RR2"
      CADENA := " SHAM";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " SHAM"
      CADENA := " WREG";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " WREG"
      CADENA := "  WD";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "  WD"
      CADENA := "  WR";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "  WR"
      CADENA := " SHE";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " SHE"
      CADENA := " DIR";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " DIR"
      CADENA := " RD1";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " RD1"
      CADENA := " RD2";
      write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " RD2"
		writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo

		WAIT FOR 100 NS;
		FOR I IN 0 TO 14 LOOP
			readline(ARCH_VEC,LINEA_VEC); -- lee una linea completa

         -- Hread es pa leer hexadecimales
         read(LINEA_VEC, VAR_readReg1);
         readReg1 <= VAR_readReg1;
         read(LINEA_VEC, VAR_readReg2);
         readReg2 <= VAR_readReg2;
         read(LINEA_VEC, VAR_shamt);
         shamt <= VAR_shamt;
         read(LINEA_VEC, VAR_writeReg);
         writeReg <= VAR_writeReg;
         read(LINEA_VEC, VAR_writeData);
         writeData <= VAR_writeData;
         read(LINEA_VEC, VAR_wr);
         wr <= VAR_wr;
         read(LINEA_VEC, VAR_she);
         she <= VAR_she;
         read(LINEA_VEC, VAR_dir);
         dir <= VAR_dir;
			read(LINEA_VEC, VAR_clr);  -- !!! En el archivo VECTORES.txt la Ãºltima columna debe ser 'clr'
			clr <= VAR_clr;
			
			WAIT UNTIL RISING_EDGE(CLK);	--ESPERO AL FLANCO DE SUBIDA 

         VAR_readData1 := readData1;
         VAR_readData2 := readData2;

         write(LINEA_RES, VAR_readReg1, right, 5); --ESCRIBE EL CAMPO      RR1
         write(LINEA_RES, VAR_readReg2, right, 5); --ESCRIBE EL CAMPO      RR2
         write(LINEA_RES, VAR_shamt, right, 5); --ESCRIBE EL CAMPO         SHAM
         write(LINEA_RES, VAR_writeReg, right, 5); --ESCRIBE EL CAMPO      WREG
         write(LINEA_RES, VAR_writeData, right, 5);   --ESCRIBE EL CAMPO   WD
         write(LINEA_RES, VAR_wr, right, 5); --ESCRIBE EL CAMPO            WR
         write(LINEA_RES, VAR_she, right, 5);   --ESCRIBE EL CAMPO         SHE
         write(LINEA_RES, VAR_dir, right, 5);   --ESCRIBE EL CAMPO         DIR
         write(LINEA_RES, VAR_readData1, right, 5);   --ESCRIBE EL CAMPO   RD1
         write(LINEA_RES, VAR_readData2, right, 5);   --ESCRIBE EL CAMPO   RD2

			writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
			
		end loop;
		file_close(ARCH_VEC);  -- cierra el archivo
		file_close(ARCH_RES);  -- cierra el archivo

      wait;
   end process;

end;

