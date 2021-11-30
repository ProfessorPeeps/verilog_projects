/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #9		   Juan Silva, Spring 2019   	  ***
 *** 														   	  ***
 *** Modeling a Sequencer Controller							  ***
 ********************************************************************
 *** Filename: tb_phaser.sv		 	Created By Juan Silva 5/9/19  ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/
 
`timescale 1 ns / 1 ns
 
module tb_phaser();

reg CLK, RST, EN;

typedef enum reg [1:0] {FETCH = 2'b00, DECODE = 2'b01, 
EXEC = 2'b10, UPDATE = 2'b11} STATES;

wire PHASE;

STATES TEST;

	sequencer UUT(ADDR, OPCODE, PHASE, OF, SF, ZF,
				  CF, INTF, IR_EN, A_EN, B_EN, PDR_EN, PORT_EN, 
				  PORT_RD, PC_EN, PC_LOAD, ALU_EN, ALU_OE, 
				  RAM_OE, RDR_EN, RAM_CS);
	
	phaser UUT_phase(CLK, RST, EN, PHASE);
	 
initial begin
		$vcdpluson;
		
		$monitorb(

	end
endmodule
	