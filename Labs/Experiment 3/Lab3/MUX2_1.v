/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #1			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Familiarization with Linux and the Synopsis VCS Simulator 	  ***
 ********************************************************************
 *** Filename: MUX2_1.v			 Created By Juan Silva 2/7/19  	  ***
 ***														   	  ***
 ********************************************************************
 *** This 2-input MUX module will receive two single-bit inputs   ***
 *** A & B, a single-bit select input SEL and output a single-bit ***
 *** output. 											  		  ***
 ********************************************************************/

`timescale 1 ns/ 10 ps

`define time_delay_1 	1
`define time_delay_2 	2
`define time_delay_3 	3
`define fan_out_1		0.4
`define fan_out_2		0.7
`define fan_out_3		1.0
`define prim_out_delay	5

module MUX2_1(OUT, A, B, SEL);
//Port declarations
	output OUT;
	input A, B, SEL;
	
//Internal variable declarations
	wire A1, B1, SEL_N;		

//Netlist
	not #(`time_delay_1 + `fan_out_1) (SEL_N, SEL);		//SEL_N is complement of SEL
	and #(`time_delay_2 + `fan_out_1) (A1, A, SEL_N);
	and #(`time_delay_2 + `fan_out_1) (B1, B, SEL);
	or #(`time_delay_2 + `fan_out_3) (OUT, A1, B1);
endmodule