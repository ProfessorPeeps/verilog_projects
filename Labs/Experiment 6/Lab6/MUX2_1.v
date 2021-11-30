/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #6			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Carry Select Adder										 	  ***
 ********************************************************************
 *** Filename: MUX2_1.v		 	Created By Juan Silva 3/14/19 	  ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/

`timescale 1 ns / 1 ns

module MUX2_1(OUT, X, Y, SEL);

output OUT;
reg OUT;

input X, Y, SEL; 


//Assign gate delays to MUX
specify 
	(X,Y *> OUT) = 2;
	(SEL => OUT) = 3;
endspecify


always @(X or Y or SEL) begin
	
	OUT = SEL ? X : Y;		//ternary, select A, B, or X
end	

endmodule