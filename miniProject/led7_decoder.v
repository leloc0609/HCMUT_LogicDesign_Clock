module led7_decoder(bcd_in, out_7seg);
	input [3:0]bcd_in;
	output reg [6:0]out_7seg;
	
	always @(bcd_in)
		begin
        case (bcd_in) 
            0 : out_7seg = 7'b1000000;
            1 : out_7seg = 7'b1111001;
            2 : out_7seg = 7'b0100100;
            3 : out_7seg = 7'b0110000;
            4 : out_7seg = 7'b0011001;
            5 : out_7seg = 7'b0010010;
            6 : out_7seg = 7'b0000010;
            7 : out_7seg = 7'b1111000;
            8 : out_7seg = 7'b0000000;
            9 : out_7seg = 7'b0010000;
           default : out_7seg = 7'b1111111; 
        endcase
		end
endmodule