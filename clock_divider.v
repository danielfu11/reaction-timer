module clock_divider(clk50M, clk_out);
	input clk50M;		// default internal clock signal of DE10
	output clk_out;   // outputs to a 1kHz clock signal for counting in miliseconds
	
	reg [15:0] count; 
	
	reg clk_out = 1'b0;
	
	
	// toggle clock signal every half milisecond 
	// so that there is a positive edge every milisecond
	always @(posedge clk50M) begin
		if (count == 50000) begin
			count <= 0;			// reset count		
			clk_out <= ~clk_out; // toggle
		end
		else begin
			count <= count + 1; // increment count until half of a milisecond
		end
	end
	
endmodule 