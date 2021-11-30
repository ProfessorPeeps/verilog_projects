/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #5			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Scalable Multiplexer									 	  ***
 ********************************************************************
 *** Filename: scale_mux.v		 Created By Juan Silva 2/28/19 	  ***
 ***														   	  ***
 ********************************************************************
 *** This module will serve as a scalable multiplexer. The default***
 *** size of the MUX will be two one-bit inputs with a one-bit    ***
 *** output. The select line will determine which input will be   *** 
 *** be output. If the select line were unknown, it will check for***
 *** matching bits and resolve any mismatched bit with an unknown ***
 ********************************************************************/

`timescale 1 ns / 1 ns

module scale_mux(A, B, SEL, OUT);
parameter SIZE = 1;

//Output of parametrized MUX
output [SIZE - 1: 0] OUT;
reg [SIZE - 1: 0] OUT;

//Input of parametrized MUX
input [SIZE - 1: 0] A, B; 
input SEL;

always @(A or B or SEL) begin
	
	OUT = SEL ? A : B;		//ternary, select A, B, or X
end	

endmodule