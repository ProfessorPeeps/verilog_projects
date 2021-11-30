/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #6			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Carry Select Adder										 	  ***
 ********************************************************************
 *** Filename: tb_6bit_exhaustive.v								  ***	
 ***								Created By Juan Silva 4/20/19 ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/

`timescale 1 ns / 1 ns
 
module tb_6bit_exhaustive();

wire [5:0] SUM;
wire C6;
reg [5:0] A, B; 						//data inputs
reg C0; 								//Carry and select for MUX

integer i,j;							//index for loop
integer count = 0;

	Carry_Sel_Adder UUT(C6, SUM, A, B, C0);

	initial begin
		$monitorb("%d C6 = %b  SUM = %d", $time, C6, SUM);
	end
	
	initial begin
		$vcdpluson; 
		
		$write("\n\t\t   Exhaustive case:\n");
		
		//Initialize loop for no carry vectors
		A = 6'b0; B = 6'b0; C0 = 1'b0;
		
		#1 $write("\n\t\t   Display first and last twelve vectors with carry off.\n");
		
		for (i = 0; i < 64; i = i + 1) begin			//increment A 			
			for(j = 0; j < 64; j = j + 1) begin			//increment B
				#5 B = B + 1;
				
				//Display first dozen and last dozen for B
				if(i <= 6 && j <= 6) begin	
					#1 $monitoron;
					#1 $display("\n%d A = %d  B = %d  C0 = %b", $time, A, B, C0);
				end	
				else if(i >= 58 && j >= 58) begin
	
					#1 $monitoron;
					
					#300 force SUM = 0;
					#300 release SUM;
					
					#4 $display("\n%d A = %d  B = %d  C0 = %b", $time, A, B, C0);
				end	
				else
					#1 $monitoroff;
			end
			#5 A = A + 1;
		end

		//Initialize loop for carry vectors
		A = 6'b0; B = 6'b0; C0 = 1'b1;
		
		#1 $write("\n\n\t\tDisplay first and last twelve vectors with carry on:\n\n");
		
		for (i = 0; i < 64; i = i + 1) begin			//increment A 			
			for(j = 0; j < 64; j = j + 1) begin			//increment B
				#5 B = B + 1;
				
				//Display first dozen and last dozen for B
				if(i <= 6 && j <= 6) begin	
					#1 $monitoron;
					#1 $display("\n%d A = %d  B = %d  C0 = %b", $time, A, B, C0);
				end	
				else if(i >= 58 && j >= 58) begin
					#1 $monitoron;
					#300 force SUM = 0;
					#300 release SUM;		
					
					#4 $display("\n%d A = %d  B = %d  C0 = %b", $time, A, B, C0);
				end	
				else
					#1 $monitoroff;
			end
			#5 A = A + 1;
		end		

		#10 $finish;  
	end
endmodule