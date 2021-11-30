/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #6			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Carry Select Adder										 	  ***
 ********************************************************************
 *** Filename: Carry_Sel_Adder_2bit.v							  ***		
 ***								Created By Juan Silva 3/14/19 ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/

`timescale 1 ns / 1 ns

module Carry_Sel_Adder_2bit(C_OUT, SUM, A, B, C_IN);

output [1:0] C_OUT; 
output [1:0] SUM;
input [1:0] A, B; 			//data inputs
input C_IN;					//Carry and select for MUX

wire c_out1, c_out2;
wire s0, s1, s2, s3;

	//first pair of FAs with MUX1
	fullAdder fa1(c_out1, s0, A[0], B[0], 1'b1);
	fullAdder fa2(c_out2, s1, B[0], A[0], 1'b0);
	MUX2_1 mux1(SUM[0], s0, s1, C_IN);
	
	//Second pair of FAs with MUX2
	fullAdder fa3(C_OUT[1], s2, A[1],  B[1], c_out1);
	fullAdder fa4(C_OUT[0], s3, B[1],  A[1], c_out2);
	MUX2_1 mux2(SUM[1], s2, s3, C_IN);	

endmodule