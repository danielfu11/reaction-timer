module LED_test(en, LED0, LED1, LED2, LED3);
	input [1:0] en;
	output reg LED0, LED1, LED2, LED3;
	
	always @(en) begin
		if (en == 2'b00) begin
			LED0 = 1;
			LED1 = 0;
			LED2 = 0;
			LED3 = 0;
		end
		else if (en == 2'b01) begin 
			LED0 = 0;
			LED1 = 1;
			LED2 = 0;
			LED3 = 0;
		end 
		else if (en == 2'b10) begin
			LED0 = 0;
			LED1 = 0;
			LED2 = 1;
			LED3 = 0;
		end 
		else if (en == 2'b11) begin
			LED0 = 0;
			LED1 = 0;
			LED2 = 0;
			LED3 = 1;
		end 
	end
endmodule 