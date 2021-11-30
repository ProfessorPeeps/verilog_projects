/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #6			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Carry Select Adder										 	  ***
 ********************************************************************
 *** Filename: Carry_Sel_Adder.v	Created By Juan Silva 4/20/19 ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/

`timescale 1 ns / 1 ns

module Carry_Sel_Adder(C6, SUM, A, B, C0);

output [5:0] SUM;
output C6;
input [5:0] A, B; 			//data inputs
input C0;					//Carry and select for MUX

wire c1, c2, c4;			//intermediary carries
wire [1:0] C1_OUT, C2_OUT;	//temporary carry at ooutput of each stage

	//Full Adder Pairs Stage
	fullAdder fa1(c1, SUM[0], A[0], B[0], C0);
	fullAdder fa2(c2, SUM[1], A[1], B[1], c1);
	
	//2-bit adder (medium module) Stage 1 
	Carry_Sel_Adder_2bit csa1(C1_OUT[1:0], SUM[3:2], A[3:2], B[3:2], c2);
	MUX2_1 mux1(c4, C1_OUT[1], C1_OUT[0], c2);
	
	
	//2-bit adder (medium module) Stage 1 
	Carry_Sel_Adder_2bit csa2(C2_OUT[1:0], SUM[5:4], A[5:4], B[5:4], c4);
	MUX2_1 mux2(C6, C2_OUT[1], C2_OUT[0], c4);		

endmodule