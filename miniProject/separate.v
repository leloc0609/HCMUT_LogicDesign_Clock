module separate(in,out2,out1);
	input [5:0]in;
	output reg[3:0]out2,out1;
	
	always @ (in)
	begin
		if(in<=9)
			{out2,out1} = in;
		else if(in<=19)
			begin
				out2 = 1;
				out1 = in -10;
			end
		else if(in<=29)
			begin
				out2 = 2;
				out1 = in - 20;
			end
		else if(in<=39)
			begin
				out2 = 3;
				out1 = in-30;
			end
		else if(in<=49)
			begin
				out2 = 4;
				out1 = in-40;
			end
		else if(in<=59)
			begin
				out2 = 5;
				out1 = in-50;
			end	
	end
endmodule