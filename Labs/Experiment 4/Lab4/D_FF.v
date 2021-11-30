/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #4			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Behaviorial Modeling of a Counter						 	  ***
 ********************************************************************
 *** Filename: counter.v		 Created By Juan Silva 2/21/19 	  ***
 ***														   	  ***
 ********************************************************************
 ***  ***
 ***  ***
 ***  											  		  ***
 ********************************************************************/

`timescale 1 ns / 1 ns

module D_FF(Q, Q_BAR, RST, CLK, D);

output Q, Q_BAR;
input RST, CLK, D;
reg Q, Q_BAR;
		
	always @(posedge CLK or negedge RST) begin
		
		if(!RST)
			Q <= 1'b0;
		else
			Q <= D;
	end
endmodule