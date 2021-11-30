/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #3			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Hierarchical Modeling				 	 					  ***
 ********************************************************************
 *** Filename: D_FF.v		 Created By Juan Silva 2/7/19  	  	  ***
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

module D_FF(q, q_bar, clock, data, clear);
//port declarations
	output q, q_bar;
	input clock, data, clear;

//wires	
	wire cbar, clr, clk, clkbr, dbar, d, sbar, s, r, rbar, g1, g2;
	
//netlists

	//Delay for clear
	not #(`time_delay_1 + `fan_out_1) n1(cbar, clear);
	not #(`time_delay_1 + `fan_out_1) n2(clr, cbar);
	
	//Delay for clock
	not #(`time_delay_1 + `fan_out_1) n3(clkbar, clock);
	not #(`time_delay_1 + `fan_out_1) n4(clock, clkbar);
	
	//Delay for clock
	not #(`time_delay_1 + `fan_out_1) n5(dbar, data);
	not #(`time_delay_1 + `fan_out_1) n6(d, dbar);
	
	//Instantiate SR Latch 3 times
	SR_Latch sr1(s, sbar, rbar, g1, clr, clk);
	SR_Latch sr2(r, rbar, s, clk, clr, d);
	SR_Latch sr3(q, q_bar, s, g2, clr, r);
	
endmodule