/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #7			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Register File Models										  ***
 ********************************************************************
 *** Filename: tb_register.v		Created By Juan Silva 5/1/19  ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/

 `timescale 1 ns / 1 ns
 
module tb_register();

parameter DATA_SIZE = 8;			
parameter ADDR_SIZE = 5;	

wire [DATA_SIZE - 1:0] DATA_RAM, DATA_REG;		//bi-directional data
reg [DATA_SIZE - 1:0] DATA_IN;			//if data is input, behave as register
reg [ADDR_SIZE - 1 :0] ADDR;			//create an array for memory
reg OE, WS, CS;

integer i, index;

//Read if WS = 1, Enable Out if WS = 0
assign DATA_RAM = DATA_REG;
assign DATA_REG = (WS) ? 'z : DATA_IN; 

RAM UUT(DATA_RAM, ADDR, OE, WS, CS);

initial begin
	$vcdpluson;
	
	$monitorb("%d ADDR = %d  OE = %b  WS = %b  CS = %b  DATA = %b  reg = %b\n", $time, ADDR, OE, WS, CS, DATA_RAM, UUT.MEMORY[ADDR]);
	
	//Initial conditions
	DATA_IN = 1'b0; ADDR = 0;
	OE = 1'b0; WS = 1'b0; CS = 1'b0;
	
	//Write to RAM sequentially
	for(i = 0; i < 32; i = i + 1) begin
		#20 ADDR = i; DATA_IN = i;
		#10 WS = 1'b1;
		#10 WS = 1'b0;
	end
	
	//Read from RAM	
	$write("Read from RAM\n");
	ADDR = 0; DATA_IN = 'z;
	
	for(i = 0; i < 32; i = i + 1) begin
		#20 ADDR = i;
		#10 OE = 1'b1;
		#10 OE = 1'b0;
	end	
	
	#20 index = 0; ADDR = 0; DATA_IN = 0;
	
	//Write hot ones
	for(i = 0; i < 32; i = i + 1) begin
		
		index = (index > 5) ? 0 : index + 1; 
		#20 ADDR = i; DATA_IN = 2 ** index;		//start at LSB and end at MSB
		#10 WS = 1'b1;
		#10 WS = 1'b0;
	end
	
	$write("Read ones written to RAM");
	//Read ones
	for(i = 0; i < 32; i = i + 1) begin
		
		#10 ADDR = i;
		
	end
	#10 $finish;
end	
endmodule