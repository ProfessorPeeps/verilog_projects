/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #3			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Structural Modeling of a JK Flip-Flop					 	  ***
 ********************************************************************
 *** Filename: SR_Latch.v		 Created By Juan Silva 2/7/19  	  ***
 ***														   	  ***
 ********************************************************************
 *** This 2-input MUX module will receive two single-bit inputs   ***
 *** A & B, a single-bit select input SEL and output a single-bit ***
 *** output. 											  		  ***
 ********************************************************************/

`timescale 1 ns / 1 ns 
module tb_SR();
//port declarations
	reg s0, s1, r0, r1;
	wire Q, Q_BAR;
	
	SR_Latch UUT(Q, Q_BAR, s0, s1, r0, r1);
	
	initial begin
		$monitorb("%d Q = %b Q_ = %b", $time, Q, Q_BAR);
	end

	initial begin
	
	#30 s0 = 1'b0; s1 = 1'b0; r0 = 1'b0; r1 = 1'b0;
	#30 s0 = 1'b0; s1 = 1'b0; r0 = 1'b1; r1 = 1'b1;
	#30 s0 = 0; s1 = 0; r0 = 1; r1 = 1;
	#30 s0 = 0; s1 = 1; r0 = 0; r1 = 1;
	#30 s0 = 1; s1 = 0; r0 = 1; r1 = 0;
	
	#10 $finish;
	end
endmodule