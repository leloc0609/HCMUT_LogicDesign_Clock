module top_interface(SW, LEDR, KEY, HEX0, HEX1, HEX4, HEX5, HEX6, HEX7, CLOCK_50);

	input [17:0]SW;
	input [3:0]KEY;
	input CLOCK_50;
	output [6:0]HEX0, HEX1, HEX4, HEX5, HEX6, HEX7;
	output [17:0]LEDR;
	
	wire clk1hz;
	//wire [5:0]count;
	
	clock_divider(.clk(CLOCK_50),
				     .reset(1), 
				     .hz_in(1),
				     .hz_out(clk1hz));
	
	clock_counter(.clk_50(clk1hz), 
					  .rst(SW[17]), 
					  .reach60m(LEDR[0]), 
					  .S_counter_over(LEDR[1]), 
					  .S1(HEX1), 
					  .S2(HEX0), 
					  .S3(HEX5), 
					  .S4(HEX4));
	

endmodule 