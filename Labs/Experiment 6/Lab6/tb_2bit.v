/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #6			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Carry Select Adder										 	  ***
 ********************************************************************
 *** Filename: tb_2bit.v			Created By Juan Silva 3/14/19 ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/
 
module tb_2bit();

wire [1:0] C_OUT, SUM;
reg [1:0] A, B; 
reg C_IN;

	Carry_Sel_Adder_2bit UUT(C_OUT, SUM, A, B, C_IN);

	initial begin
		$monitorb("%d C_OUT = %b  SUM = %b", $time, C_OUT, SUM);
	end
	
	initial begin
		$vcdpluson; 
		
		$write("\n");	
		
		//Test for one-bit addition
		#10 $write("\n\t\t  Test for default: ");
		#10 A = 2'b00; B = 2'b00; C_IN = 0; 
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		#10 $write("\n\t\t  Test for carry:");
		#10 A = 2'b00; B = 2'b00; C_IN = 1; 
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		#10 $write("\n\t\t  Test for (1+0+0):");
		#10 A = 2'b01; B = 2'b00; C_IN = 0;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		#10 $write("\n\t\t Test for (0+1+1):");
		#10 A = 2'b00; B = 2'b01; C_IN = 1;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		#10 $write("\n\t\t Test for (1+1+0):");
		#10 A = 2'b01; B = 2'b01; C_IN = 0;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		#10 $write("\n\t\t Test for (1+1+1):");
		#10 A = 2'b01; B = 2'b01; C_IN = 1;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		//Test for two-bit addition
		#10 $write("\n\t\t Test for (1+2+0):");
		#10 A = 2'b01; B = 2'b10; C_IN = 0;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
	
		#10 $write("\n\t\t Test for (2+1+1):");
		#10 A = 2'b10; B = 2'b01; C_IN = 1;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		#10 $write("\n\t\t Test for (3+3+0):");
		#10 A = 2'b11; B = 2'b11; C_IN = 0;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
	
		#10 $write("\n\t\t Test for (3+3+1):");
		#10 A = 2'b11; B = 2'b11; C_IN = 1;
		$display("\n%d A = %b  B = %b  C_IN = %b", $time, A, B, C_IN);
		
		#5 $write("\n");
		#5 $finish;  
	end
endmodule