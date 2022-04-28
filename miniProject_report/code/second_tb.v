`timescale 1ns/1ps
module second_tb();
	reg clk,key0,key1,key2;
	wire [6:0]s1, s2,s3,s4,s5,s6,s7;
	clock_counter uut(clk,key0,key1,key2,s1,s2,s3,s4,s5,s6,s7);
	
	always begin
	
	clk=~clk;
	#5;
	end
	initial begin
		clk=0;
		key0=1;
		key1=1;
		key2=1;
		#10;key0=0; #10 key0=1;
		key1=0; #10 key1=1;
		#10;key0=0; #10 key0=1;
		key2=0; #10 key2=1;
		#10;key0=0; #10 key0=1;
		key2=0; #10 key2=1;
		#10;key0=0; #10 key0=1;
		#200000;
		$stop;
	end
endmodule 