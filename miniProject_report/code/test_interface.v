module test_interface(SW, LEDR, KEY, HEX0, HEX2,HEX3,HEX4,HEX5,HEX6,HEX7, CLOCK_50);

	input [17:0]SW;
	input [3:0]KEY;
	input CLOCK_50;
	output [6:0]HEX0, HEX2,HEX3,HEX4,HEX5,HEX6,HEX7;
	output [17:0]LEDR;
	
	wire clk1hz;
	//wire [5:0]count;
	
	
	clock_counter(.clk_50(CLOCK_50), 
	.key0(KEY[0]),
	.key1(KEY[1]),
	.key2(KEY[2]),
	.S1(HEX3),.S2(HEX2),
	.S3(HEX5),.S4(HEX4),
	.S5(HEX7),.S6(HEX6),.S7(HEX0));
endmodule 