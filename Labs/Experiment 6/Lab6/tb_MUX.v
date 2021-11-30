/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #6			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Carry Select Adder										 	  ***
 ********************************************************************
 *** Filename: tb_fullAdder.v		Created By Juan Silva 3/14/19 ***
 ***														   	  ***
 ********************************************************************
 *** ***

 ********************************************************************/
 
module tb_MUX();
 
wire OUT;
reg X, Y, SEL; 

	MUX2_1 UUT(X, Y, SEL, OUT);
	
	initial begin
		$monitorb("%d OUT = %b", $time, OUT);
	end
	
	initial begin
		$vcdpluson; 
		
		$write("\n");
			X = 0; Y = 1; SEL = 0;
		$display("\n%d X = %b  Y = %b  SEL = %b", $time, X, Y, SEL);	
		
		#5	X = 0; Y = 1; SEL = 1;
		$display("\n%d X = %b  Y = %b  SEL = %b", $time, X, Y, SEL);	
		
		#5	X = 0; Y = 1; SEL = 1'bx;
		$display("\n%d X = %b  Y = %b  SEL = %b", $time, X, Y, SEL);	
		
		#5	X = 0; Y = 0;
		$display("\n%d X = %b  Y = %b  SEL = %b", $time, X, Y, SEL);
		#5 $write("\n");		
		#5 $finish;
	end
endmodule
	