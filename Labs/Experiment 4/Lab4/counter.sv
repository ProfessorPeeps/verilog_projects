/*****************************************************************
 ***														   ***
 *** ECE526 L Experiment #4 		   Juan Silva, Spring 2019 ***
 *** 														   ***
 *** Behavioral Modeling of a Counter 	 			   		   ***
 *****************************************************************
 *** Filename: counter.sv		Created by Juan Silva, 3/7/19  ***
 ***														   ***
 *****************************************************************
 *** This lowlevel module will define the behavior of a counter*** 	   													   
 *** Using conditional statements, the counter will load data  ***
 *** when the ENA input is applied high. When ENA is high, the ***	
 *** counter will either load data if LDA is high or count     ***
 *** otherwise. If ENA is low, the counter will retain its     ***
 *** previous value. At any moment, if RST is low, the counter ***
 *** must reset regardless of its state.					   ***
 *****************************************************************/
 
`timescale 1 ns / 1 ns

module counter(count, data, CLK, RST, ENA, LOAD);

	output reg [4:0] count;							
	input [4:0] data;
	input CLK, RST, ENA, LOAD;
	
	//Define behavior of Counter
	
always @(posedge CLK or negedge RST) begin	
		
		if(!RST)							//Reset counter
			count = 5'b0;
			
		else if(ENA) begin
			if(LOAD)						//LOAD = 1
				count = data;	 			//load data to count
			else							//LOAD = 0
				count = count + 5'b0_0001;	//increment count	
			end
		else								//ENA = 0
		count = count; 						//hold count
end
endmodule	