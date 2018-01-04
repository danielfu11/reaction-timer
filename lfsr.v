module lfsr(clk50M, random_num);
	input clk50M;
	output reg [11:0] random_num; 
	// 12 bit random number so that the maximum time is around 8 seconds, 
	// any longer may be too long and confuse the user
	// initialize the random number to any number other than 0
	
	initial
		begin
		random_num = 12'b111111111111;
		end
		
		
	always @(posedge clk50M) begin
		if (random_num == 0) begin
			random_num <= 12'b111111111111;
		end
		else begin
			random_num <= {random_num[10], 
								random_num[9],
								random_num[8],
								random_num[7],
								random_num[6],
								random_num[5],
								random_num[4],
								random_num[3],
								random_num[2],
								random_num[1],
								random_num[0],
								random_num[8] ^ random_num[3]
								};
		end
	end
	
endmodule
	