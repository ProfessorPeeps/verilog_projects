/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #7			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Register File Models										  ***
 ********************************************************************
 *** Filename: tb_rom.v			 	Created By Juan Silva 5/1/19  ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/

 `timescale 1 ns / 1 ns
 
module tb_rom();

parameter DATA_SIZE = 8;			
parameter ADDR_SIZE = 5;	

wire [DATA_SIZE - 1: 0] DATA_RAM, DATA_REG; 	//bidirectional data
reg [DATA_SIZE - 1: 0] DATA_ROM, DATA_TEMP;	

reg [DATA_SIZE - 1:0] DATA_IN;					//receive data as register
reg [ADDR_SIZE - 1: 0] ADDR;					//address input

reg WS;
reg OE_ram, CS_ram;								//OE and CS for ROM and RAM
reg OE_rom, CS_rom;

integer i, index;								//index for loops

//Instantiate register files
RAM UUT(DATA_RAM, ADDR, OE_ram, WS, CS_ram);
ROM UUT2(DATA_ROM, ADDR, OE_rom, CS_rom);

//Read if WS = 1, Enable Out if WS = 0
assign DATA_RAM = DATA_REG;
assign DATA_REG = (WS) ? 'z : DATA_IN; 

initial begin
	$vcdpluson;
	
	//Enable ROM and RAM   
	CS_rom = 1'b0; CS_ram = 1'b0; 

	//RAM R/W disbabled but ROM enabled 
	OE_ram = 1'b0; OE_rom = 1'b1; WS = 1'b0;  

	#10 $readmemh("memory.mem", UUT.MEMORY, 5'h04, 5'h0F);
	#10 $readmemh("memory.mem", UUT.MEMORY, 5'h10, 5'h17);
	#10 $readmemh("memory.mem", UUT.MEMORY, 5'h1C, 5'h1E);
	
	//Read from ROM & RAM sequentially
	ADDR = 0;
	$write("Test for reading from ROM:\n");
	
	for(i = 0; i < 32; i = i+1) begin
		#10 ADDR = i;
		#10 $display("ROM[%d] = %b, RAM[%d] = %b", ADDR, DATA_ROM, ADDR, DATA_RAM);
	end
end	
endmodule