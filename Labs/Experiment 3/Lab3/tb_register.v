/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #3			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Hierarchical Modeling				 						  ***
 ********************************************************************
 *** Filename: SR_Latch.v		 Created By Juan Silva 2/7/19  	  ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/

`timescale 1 ns / 1 ns 
module tb_register();
//port declarations
	reg [7:0] DATA;
	reg CLK, ENA, RST;
	wire [7:0] R;
	
	register UUT(R, CLK, DATA, ENA, RST); 

	initial 
		CLK = 1'b0;
	always
		#10 CLK = ~CLK;
	
	initial begin 
		$monitorb("%d R = %b D = %b	 CLK = %b", $time, R, DATA, CLK);
	end
	
	
	initial begin 
		
		//enable low: do nothing
		#10 ENA = 1'b0; DATA = 8'b0; 
		$display("%d %b  %b  %b %b", $time, R, DATA, ENA,CLK);			 
		#10 ENA = 1'b1; DATA = 8'b1111111;	
		$display("%d %b  %b  %b %b", $time, R, DATA, ENA,CLK);	
		#10 RST = 1'b0; DATA = 8'b0;
		
	#10 $finish;
	end	
endmodule