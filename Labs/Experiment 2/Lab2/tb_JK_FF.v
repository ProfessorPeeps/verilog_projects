/*****************************************************************
 ***														   ***
 *** ECE526 L Experiment #2			   Juan Silva, Spring 2019 ***
 *** 														   ***
 *** Structural Modeling of a JK Flip-Flop		 			   ***
 *****************************************************************
 *** Filename: tb_JK_FF.v		 Created by Juan Silva, 2/21/19***
 ***														   ***
 *****************************************************************
 *** This testbench will test the validity of a JK FF using    *** 	   													   
 *** some vectors for the input of the JK FF. These vectors	   ***
 *** will test for Load, Set, Toggle, Hold, Asynchronous set,  ***
 *** Asynchronous clear, and check for an indeterminate state. ***
 *****************************************************************/

`timescale 1 ns / 10 ps
 
module tb_JK_FF();
	reg J, K, CP, SD, RD;
	wire Q, Q_BAR;		

	JK_FF UUT(Q, Q_BAR, J, K, CP, SD, RD); 
	
	initial
	
	$monitorb("%d  Q = %b  Q_BAR = %b", $time, Q, Q_BAR);

	initial begin
		$vcdpluson;
	
	//Test Load 0 (reset)
	$write("\nTest for reset (Load 0):\n");
		J = 1'b0; K = 1'b0; SD = 1'b1; RD = 1'b1; CP = 1'b0;
	$display("%d  J = %b  K = %b  SD = %b  RD = %b  CP = %b", $time, J, K, SD, RD, CP);
		#5 K = 1'b1; SD = 1'b1; RD = 1'b1; CP = 1'b1;
	$strobe("%d  J = %b  K = %b  SD = %b  RD = %b  CP = %b", $time, J, K, SD, RD, CP);
		//#5 CP = 1'b1;
		#5 CP = 1'b0;
	
	
	//Test asynch. reset
	$write("\nTest for asynch. set:\n");
		#5 SD = 1'b0; CP = 1'b1;
	$display("%d  J = %b  K = %b  SD = %b  RD = %b  CP = %b", $time, J, K, SD, RD, CP);
		#5 CP = 1'b0;
	
	//Test asynch. set
	$write("\nTest for asynch. reset:\n");
		#5 RD = 1'b0; SD = 1'b1; CP = 1'b1;
	$display("%d  J = %b  K = %b  SD = %b  RD = %b  CP = %b", $time, J, K, SD, RD, CP);
		#5 CP = 1'b0;
	
	$write("\nTest for hold :\n");
		#5 J = 1'b1; K = 1'b1; SD = 1'b1; RD = 1'b1; CP = 1'b1;
	$display("%d  J = %b  K = %b  SD = %b  RD = %b  CP = %b", $time, J, K, SD, RD, CP);
		#5 CP = 1'b0;
	$display("%d  Q = %b  Q_BAR = %b", $time, Q, Q_BAR);
		
	//Test Load 1 (set)
	$write("\nTest for set (Load 1):\n");
		#5 J = 0'b1; K = 1'b0; CP = 1'b1;
	$strobe("%d  J = %b  K = %b  SD = %b  RD = %b  CP = %b", $time, J, K, SD, RD, CP);
		#5 CP = 1'b0;
		
	//Toggle
	$write("\nTest for toggle :\n");
		#5 J = 1; K = 1; RD = 1; SD = 1; CP = 1;
	$display("%d  J = %b  K = %b  SD = %b  RD = %b  CP = %b", $time, J, K, SD, RD, CP);
		#5 CP = 0;	
		
	//Test for indeterminate 1
	$write("\nTest for indeterminate (Test 1) :\n");
		#5 J = 0; K = 1; RD = 0; SD = 0; CP = 1;
	$display("%d  J = %b  K = %b  SD = %b  RD = %b  CP = %b", $time, J, K, SD, RD, CP);
		#5 CP = 0;
		
	//Test for indeterminate 2
	$write("\nTest for indeterminate (Test 2) :\n");
		#5 J = 1; K = 1; RD = 0; SD = 0; CP = 1;
	$display("%d  J = %b  K = %b  SD = %b  RD = %b  CP = %b", $time, J, K, SD, RD, CP);
		#5 CP = 0;		
	$display("%d  Q = %b  Q_BAR = %b", $time, Q, Q_BAR);
	
	#5 $finish;
	end
endmodule