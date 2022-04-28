module second_counter(clk_50, mode,select,key1,key2, S_counter_over,S1,S2);

	input clk_50,key1,key2,mode,select;
	reg [5:0]count_s;
	reg [26:0]count_50;
	output S_counter_over;
	output [6:0] S1, S2;
	reg enable,eadd,esub,start,start2;

	wire[3:0]w1, w2;
	initial 
	begin 
		count_s=0;
		count_50=0;
		enable=0;
		eadd=1;
		esub=1;
	end
	
	always @(key1)
	begin
		if(key1==0) start=1;
		else  start=0;
	end
	
	always @(key2)
	begin
		if(key2==0) start2=1;
		else  start2=0;
	end
	
	always @(posedge clk_50)
		begin
				if (mode)
				begin
					if (select)
						begin
							if (start==1&& eadd==1)
								begin
									eadd<=0;
									if(count_s==59)count_s<=0;
									else count_s<=count_s+1;
								end
							
							if (start==0&& eadd==0) eadd<=1;
								
							if (start2==1&& esub==1)
								begin
									esub<=0;
									if(count_s==0) count_s<=59;
									else count_s<=count_s-1;
								end
							if (start2==0&& esub==0) esub<=1;
						end
				end
				else 
				begin	
					if(count_50==49999999)
						begin
						if (count_s >= 59)	
							begin
								count_s <= 0;
								enable<=1;
							end
						else
							begin	
							count_s <= count_s + 1;
							enable<=0;
							end
							count_50<=0;
						
						end
					else count_50<=count_50+1;
			end
		end
	assign S_counter_over=(count_s==0 && enable==1) ? 1:0;
	
	separate a1(count_s, w1, w2);
	led7_decoder u1(w1, S1);
	led7_decoder u2(w2, S2);
	
endmodule  