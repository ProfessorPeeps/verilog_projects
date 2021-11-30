/*****************************************************************
 ***														   ***
 *** ECE526 L Experiment #1			   Juan Silva, Spring 2019 ***
 *** 														   ***
 *** Familiarization with Linux and the Synopsis VCS Simulator ***
 *****************************************************************
 *** Filename: tb_MUX2_1.v		 Created by Juan Silva, 2/7/19 ***
 ***														   ***
 *****************************************************************
 *** This testbench is provided to test some cases for the 	   ***
 *** 2-input MUX. 											   *** 														
 *****************************************************************/

`timescale 1 ns / 1 ns
 
module tb_MUX2_1();
	reg A, B, SEL; 
	wire OUT;		

	MUX2_1 UUT(OUT, A, B, SEL); 
	
	initial
	$monitorb("%d out = %b a = %b b = %b sel = %b", $time, OUT, A, B, SEL);
	
	initial begin
		$vcdpluson;

		A = 0; B = 1; SEL = 1'bx;
		#10 A = 1; B = 1; SEL = 1'bx;
		#20 A = 0; B = 1; SEL = 0;
		#20 SEL = 1;
		#10 A = 1; B = 1; SEL = 0;
		#20 $finish;
	end
endmodule