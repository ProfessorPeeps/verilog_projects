/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #6			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Carry Select Adder										 	  ***
 ********************************************************************
 *** Filename: fullAdder.v		 	Created By Juan Silva 4/20/19 ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/

`timescale 1 ns / 1 ns

module fullAdder(C_OUT, SUM, A, B, C_IN);

output C_OUT, SUM;
reg C_OUT, SUM;

input A, B, C_IN; 

//Assign gate delays to FA
specify 
	(A,B *> SUM) = 6;
	(A,B,C_IN *> C_OUT) = 2;
	(C_IN => SUM) = 3;
endspecify

always @(A or B or C_IN) begin
	
	{C_OUT, SUM} = A + B + C_IN;
	
end	

endmodule