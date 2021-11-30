/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #3			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Hierarchical Modeling					 	 				  ***
 ********************************************************************
 *** Filename: SR_Latch.v		 Created By Juan Silva 2/7/19  	  ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/

`timescale 1 ns / 10 ps

`define time_delay_1 	1
`define time_delay_2 	2
`define time_delay_3 	3
`define fan_out_1		0.4
`define fan_out_2		0.7
`define fan_out_3		1.0
`define prim_out_delay	5

module SR_Latch(Q, Q_BAR, s0, s1, r0, r1);
//port declarations
	output Q, Q_BAR;
	input s0, s1, r0, r1;
		
//netlists
	nand #(`time_delay_3 + `prim_out_delay) nand1(Q, s0, s1, Q_BAR);
	nand #(`time_delay_3 + `prim_out_delay) nand2(QBAR, Q, r1, s0);
	
endmodule