module sevenseg(BCD, sseg_display);
	input [3:0] BCD;
	output reg [6:0] sseg_display;
	
	always @(BCD) begin
		case(BCD)
			4'b0000: sseg_display = 7'b1000000; //display 0
			4'b0001: sseg_display = 7'b1111001; //display 1
			4'b0010: sseg_display = 7'b0100100; //display 2
			4'b0011: sseg_display = 7'b0110000; //display 3
			4'b0100: sseg_display = 7'b0011001; //display 4
			4'b0101: sseg_display = 7'b0010010; //display 5
			4'b0110: sseg_display = 7'b0000010; //display 6
			4'b0111: sseg_display = 7'b1111000; //display 7
			4'b1000: sseg_display = 7'b0000000; //display 8
			4'b1001: sseg_display = 7'b0010000; //display 9
			default: sseg_display = 7'bx;
		endcase
	end
endmodule 
