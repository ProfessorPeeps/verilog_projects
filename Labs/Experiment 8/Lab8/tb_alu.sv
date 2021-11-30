/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #8		   Juan Silva, Spring 2019   	  ***
 *** 														   	  ***
 *** Arithmetic-Logic Unit Modeling								  ***
 ********************************************************************
 *** Filename: tb_alu.sv		 	Created By Juan Silva 4/4/19  ***
 ***														   	  ***
 ********************************************************************
 *** This testbench will verify the functionality of an ALU. Two  ***
 *** arithmetic operations (ADD & SUB) and four logic operations  ***
 *** (AND, OR, XOR, NOT) will be defined by their appropriate     ***
 *** opcode. Four flags (CF, OF, SF, ZF) will be observed for each***
 *** operand. Any undefined operations or disabling the OE should ***
 *** not modify the output. Disabling the chip will produce a high***
 *** Z output. 													  ***
 ********************************************************************/
 
`timescale 1 ns / 100 ps
 
module tb_alu();
 
parameter WIDTH = 8;
 
wire [WIDTH - 1: 0] ALU_OUT;		//ALU operation output
wire CF, OF, SF, ZF;				//ALU flags

reg [3:0] OPCODE;					//4-bit opcode
reg [WIDTH - 1: 0] A, B;			//variable-sized operands
reg CLK, EN, OE;					//module inputs
	
	alu UUT(ALU_OUT, CF, OF, SF, ZF, OPCODE, A, B, CLK, EN, OE);
		
	initial
		CLK = 0;
		
	always
		#5 CLK = ~CLK;

	initial begin
		$monitorb("%d ALU_OUT = %b  CF = %b  OF = %b  SF = %b  ZF = %b", $time, ALU_OUT, CF, OF, SF, ZF);
	end

	initial begin
		$vcdpluson; 
		
		$write("\n");
		
		//Enable the ALU and enable the output
		EN = 1; OE = 1;
		
		//Undefined operand
		#1 $write("\n\t\t   Test for undefined operand:");
		#4 OPCODE = 4'b0000; A = 8'b1111_1111; B  = 8'b1111_1111;
		$display("\n%d A = %b  B = %b OPCODE = %b  OE = %b", $time, A, B, OPCODE, OE);
	
		//Add operand where MSBs are zero (OF, SF set)
		#1 $write("\n\t\t  Test for ADD where MSBs are zero to set OF, SF:");
		#9 OPCODE = 4'b0010; A = 8'b0111_0000; B  = 8'b0001_0000;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);

		//Add operand (no flags set)
		#1 $write("\n\t\t  Test for ADD where no flags set:");
		#9 OPCODE = 4'b0010; A = 8'b0000_1000; B  = 8'b0001_1111;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);
		
		//Add operand where MSBs are one (CF, OF set)
		#1 $write("\n\t\t  Test for ADD where MSBs are one to set CF, OF:");
		#9 OPCODE = 4'b0010; A = 8'b1011_0000; B  = 8'b1001_0000;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);

		//Add operand with alternating MSBs (CF, ZF set)
		#1 $write("\n\t\t  Test for ADD with alternating MSBs to set CF, ZF:");
		#9 OPCODE = 4'b0010; A = 8'b1011_0000; B  = 8'b0101_0000;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);		
		
		//Undefined operand
		#1 $write("\n\n\t\t  Test for undefined operand:");
		#9 OPCODE = 4'b0001; A = 8'b1111_1111; B  = 8'b1111_1111;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);		

		//Subtract operand where MSBs are zero (OF set)
		#1 $write("\n\t\t  Test for SUB where MSBs are zero to set OF:");
		#9 OPCODE = 4'b0011; A = 8'b1000_0000; B  = 8'b1000_0000;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);
		
		//Subtract operand (no flags set)
		#1 $write("\n\t\t  Test for SUB where no flags set:");
		#9 OPCODE = 4'b0010; A = 8'b0001_1000; B  = 8'b0000_1000;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);
		
		//Subtract operand where MSBs are zero (OF set)
		#1 $write("\n\t\t  Test for SUB where MSBs are one to set OF:");
		#9 OPCODE = 4'b0011; A = 8'b1011_0000; B  = 8'b1001_0000;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);

		//Subtract operand with alternating MSBs (CF set)
		#1 $write("\n\t\t  Test for SUB with A < B to set CF:");
		#9 OPCODE = 4'b0011; A = 8'b0011_0000; B  = 8'b1101_0000;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);

		//AND operand where result is not zero
		#1 $write("\n\n\t\t Test for AND where ZF not set:");
		#9 OPCODE = 4'b0100; A = 8'b1011_0110; B  = 8'b1111_0000;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);

		//AND operand where result is zero
		#1 $write("\n\t\t Test for AND where ZF set:");
		#9 OPCODE = 4'b0100; A = 8'b1011_0110; B  = 8'b0;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);
		
		//OR operand where result is not zero
		#1 $write("\n\n\t\t Test for OR where ZF not set:");
		#9 OPCODE = 4'b0101; A = 8'b1011_0110; B  = 8'b1111_0000;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);

		//OR operand where result is zero
		#1 $write("\n\t\t Test for OR where ZF set:");
		#9 OPCODE = 4'b0101; A = 8'b0; B  = 8'b0;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);
		
		//XOR operand where result is not zero
		#1 $write("\n\n\t\t Test for XOR where ZF not set:");
		#9 OPCODE = 4'b0110; A = 8'b1011_0110; B  = 8'b1111_0000;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);

		//XOR operand where result is zero
		#1 $write("\n\t\t Test for XOR where ZF set:");
		#9 OPCODE = 4'b0110; A = 8'b1111_1111; B  = 8'b1111_1111;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);		

		//Disable OE
		#1 $write("\n\t\t Test for when OE is disabled (flags are not changed):");
		#9 OE = 0; OPCODE = 4'b0111; A = 8'b0001_0101; B  = 8'b0101_0101;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);	
		
		//NOT (ZF set)
		#1 $write("\n\t\t Test for NOT where ZF set:");
		#9 OE = 1 ; OPCODE = 4'b0111; A = 8'b1111_1111; B  = 8'bx;
		$display("\n%d A = %b  B = %b OPCODE = %b  OE = %b", $time, A, B, OPCODE, OE);

		//Disable ENA
		#1 $write("\n\t\t Test for when ENA is low:");
		#9 EN = 0; OPCODE = 4'b0111; A = 8'b1111_0000; B  = 8'bx;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);

		//Undefined operand
		#1 $write("\n\t\t Test for undefined operand:");
		#9 OPCODE = 4'b1000; A = 8'b1111_1111; B  = 8'b1111_1111;
		$display("\n%d A = %b  B = %b OPCODE = %b", $time, A, B, OPCODE);
		
		#5 $write("\n");
		#10 $finish;
	end
endmodule