/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #6			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Register File Models									 	  ***
 ********************************************************************
 *** Filename: ROM.sv		 	Created By Juan Silva 5/1/19 	  ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/

`timescale 1 ns / 1 ns

module ROM(DATA, ADDR, OE, CS);

parameter DATA_SIZE = 8;			
parameter ADDR_SIZE = 5;			

output reg[DATA_SIZE - 1: 0] DATA;		//8 bit data
input [ADDR_SIZE - 1 :0] ADDR;		//5 bit address line
input OE, CS;						//output enable, chip set

//Create an 8x32 memory 
reg [DATA_SIZE - 1:0] MEMORY [(2 ** ADDR_SIZE) - 1: 0];
 
//Read from ROM if chip set and output enabled. Otherwise, high Z 
always_comb
	DATA = (!CS && OE) ? MEMORY[ADDR] : 'z;
			
endmodule