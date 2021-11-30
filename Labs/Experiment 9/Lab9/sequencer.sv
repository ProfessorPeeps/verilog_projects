/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #9		   Juan Silva, Spring 2019   	  ***
 *** 														   	  ***
 *** Modeling a Sequencer Controller							  ***
 ********************************************************************
 *** Filename: sequencer.sv		 	Created By Juan Silva 4/11/19 ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/
 
`timescale 1 ns / 1 ns
 
module sequencer(ADDR, OPCODE, PHASE, OF, SF, ZF,
	CF, INTF, IR_EN, A_EN, B_EN, PDR_EN, PORT_EN, 
	PORT_RD, PC_EN, PC_LOAD, ALU_EN, ALU_OE, 
	RAM_OE, RDR_EN, RAM_CS);
	
output	IR_EN, A_EN, B_EN, PDR_EN, PORT_EN, PORT_RD, PC_EN,
		PC_LOAD, ALU_EN, ALU_OE, RAM_OE, RDR_EN, RAM_CS;
		
input [6:0] ADDR;
input [3:0] OPCODE;
input [1:0] PHASE;
input OF, SF, ZF, CF, INTF;


AASD aasd1(aasd_rst, CLK, RST);
phaser phase1(CLK, RST, EN, PHASE);
		
alway_ff @(posedge PHASE) begin  //or ADDR or OPCODE) begin

	case(PHASE)		
		FETCH : begin
			
			if(ADDR) begin
			//enable RAM and its output
			RAM_CS = 0;
			RAM_OE = 1;		
			RAM_EN = 1; 				
			end
			
			else
			//End of cycle, enable Instruction Register for decoding
			IR_EN = 1;
			
		end
		
		DECODE : begin
			
			//default case
			IR_EN = 1; A_EN = 1; B_EN = 1; 
			PDR_EN = 1; PORT_EN = 1; PORT_RD = 1;
			ALU_EN = 1; ALU_OE = 1; RDR_EN = 1;

		end
		
		EXECUTE begin
			
			//ALU will be used to decode instruction
			A_EN = 1; B_EN = 1; ALU_EN = 1;
			PC_LOAD = 1; PC_EN = 1;
			
			case(OPCODE) //based on opcode
				LOAD : begin
					PDR_EN = 1; PORT_RD = 1; RAM_CS = 1;
				end	
				STORE : begin
					PDR_EN = 1; PORT_RD = 1; RAM_CS = 1;
					RDR_EN = 1;
				end	
				
				//arithmetic operators
				4'b001? : begin
				ALU_OE = 1; 
				PC_LOAD = 0; PC_EN = 0;
				
				end
				//more arithmetic operators
				4'b01?? : begin
				ALU_OE = 1;
				PC_LOAD = 0; PC_EN = 0;
				end
				
				//branch operators
				4'b10??: begin
					A_EN = 0; B_EN = 0; ALU_EN = 0;
				end
		end
		
		UPDATE begin
			//update program counter
 
			//load branch address from MIR
			
			//clear ENA from previous cycles	
			IR_EN = 0; A_EN = 0; B_EN = 0; 
			PDR_EN = 0; PORT_EN = 0; PORT_RD = 0;
			ALU_EN = 0; ALU_OE = 0; RDR_EN = 0;
		end
		
    default
		//do nothing?
	endcase
end	
endmodule