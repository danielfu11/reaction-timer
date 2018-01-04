module state_machine(clk, start, stop, reset, countdown_finish, en);
	input clk, start, stop, reset, countdown_finish;
	output reg [1:0] en;
	
	reg [1:0] state, state_next;
	
	parameter IDLE = 2'b00, countdown = 2'b01, reaction = 2'b10, display = 2'b11; // the four states

	always @(state, start, stop, reset) begin
		case (state)
			IDLE:
				if (!start) begin					// starts counting down
					state_next = countdown;
				end
				else
					state_next = IDLE;
         countdown:
            if (countdown_finish && start) begin	// finish count down, start counting up
					state_next = reaction;
				end
				else 
					state_next = countdown;
         reaction:
				if (!stop) begin					// user pressed stop button, display reaction time
					state_next = display;;
				end
				else
					state_next = reaction;
         display:
				if (reset) begin
					state_next = IDLE;
				end
				else
					state_next = display;
		endcase
	end
	
	always @(posedge clk, posedge reset) begin
		if (reset)
			state <= IDLE;			// reset state to idle
		else
			state <= state_next; // preserve state
	end
	
	always @(state) begin
		if (state == IDLE)
			en = IDLE;
		if (state == countdown)
			en = countdown;
		if (state == reaction)
			en = reaction;
		if (state == display)
			en = display;
	end
	

endmodule 