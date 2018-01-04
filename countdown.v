module countdown(num, en, start, clk1k, countdown_finish);
	input [1:0] en;
	input clk1k, start;
	input [11:0] num;			// generated from LFSR
	output reg countdown_finish; 				// signal that countdown has finished
	
	reg [11:0] count;
	
	initial 
		begin
		count = 12'b111111111111;
		end
	
	always @(posedge clk1k) begin
		if (!start) 
			count <= num;			// start counting down
		else if (en == 2'b01 && start) begin
			if (count < 12'd1)  // countdown finished
				countdown_finish <= 1'b1;			// output high
			else begin
				count <= count - 1;
				countdown_finish <= 1'b0;		   // decrement count
			end
		end
	end
endmodule 
	