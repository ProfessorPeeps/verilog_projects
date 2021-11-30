module top_counter(count, data, CLK, RST, ENA, LOAD, aasd_rst);

output count[4:0];
input data[4:0];
input CLK, LOAD, ENA, aasd_rst;

	AASD aasd1(aasd_rst, CLK, RST);
	counter c1(count, data, CLK, aasd_rst, ENA, LOAD);
	
//RESET will reset data bits
always @(posedge CLK or negedge aasd_rst) begin	
		
		if(!aasd_rst)
			data <= 5'b0;
		else
			data <= data; 
end

always @(posedge CLK) begin
		
	if(ENA)
		if(LOAD)					//LOAD = 1
			count <= data;	 		//load data to count
		else						//LOAD = 0
			count <= count + 1;		//increment count
	else							//ENA
		count <= count; 			//hold count
end	
endmodule