/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #9		   Juan Silva, Spring 2019   	  ***
 *** 														   	  ***
 *** Modeling a Sequencer Controller							  ***
 ********************************************************************
 *** Filename: phaser.sv		 	Created By Juan Silva 5/1/19 ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/
 
`timescale 1 ns / 1 ns
 
module phaser(CLK, RST, EN, PHASE);

output PHASE;
input CLK, RST, EN;

//Define all possible values for phase
typedef enum reg [1:0] {FETCH = 2'b00, DECODE = 2'b01, 
EXEC = 2'b10, UPDATE = 2'b11} STATES;

output STATES PHASE;

//initialize
AASD aasd1(aasd_rst, CLK, RST);

always_ff @(posedge CLK or negedge RST)
	if(!RST) 
		PHASE <= FETCH;
	else if(EN) begin
		case(PHASE)
			FETCH: PHASE <= DECODE;
			DECODE: PHASE <= EXEC;
			EXEC: PHASE <= UPDATE;
			UPDATE: PHASE <= FETCH;
		default: PHASE <= FETCH;
		endcase
		
	end
endmodule