/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #8		   Juan Silva, Spring 2019   	  ***
 *** 														   	  ***
 *** Arithmetic-Logic Unit Modeling								  ***
 ********************************************************************
 *** Filename: alu.sv		 	Created By Juan Silva 4/4/19	  ***
 ***														   	  ***
 ********************************************************************
 *** This module will moodel the behaviour of an ALU. This ALU has***
 *** 2 arithmetic operands and 4 logical operands. A 4-bit opcode ***
 *** will determine the type of operand executed. Additionally,	  ***
 *** flags will be set according to the operands applied. 		  ***
 ********************************************************************/
 
`timescale 1 ns / 100 ps
 
module alu(ALU_OUT, CF, OF, SF, ZF, OPCODE, A, B, CLK, EN, OE);

parameter WIDTH = 8;
localparam OP_ADD = 4'b0010, OP_SUB = 4'b0011, 
		   OP_AND = 4'b0100,  OP_OR = 4'b0101,
		   OP_XOR = 4'b0110, OP_NOT = 4'b0111;
 
output reg [WIDTH - 1: 0] ALU_OUT;		//ALU operation output
output reg CF, OF, SF, ZF;				//ALU flags

input [3:0] OPCODE;					//4-bit opcode
input [WIDTH - 1: 0] A, B;	//variable-sized operands
input CLK, EN, OE;					//module inputs

always_ff @(posedge CLK or EN or OE) begin

	if(EN)
		if(OE) begin
				case (OPCODE)
					/*Add A and B where ZF, OF, CF, SF are set*/
					OP_ADD: begin
						ALU_OUT = A + B;
						
						//Check ZF
						if(|ALU_OUT == 0) ZF = 1;				   //output results in all zeros.
						else ZF = 0;
						
						//Check OF
						if(&(A[7] && B[7]) !== (ALU_OUT[7])) OF = 1;    //if output sign bit is modified, overflow.
						else OF = 0;

						//Check CF
						if((A[7] | B[7] == 1) && ALU_OUT[7] == 0) CF = 1;	   //check for changes in MSB
						else CF = 0;
						
						//Check SF
						if(ALU_OUT[7] == 1) SF = 1;				   //if MSB of output is one, output is negative.
						else SF = 0;										
					end
					/*Subtract A and B where ZF, OF, CF, SF are set*/
					OP_SUB:  begin
						ALU_OUT = A + (~B + 1);
						
						//Check ZF
						if(|ALU_OUT == 0) ZF = 1;				   //output results in all zeros.
						else ZF = 0;
						
						//Check OF
						if(&(A[7] && B[7]) !== ALU_OUT[7]) OF = 1;  //if output sign bit is modified, overflow.
						else OF = 0;

						//Check CF
						if((A[7] | B[7] == 1) && ALU_OUT[7] == 0 && A < B) CF = 1;	//check for changes in MSB
						else CF = 0;
						
						//Check NF
						if(ALU_OUT[7] == 1) SF = 1;				  //if MSB of output is one, output is negative.
						else SF = 0;										
					end
					/*AND A with B where ZF, SF are set*/				
					OP_AND: begin 
						ALU_OUT = A & B;
						
						//Check ZF
						if(|ALU_OUT == 0) ZF = 1;				   //output results in all zeros.
						else ZF = 0;
						
						//Check NF
						if(ALU_OUT[7] == 1) SF = 1;				  //if MSB of output is one, output is negative.
						else SF = 0;	
					end	
					OP_OR: begin 
					/*OR A with B where ZF, SF are set*/							
						ALU_OUT = A | B;
						//Check ZF
						if(|ALU_OUT == 0) ZF = 1;				   //output results in all zeros.
						else ZF = 0;
						
						//Check NF
						if(ALU_OUT[7] == 1) SF = 1;				  //if MSB of output is one, output is negative.
						else SF = 0;	
					end
					/*XOR A with B where ZF, SF are set*/						
					OP_XOR: begin
						ALU_OUT = A ^ B;
						
						//Check ZF
						if(|ALU_OUT == 0) ZF = 1;				   //output results in all zeros.
						else ZF = 0;
						
						//Check NF
						if(ALU_OUT[7] == 1) SF = 1;				  //if MSB of output is one, output is negative.
						else SF = 0;						
					end
					/*NOT A with B where ZF, SF are set*/	
					OP_NOT: begin
						ALU_OUT = ~A;
						
						//Check ZF
						if(|ALU_OUT == 0) ZF = 1;
						else ZF = 0;
						
						//Check NF
						if(ALU_OUT[7] == 1) SF = 1;				  //if MSB of output is one, output is negative.
						else SF = 0;									
					end
					
					default: ALU_OUT = ALU_OUT;				//undefined operands will not affect output
				endcase
		end
		else
			ALU_OUT = 8'bz;							//OE = 0; set high Z
	else
		ALU_OUT = ALU_OUT; 							//EN = 0; preserve previous state
	end
endmodule