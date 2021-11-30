/*****************************************************************
 ***														   ***
 *** ECE526 L Experiment #4 		   Juan Silva, Spring 2019 ***
 *** 														   ***
 *** Behavioral Modeling of a Counter 	 			   		   ***
 *****************************************************************
 *** Filename: tb_counter.v		Created by Juan Silva, 3/7/19  ***
 ***														   ***
 *****************************************************************
 *** This testbench will test the validity of a counter using  *** 	   													   
 *** vectors that will apply an asynchronous reset, load 	   ***
 *** values and count values that are loaded. There will also  ***
 *** be cases demonstrating the priority of the reset input as ***
 *** well as checking that the counter will not or count if    ***	
 *** the enable input is disabled.							   ***	
 *****************************************************************/
 
`timescale 1 ns / 1 ns
 
module tb_counter();

wire [4:0] count;
reg [4:0] data;
reg CLK, LOAD, ENA, RST;

	top_counter UUT(count, data, CLK, RST, ENA, LOAD);
	
	initial
		CLK = 0;
		
	initial
		$monitorb("%d  COUNT = %b", $time, count);
		
	always
		#10 CLK = ~CLK;

	initial begin
		$vcdpluson;
		
		//Apply reset
		$write("\nReset counter to default: \n");
		#5 RST = 0; ENA = 0; LOAD = 0; data = 5'b0_1111;	
		$display("%d ENA = %b  DATA = %b RST = %b  CLK = %b", $time, ENA, data, RST, CLK);
		
		//Disable reset and load value 1
		$write("\nDisable reset, enable counter, and load data: \n");		
		#5 RST = 1; ENA = 1; LOAD = 1;	data = 5'b0_0001;	
		$display("%d  ENA = %b  DATA = %b RST = %b  CLK = %b", $time, ENA, data, RST, CLK);
		
		//Start count at stop when count is 5
		$write("\nDisable load to increment until counter equals 5: \n");		
		$display("%d ENA = %b  DATA = %b RST = %b  CLK = %b", $time, ENA, data, RST, CLK);
		#5 RST = 1; ENA = 1; LOAD = 0;	data = 5'b0_0001;	
		#130
		
		//Stop count and load value 28 and count 
		$write("\nEnable parallel loading of value 28 and count: \n");
		$display("%d  ENA = %b  DATA = %b RST = %b  CLK = %b", $time, ENA, data, RST, CLK);
		#5 RST = 1; ENA = 1; LOAD = 1;	data = 5'b1_1100;	
		#5 RST = 1; ENA = 1; LOAD = 0;	data = 5'b1_1111;		
		#180
		
		//Reset override
		$write("\nShow that reset overrides load: \n");
		#5 RST = 0; ENA = 1; LOAD = 1; data = 5'b0_1111;
		$display("%d  ENA = %b  DATA = %b RST = %b  CLK = %b", $time, ENA, data, RST, CLK);		

		#20 $write("\nShow that reset overrides count: \n");
		#5 RST = 0; ENA = 1; LOAD = 0;
		$display("%d  ENA = %b  DATA = %b RST = %b  CLK = %b", $time, ENA, data, RST, CLK);		
		#10 $display("%d  COUNT = %b", $time, count);
		
		//Disable enable and try to load or count
		$write("\nShow that enable low does not load or count: \n");
		#5 RST = 1; ENA = 0; LOAD = 1; data = 5'b1_0101;
		$display("%d  ENA = %b  DATA = %b RST = %b  CLK = %b", $time, ENA, data, RST, CLK);
		
		$display("%d  COUNT = %b", $time, count);
		#5 RST = 1; ENA = 0; LOAD = 0;
		$display("%d  ENA = %b  DATA = %b RST = %b  CLK = %b", $time, ENA, data, RST, CLK);
		$display("%d  COUNT = %b", $time, count);
		#5 $finish;
	end
endmodule
	