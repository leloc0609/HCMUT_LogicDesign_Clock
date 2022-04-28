module hour_counter(clk_50,en, mode,select,key1,key2, S_counter_over,S1,S2);

	input clk_50,key1,key2,mode,select,en;
	reg [5:0]count_s;
	output S_counter_over;
	output [6:0] S1, S2;
	reg enable,eadd,esub,en1,start,start2,start1;

	wire[3:0]w1, w2;
	initial 
	begin 
		count_s=0;
		enable=0;
		eadd=1;
		esub=1;
		en1=1;
	end
	
	always @(key1)
	begin
		if(key1==0) start=1;
		else  start=0;
	end
	always @(en)
	begin
		if(en==1) start1=1;
		else  start1=0;
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
									if(count_s==23)count_s<=0;
									else count_s<=count_s+1;
								end
							
							if (start==0&& eadd==0) eadd<=1;
								
							if (start2==1&& esub==1)
								begin
									esub<=0;
									if(count_s==0) count_s<=23;
									else count_s<=count_s-1;
								end
							if (start2==0&& esub==0) esub<=1;
						end
				end
				else 
				begin	
					if (start1==1&& en1==1)
							begin
								en1<=0;
								if(count_s==23)count_s<=0;
								else count_s<=count_s+1;
							end
					if (start1==0&& en1==0) en1<=1;	
				end
		end
	assign S_counter_over=(count_s==0 && enable==1) ? 1:0;
	
	separate a1(count_s, w1, w2);
	led7_decoder u1(w1, S1);
	led7_decoder u2(w2, S2);
	
endmodule  