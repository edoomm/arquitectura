library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use ieee.numeric_std.all; 

entity memoriaPrograma is
    --Parametrizacion 
    generic(
    p: integer :=10;
    d : integer := 25
    );
    -- Debemos definir el tama�o de la memoria : tama�o de palabra x numero de palabra
    Port ( dir : in STD_LOGIC_VECTOR (p-1 downto 0);
           dataOut :out STD_LOGIC_VECTOR (d-1 downto 0)       
     );
end memoriaPrograma;
architecture ar_rom of memoriaPrograma is
	-- Instructions type R opcode always will be '0'.
	constant OPCODE_TYPE_R : std_logic_vector( 4 downto 0 ) := "00000";
	-- Instructions type R (Register):
	constant FUNCTION_CODE_ADD : std_logic_vector( 3 downto 0 ) := "0000"; -- Function code 00.
	constant FUNCTION_CODE_SUB : std_logic_vector( 3 downto 0 ) := "0001"; -- Function code 01.
	constant FUNCTION_CODE_AND : std_logic_vector( 3 downto 0 ) := "0010"; -- Function code 02.
	constant FUNCTION_CODE_OR : std_logic_vector( 3 downto 0 ) := "0011"; -- Function code 03.
	constant FUNCTION_CODE_XOR : std_logic_vector( 3 downto 0 ) := "0100"; -- Function code 04.
	constant FUNCTION_CODE_NAND : std_logic_vector( 3 downto 0 ) := "0101"; -- Function code 05.
	constant FUNCTION_CODE_NOR : std_logic_vector( 3 downto 0 ) := "0110"; -- Function code 06.
	constant FUNCTION_CODE_XNOR : std_logic_vector( 3 downto 0 ) := "0111"; -- Function code 07.
	constant FUNCTION_CODE_NOT : std_logic_vector( 3 downto 0 ) := "1000"; -- Function code 08.
	constant FUNCTION_CODE_SLL : std_logic_vector( 3 downto 0 ) := "1001"; -- Function code 09.
	constant FUNCTION_CODE_SRL : std_logic_vector( 3 downto 0 ) := "1010"; -- Function code 10.
	-- Instructions type I (Immediate):
	constant OPCODE_LI : std_logic_vector( 4 downto 0 ) := "00001"; -- Opcode 01.
	constant OPCODE_LWI : std_logic_vector( 4 downto 0 ) := "00010"; -- Opcode 02.
	constant OPCODE_LW : std_logic_vector( 4 downto 0 ) := "10111"; -- Opcode 23.
	constant OPCODE_SWI : std_logic_vector( 4 downto 0 ) := "00011"; -- Opcode 03.
	constant OPCODE_SW : std_logic_vector( 4 downto 0 ) := "00100"; -- Opcode 04.
	constant OPCODE_ADDI : std_logic_vector( 4 downto 0 ) := "00101"; -- Opcode 05.
	constant OPCODE_SUBI : std_logic_vector( 4 downto 0 ) := "00110"; -- Opcode 06.
	constant OPCODE_ANDI : std_logic_vector( 4 downto 0 ) := "00111"; -- Opcode 07.
	constant OPCODE_ORI : std_logic_vector( 4 downto 0 ) := "01000"; -- Opcode 08.
	constant OPCODE_XORI : std_logic_vector( 4 downto 0 ) := "01001"; -- Opcode 09.
	constant OPCODE_NANDI : std_logic_vector( 4 downto 0 ) := "01010"; -- Opcode 10.
	constant OPCODE_NORI : std_logic_vector( 4 downto 0 ) := "01011"; -- Opcode 11.
	constant OPCODE_XNORI : std_logic_vector( 4 downto 0 ) := "01100"; -- Opcode 12.
	constant OPCODE_BEQI : std_logic_vector( 4 downto 0 ) := "01101"; -- Opcode 13.
	constant OPCODE_BNEI : std_logic_vector( 4 downto 0 ) := "01110"; -- Opcode 14.
	constant OPCODE_BLTI : std_logic_vector( 4 downto 0 ) := "01111"; -- Opcode 15.
	constant OPCODE_BLETI : std_logic_vector( 4 downto 0 ) := "10000"; -- Opcode 16.
	constant OPCODE_BGTI : std_logic_vector( 4 downto 0 ) := "10001"; -- Opcode 17.
	constant OPCODE_BGETI : std_logic_vector( 4 downto 0 ) := "10010"; -- Opcode 18.
	-- Operations type J (Jump):
	constant OPCODE_B : std_logic_vector( 4 downto 0 ) := "10011"; -- Opcode 19.
	constant OPCODE_CALL : std_logic_vector( 4 downto 0 ) := "10100"; -- Opcode 20.
	-- Other operations:
	constant OPCODE_RET : std_logic_vector( 4 downto 0 ) := "10101"; -- Opcode 21.
	constant OPCODE_NOP : std_logic_vector( 4 downto 0 ) := "10110"; -- Opcode 22.
	-- S/U slots:
	constant SU : std_logic_vector( 3 downto 0 ) := "0000";
	-- Registers:
	constant R0 : std_logic_vector( 3 downto 0 ) := "0000";
	constant R1 : std_logic_vector( 3 downto 0 ) := "0001";
	constant R2 : std_logic_vector( 3 downto 0 ) := "0010";
	constant R3 : std_logic_vector( 3 downto 0 ) := "0011";
	constant R4 : std_logic_vector( 3 downto 0 ) := "0100";

	-- Defining ROM memory.
	type memory is array( 0 to (2**p)-1 ) of std_logic_vector( d-1 downto 0 );
	constant rom_memory : memory := (
		OPCODE_LI & R0 & x"0000",
        OPCODE_LI & R1 & x"0001",
        OPCODE_LI & R2 & x"0002",
        OPCODE_LI & R3 & "0000000000001100",
        OPCODE_TYPE_R & R4 & R0 & R1 & SU & FUNCTION_CODE_ADD,
        OPCODE_SWI & R4 & x"0072",
        OPCODE_ADDI & R0 & R1 & x"000",
        OPCODE_ADDI & R1 & R4 & x"000",
        OPCODE_ADDI & R2 & R2 & x"001",
        OPCODE_BNEI & R3 & R2 & "111111111011",
        OPCODE_NOP  & SU & SU & SU & SU & SU,
        --OPCODE_B & SU & "0000000000001010",
        OPCODE_SWI & R4 & x"0072",
        others => (others => '0')
	);

	begin

		dataOut <= rom_memory( conv_integer( dir ) );

end ar_rom;
