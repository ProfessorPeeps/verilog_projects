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
 
module tb_FA();

wire C_OUT, SUM;
reg A, B, C_IN; 

	fullAdder UUT(A, B, C_IN, C_OUT, SUM);
	
	initial begin
		$monitorb("%d C_OUT = %b  SUM = %b", $time, C_OUT, SUM);
	end
	
	initial begin
		$vcdpluson; 
		
		$write("\n");
		#5 A = 0; B = 0; C_IN = 0;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);

		#5 A = 0; B = 0; C_IN = 1;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		#5 A = 0; B = 1; C_IN = 0;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		$display("%d C_OUT = %b  SUM = %b", $time, C_OUT, SUM);
		
		#5 A = 0; B = 1; C_IN = 1;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		#5 A = 1; B = 0; C_IN = 0;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		#5 A = 1; B = 0; C_IN = 1;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		#5 A = 1; B = 1; C_IN = 0;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		$display("%d C_OUT = %b  SUM = %b", $time, C_OUT, SUM);
		
		#5 A = 1; B = 1; C_IN = 1;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		#5 $write("\n");
		#10 $finish;
	end
endmodule