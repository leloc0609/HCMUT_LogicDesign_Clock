module clock_counter(clk_50,key0,key1,key2,S1, S2, S3, S4,S5,S6,S7);

	input clk_50,key0,key1,key2;
	reg [3:0]count;
	output [6:0] S1, S2, S3, S4,S5,S6,S7;
	
	reg mode,ss,sm,sh;
	wire w1,w2,w3;
	initial 
	begin
		count=0;
		mode=0;
		ss=0;sm=0;sh=0;
	end
	
	always @(negedge key0)
	begin
		
		if(count==3)count<=0;
		else count<=count+1;
	end


	always @(count)
	begin
		case (count)
		0:begin
			mode=0;
			ss<=0; sm<=0; sh<=0;
		end
		1:begin
			mode=1;
			ss=1; sm=0; sh=0;
		end
		2:begin
			mode=1;
			ss=0; sm=1; sh=0;
		end
		3:begin
			mode=1;
			ss=0; sm=0; sh=1;
		end
		endcase
	end

	second_counter u0(clk_50, mode,ss,key1,key2,w1,S1,S2);
	minute_counter u1(clk_50, w1,mode ,sm,key1,key2,w2,S3,S4);
	hour_counter u2(clk_50,w2,mode,sh,key1,key2,w3,S5,S6);
	led7_decoder u3(count,S7);
endmodule 