/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #6			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Carry Select Adder										 	  ***
 ********************************************************************
 *** Filename: tb_6bit.v		Created By Juan Silva 3/14/19 	  ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/
 
 `timescale 1 ns / 1 ns
 
module tb_6bit();

wire [5:0] SUM;
wire C6;
reg [5:0] A, B; 			//data inputs
reg C0; 					//Carry and select for MUX

	Carry_Sel_Adder UUT(C6, SUM, A, B, C0);

	initial begin
		$monitorb("%d C6 = %b  SUM = %b", $time, C6, SUM);
	end
	
	initial begin
		$vcdpluson; 
		
		$write("\n");
		
		//Default condition
		#10 $write("\n\t\t  Test for default: ");
		#10 A = 6'b00_0000; B = 6'b00_0000; C0 = 0; 
		$display("\n%d A = %b  B = %b  C0 = %b", $time, A, B, C0);
		
		//Carry test
		#10 $write("\n\t\t  Test for carry:");
		#10 A = 6'b00_0000; B = 6'b00_0001; C0 = 0; 
		$display("\n%d A = %b  B = %b  C0 = %b", $time, A, B, C0);
		
		//Test for single-bit addition w/o carry
		#10 $write("\n\t\t  Test for (8 + 5 + 0):");
		#10 A = 6'b00_1000; B = 6'b00_0101; C0 = 0; 
		$display("\n%d A = %b  B = %b  C0 = %b", $time, A, B, C0);
		
		//Test for single-bit addition w/ carry
		#10 $write("\n\t\t  Test for (8 + 5 + 1):");
		#10 A = 6'b00_1000; B = 6'b00_0101; C0 = 1; 
		$display("\n%d A = %b  B = %b  C0 = %b", $time, A, B, C0);
		
		//Test for multi-bit addition w/o carry (C6 outputs 0)
		#10 $write("\n\t\t  Test for (28 + 11 + 0):");
		#10 A = 6'b01_1100; B = 6'b00_1011; C0 = 0; 
		$display("\n%d A = %b  B = %b  C0 = %b", $time, A, B, C0);
		
		//Test for multi-bit addition w carry (C6 outputs 0)
		#10 $write("\n\t\t  Test for (28 + 11 + 1):");
		#10 A = 6'b01_1100; B = 6'b00_1011; C0 = 1; 
		$display("\n%d A = %b  B = %b  C0 = %b", $time, A, B, C0);
		
		//Test for multi-bit addition w/o carry (C6 outputs 1)
		#10 $write("\n\t\t  Test for (57 + 26 + 0):");
		#10 A = 6'b11_1001; B = 6'b01_1010; C0 = 0; 
		$display("\n%d A = %b  B = %b  C0 = %b", $time, A, B, C0);
		
		//Test for multi-bit addition w/ carry (C6 outputs 1)
		#10 $write("\n\t\t  Test for (57 + 26 + 1):");
		#10 A = 6'b11_1001; B = 6'b01_1010; C0 = 1; 
		$display("\n%d A = %b  B = %b  C0 = %b", $time, A, B, C0);
		
		#10 $write("\n");
		#5 $finish;  
	end
endmodule