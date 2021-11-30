/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #2			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Structural Modeling of a JK Flip-Flop					 	  ***
 ********************************************************************
 *** Filename: JK_FF.v			 Created By Juan Silva 2/21/19    ***
 ***														   	  ***
 ********************************************************************
 *** This module will serve as a JK flip using structural 		  ***
 *** primitives. Gate delays are included to model real integrated***
 *** circuit design. 											  ***
 ********************************************************************/

`timescale 1 ns / 10 ps

`define time_delay_1 1.5	//delay for 2 input gate
`define time_delay_2 2.5	//delay for 3 input gate
`define time_delay_3 3.5	//delay for 4 input gate

`define fanout_1	 1		//delay for 1 fanout
`define fanout_2	 2		//delay for 2 fanout 
`define fanout_3	 3		//delay for 3 fanout
`define fanout_4	 4		//delay for primary output

module JK_FF(Q, Q_BAR, J, K, CP, SD, RD);
//port declarations
	output Q, Q_BAR;
	input J, K, CP, SD, RD;
	
//internal variable declarations
	wire a1, a2, nr, n1, n2, n3;
	
//netlists
//Stage 1 Block
	and 	#(`time_delay_3 + `fanout_1) and1(a1, J, Q_BAR, RD, n3);
	and 	#(`time_delay_3 + `fanout_1) and2(a2, Q,K, RD, n3);
//Stage 2 Block	
	nand 	#(`time_delay_2 + `fanout_1) nand1(n1, n2,SD, nr);
	nor 	#(`time_delay_1 + `fanout_2) nor1(nr, a1,a2);
//Stage 3 Block
	nand 	#(`time_delay_2 + `fanout_3) nand2(n2, n1, CP, RD);
	nand	#(`time_delay_2 + `fanout_2) nand3(n3, n2, CP, nr);
//Stage 4 Block
	nand 	#(`time_delay_2 + `fanout_4) nand4(Q, SD, n2, Q_BAR);
	nand 	#(`time_delay_2 + `fanout_4) nand5(Q_BAR, Q, n3, RD);
	
endmodule