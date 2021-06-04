library IEEE;
library work; 
use IEEE.STD_LOGIC_1164.ALL;
use work.fetch_package.ALL;

entity fetch_memp_pila is
    Port ( 
           PC_IN : in STD_LOGIC_VECTOR (15 downto 0);
           PC_OUT : out STD_LOGIC_VECTOR (24 downto 0));
end fetch_memp_pila;

architecture Behavioral of fetch_memp_pila is
signal spaux: std_logic_vector(2 downto 0);
signal pc: std_logic_vector(15 downto 0);
signal aluop, bus_sr2, cu_flags : std_logic_vector( 3 downto 0 );
signal alu_output, bus_swd, bus_sr, bus_sdmp, bus_sop1, bus_sop2, bus_sext, bus_sdmd, read_data_1, read_data_2, ram_output : std_logic_vector( 15 downto 0 );
signal SHE, DIR, WR, WD, SDMP, clk, clr, up, dwn, wpc : std_logic;
signal sr2, swd, sext, sop1, sop2, sdmd, sr, lf: std_logic;
signal alu_cin, alu_co: std_logic;
signal stack_output : std_logic_vector( 15 downto 0 );
signal rom_output : std_logic_vector( 24 downto 0 );
signal readData_1, readData_2 : std_logic_vector( 15 downto 0 ); 
signal microcode : std_logic_vector( 19 downto 0 );
signal extensor_signo, extensor_dir: std_logic_vector(15 downto 0);

begin
    
    
    -- Instanciación pila
    pila1 : stack 
            Port map (
                   PC_IN => bus_sdmp,
                   PC_OUT => stack_output,
                   SP_OUT => spaux,
                   clk => clk, 
                   clr => clr, 
                   WPC => WPC, 
                   UP => UP, 
                   DWN => DWN
            );

    -- Instanciación memoria de programa ROM 
    memoriaPrograma1 : memoriaPrograma
        Port map ( 
            dir => stack_output(9 downto 0),
            dataOut => rom_output
         );
    
    -- Instanciación memoria de datos RAM
    memoriaDatos1 : memoriaDatos
    Port map ( 
           dir => bus_sdmd(9 downto 0),
           dataIn => read_data_2,
           dataOut => ram_output,
           wd => wd,
           clk => clk
     );
    
   -- Instanciación Archivo de Registros
   ArchivoRegistros1: fileReg 
        Port map ( 
           writeReg => rom_output(19 downto 16),
           writeData => bus_swd,
           readReg1 => rom_output(15 downto 12),
           readReg2 => bus_sr2,
           shamt  => rom_output(7 downto 4),
           clk => clk,
           clr => clr, 
           wr => wr, 
           she => she, 
           dir => dir,
           readData1 => readData_1, 
           readData2 => readData_2
    );
    
    -- Instanciación ALU
    alu : ALU4B
    Port map( 
           s => alu_output,
           a => bus_sop1,
           b => bus_sop2,
           c => cu_flags(0), 
           z => cu_flags(1),
           n => cu_flags(2),
           ov => cu_flags(3),
           aluop => aluop,
           cin => alu_cin,           
           co => alu_co
    );
    
    -- Señales como salida de unidad de control
    sdmp <= microcode(19);
    UP <= microcode(18);
    DWN <= microcode(17);
    WPC <= microcode(16);
    sr2<= microcode(15);
    swd<= microcode(14);
    sext <= microcode(13);
    SHE <= microcode(12);
    DIR <= microcode(11);
    WR <= microcode(10);
    sop1 <= microcode(9);
    sop2 <= microcode(8);
    aluop(3) <= microcode(7);
    aluop(2) <= microcode(6);
    aluop(1) <= microcode(5);
    aluop(0) <= microcode(4);
    sdmd <= microcode(3);
    wd <= microcode(2);
    sr <= microcode(1);
    lf <= microcode(0);
    
    -- Muxes 
    bus_sdmp <= rom_output (15 downto 0) when (sdmp = '0') else bus_sr;
    bus_sr2 <= rom_output (11 downto 8) when (sr2 = '0') else rom_output (19 downto 16);
    bus_swd <= rom_output (15 downto 0) when (swd = '0') else bus_sr;
    extensor_signo <= rom_output(11) & rom_output(11) & rom_output(11) & rom_output(11) & rom_output(11 downto 0);
    extensor_dir <= "0000" & rom_output(11 downto 0);
    bus_sext <= extensor_signo when (sext = '0') else extensor_dir;
    bus_sop1 <= readData_1 when (sop1 = '0') else stack_output;
    bus_sop2 <= readData_2 when (sop2 = '0') else bus_sext;
    bus_sdmd <= alu_output when (sdmd = '0') else rom_output(15 downto 0);
    bus_sr <= ram_output when (sr = '0') else alu_output;
    
end Behavioral;    

