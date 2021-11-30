/********************************************************************
 ***														   	  ***
 *** EE 526 L Experiment #3			   Juan Silva, Spring 2019    ***
 *** 														   	  ***
 *** Hierarchical Modeling				 	  					  ***
 ********************************************************************
 *** Filename: register.v		 Created By Juan Silva 2/7/19  	  ***
 ***														   	  ***
 ********************************************************************
 ********************************************************************/

module register(R, CLK, DATA, ENA, RST);
//port declarations
	output [7:0] R;
	input [7:0] DATA;
	input CLK, ENA, RST;

//wires	
	wire q[7:0], r[7:0], m[7:0];
	
//netlists
	
	//Register 0
	MUX2_1	mux0(m[0],R[0], DATA[0], ENA);
	D_FF	dff0(R[0], ,CLK, m[0], RST);
	
	//Register 1
	MUX2_1	mux1(m[1],R[1], DATA[1], ENA);
	D_FF 	dff1(R[1], ,CLK, m[1], RST);
	
	//Register 2
	MUX2_1	mux2(m[2],R[2], DATA[2], ENA);
	D_FF	dff2(R[2], ,CLK, m[2], RST);
	
	//Register 3
	MUX2_1	mux3(m[3],R[3], DATA[3], ENA);
	D_FF	dff3(R[3], ,CLK, m[3], RST);
	
	//Register 4
	MUX2_1	mux4(m[4],R[4], DATA[4], ENA);
	D_FF	dff4(R[4], ,CLK, m[4], RST);
	
	//Register 5
	MUX2_1	mux5(m[5],R[5], DATA[5], ENA);
	D_FF	dff5(R[5], ,CLK, m[5], RST);
	
	//Register 6
	MUX2_1	mux6(m[6],R[6], DATA[6], ENA);
	D_FF	dff6(R[6], ,CLK, m[6], RST);
	
	//Register 7
	MUX2_1	mux7(m[7],R[7], DATA[7], ENA);
	D_FF	dff7(R[7], ,CLK, m[7], RST);
endmodule