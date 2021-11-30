/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #5			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Scalable Mutilplexer									 	  ***
 ********************************************************************
 *** Filename: scale_mux.v		 Created By Juan Silva 2/28/19 	  ***
 ***														   	  ***
 ********************************************************************
 ***  This testbench will test the functionality of four sized    ***
 ***  MUXs in parallel. Four MUXs will be instantiated and 		  ***
 ***  assigned a size. A single test vector will be used for the  ***
 ***  largest MUX and the smalled MUXs will use the LSB of the	  ***
 ***  test vector. Three types of parameter of redefinition are   *** 
 ***  used to assign each size.	This will test for when SEL = X	  ***
 ***  to verify the resolution of conflicting bits				  ***
 ********************************************************************/

`timescale 1 ns / 1 ns

module tb_scale_mux();
parameter SIZE = 6;

//Output of parametrized MUX
wire [5:0] OUT1;
wire [4:0] OUT2;
wire [3:0] OUT3;
wire OUT4;

//Input of parametrized MUX
reg [SIZE - 1: 0] A, B; 
reg SEL;

	//instantiate each MUX and set width of each MUX
	
	//Resize MUX1 using parameter value assign with width = 6.
	scale_mux #(6) mux1(A[5:0], B[5:0], SEL, OUT1[5:0]);
		
	//Resize MUX2 using named parameter passing with width = 5.
	scale_mux #(.SIZE(5)) mux2(A[4:0], B[4:0], SEL, OUT2[4:0]); 
	
	//Resize MUX3 using defparam with width = 4.
	defparam mux3.SIZE = 4;
	scale_mux mux3(A[3:0], B[3:0], SEL, OUT3[3:0]); 	
	
	//Instantiate MUX4 with default width = 1.
	scale_mux mux4(A, B, SEL, OUT4);	
	
	initial begin
		$monitorb("%d  MUX1 = %b  MUX2 = %b  MUX3 = %b  MUX4 = %b", $time, OUT1, OUT2, OUT3, OUT4);
	end
	
	initial begin
		$vcdpluson;
		
		$write("\n \t\t  Initial Conditions: \n");	
		
		//SEL = 0
		#5 $write("\n\t\t  SEL = 0: \n");
		#5 SEL = 1'b0; A = 6'b10_1010; B = 6'b01_1110;	
		$display("%d  A = %b  B = %b  SEL = %b", $time, A, B, SEL);
		
		//SEL = 1
		#5 $write("\n\t\t  SEL = 1: \n");
		#5 SEL = 1'b1; A = 6'b10_1010; B = 6'b01_1110;	
		$display("%d  A = %b  B = %b  SEL = %b", $time, A, B, SEL);
		
		//SEL = X
		#5 $write("\n\t\t  SEL = X: \n");		
		#5 SEL = 1'bx; A = 6'b10_1010; B = 6'b01_1110;	
		$display("%d  A = %b  B = %b  SEL = %b", $time, A, B, SEL);
		
		#5 $write("\n");	
		#5 $finish;
	end	
endmodule