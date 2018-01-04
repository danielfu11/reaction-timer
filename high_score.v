module high_score(en, BCD0, BCD1, BCD2, BCD3, high_score);
	input [1:0] en; 		
	input [3:0] BCD0, BCD1, BCD2, BCD3;
	output reg [15:0] high_score;
	
	initial
		begin
		high_score = 16'b1001100110011001;
		end
	
	always @(en) begin
		if (en == 2'b00 && {BCD3, BCD2, BCD1, BCD0} != 0) begin
			if (high_score > {BCD3, BCD2, BCD1, BCD0})
				high_score = {BCD3, BCD2, BCD1, BCD0};
			else 
				high_score = high_score;
		end
	end
	
endmodule 
