/**********************************************************************
 ***														   		***
 *** EE 526 L Experiment #1			   Juan Silva, Spring 2019 		***
 *** 														   		***
 *** Familiarization with Linux and the Synopsis VCS Simulator 		***
 **********************************************************************		
 *** Filename: tb_MUX2_1_exhaust.v	Created by Juan Silva, 2/7/19	***
 ***																***
 **********************************************************************
 *** This testbench is modified to exhaustively test the			***
 *** functionality of this 2-input MUX. The unknown value X and 	***
 *** high impedance value Z are monitored for this test.			***							
 **********************************************************************/

`timescale 1 ns / 1 ns
 
module tb_MUX2_1_exhaust();
	reg A, B, SEL, X, Z;
	wire OUT;		

	MUX2_1 UUT(OUT, A, B, SEL); 
	
	initial
	$monitorb ("%d out = %b a = %b b = %b sel = %b x = %b z = %b", $time, OUT, A, B, SEL, X, Z);
	
	initial begin
		$vcdpluson;
		
		/* Choose LSB value SEL and interchange the higher bits to get 4 combinations.
		   There should be 16 cases with 4 combinations to equal 64 possible combinations. 
		*/
		
		//case 1
		#10 A = 0; B = 0; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
		
		//case 2
		#10 A = 0; B = 1; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;

		//case 3
		#10 A = 1; B = 0; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
		
		//case 4
		#10 A = 1; B = 1; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
	
		//case 5
		#10 A = 1'bx; B = 0; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
		
		//case 6
		#10 A = 0; B = 1'bx; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
		
		//case 7
		#10 A = 1'bx; B = 1; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
		
		//case 8
		#10 A = 1; B = 1'bx; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
	
		//case 9
		#10 A = 1'bx; B = 1'bx; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
		
		//case 10
		#10 A = 1'bx; B = 1'bz; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;

		//case 11
		#10 A = 1'bz; B = 0; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
		
		//case 12
		#10 A = 0; B = 1'bz; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
	
		//case 13
		#10 A = 1'bz; B = 1; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
		
		//case 14
		#10 A = 1; B = 1'bz; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
		
		//case 15
		#10 A = 1'bz; B = 1'bz; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;
		
		//case 16
		#10 A = 1'bz; B = 1'bx; SEL = 0;
		#10 SEL = 1;
		#10 SEL = 1'bx;
		#10 SEL = 1'bz;	
	
		#10 $finish;
	end
endmodule