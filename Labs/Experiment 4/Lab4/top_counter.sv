/*****************************************************************
 ***														   ***
 *** ECE526 L Experiment #4 		   Juan Silva, Spring 2019 ***
 *** 														   ***
 *** Behavioral Modeling of a Counter 	 			   		   ***
 *****************************************************************
 *** Filename: top_counter.v	Created by Juan Silva, 3/7/19  ***
 ***														   ***
 *****************************************************************
 *** This top level module will instantiate the two lower level*** 	   													   
 *** modules necessary to construct a counter with an AASD.	   ***
 *****************************************************************/

`timescale 1 ns / 1 ns

module top_counter(count, data, CLK, RST, ENA, LOAD);

output [4:0] count;
input [4:0] data;
input CLK, LOAD, ENA, RST;
wire aasd_rst;

	AASD aasd1(aasd_rst, CLK, RST);
	counter c1(count, data, CLK, aasd_rst, ENA, LOAD);
		
endmodule