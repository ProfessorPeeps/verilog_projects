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

`timescale 1 ns/ 1 ns 

module MUX2_1(OUT, A, B, SEL);
//Port declarations
	output OUT;
	input A, B, SEL; 
	
//Internal variable declarations
	wire A1, B1, SEL_N; 

//Netlist
	not (SEL_N, SEL);		//SEL_N is complement of SEL
	and (A1, A, SEL_N);
	and (B1, B, SEL);
	or (OUT, A1, B1);
endmodule