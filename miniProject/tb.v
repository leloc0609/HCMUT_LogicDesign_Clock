module tb();
	reg rst,clk;
	wire reach60m, reach60s;
	wire [6:0] s1,s2,s3,s4;
	clock_counter uut(clk,rst,reach60m,reach60s,s1,s2,s3,s4);
	
	always begin
	
	clk=~clk;
	#5;
	end
	
	initial begin
		clk=0;
		rst=0;
		#10;
		rst=1;
		
		#100000;
		$stop ;
	end
endmodule 