/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #7			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Register File Models										  ***
 ********************************************************************
 *** Filename: RAM.sv		 	Created By Juan Silva 5/1/19 	  ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/

`timescale 1 ns / 1 ns

module RAM(DATA, ADDR, OE, WS, CS);

parameter DATA_SIZE = 8;				//Data is 8 bits
parameter ADDR_SIZE = 5;					//Memory is 5 bits

inout [DATA_SIZE - 1:0] DATA;			//bi-directional data

input [ADDR_SIZE - 1 :0] ADDR;			//address line
input OE, WS, CS;						//output enable, write strobe, chip se

//Create an 8x32 memory 
reg [DATA_SIZE - 1:0] MEMORY [(2 ** ADDR_SIZE) - 1: 0];

//Set data to input for reading
assign DATA = (!CS && OE && !WS) ? MEMORY[ADDR] : 'bz;

//Select data from the memory address 
always @(WS, OE, CS) begin
	if(!CS && !OE) @ (posedge WS)
		MEMORY[ADDR] = DATA;
end
endmodule