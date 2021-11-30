/*****************************************************************
 ***														   ***
 *** ECE526 L Experiment #4 		   Juan Silva, Spring 2019 ***
 *** 														   ***
 *** Behavioral Modeling of a Counter 	 			   		   ***
 *****************************************************************
 *** Filename: AASD.sv		Created by Juan Silva, 3/7/19  	   ***
 ***														   ***
 *****************************************************************
 *** This lowlevel module will define the behavior of an AASD  ***
 *** The input to this two stage D flip flop will be reset. At ***
 *** every clock cycle, if reset is applied, it is recieved at ***
 *** the input of the first D FF, delayed and placed into the  ***
 *** output of the second flipflop. This new value will be the ***
 *** stable asynchronous reset to be used for the top level    ***
 *** counter module.                                           ***
 *****************************************************************/
 `timescale 1 ns / 1 ns
 
 module AASD(aasd_rst, clk, rst);
 
 output logic aasd_rst;
 input clk, rst;
 
 reg q1;
 
	always @(posedge clk or negedge rst)

		if(!rst) begin
			q1 <= 0;
			aasd_rst <= 0;
		end
	else begin
		q1 <= 1;
		aasd_rst <= q1;
	end	
endmodule