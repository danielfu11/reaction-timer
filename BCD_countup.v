module BCD_countup(clk1k, en, BCD0, BCD1, BCD2, BCD3);
	input clk1k;
	input [1:0] en;
	output reg [3:0] BCD0 = 0;
	output reg [3:0] BCD1 = 0;
	output reg [3:0] BCD2 = 0; 
	output reg [3:0] BCD3 = 0;
	
	always @(posedge clk1k) begin 
		if (en == 2'b00 || en == 2'b01)			// reset all the BCDs to zero
			begin 
				BCD3 = 0;
				BCD2 = 0;
				BCD1 = 0;
				BCD0 = 0;
			end
		else if (en == 2'b10) begin 	// increments the BCDs while the user has not pressed the stop button
			if (BCD0 == 4'b1001) begin
				BCD0 <= 0;
				if (BCD1 == 4'b1001) begin
					BCD1 <= 0;
					if (BCD2 == 4'b1001) begin
						BCD2 <= 0;
						if (BCD3 == 4'b1001) begin
							BCD3 <= 0;
						end
						else 
							BCD3 <= BCD3 + 1;
					end
					else
						BCD2 <= BCD2 + 1;
				end
				else
					BCD1 <= BCD1 + 1;
			end
			else 
				BCD0 <= BCD0 + 1;
		end
	end
	
endmodule						