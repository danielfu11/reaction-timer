module project2_top(sw0, sw1, KEY0, KEY1, clk50M, LED0, LED1, LED2, LED3, sseg0, sseg1, sseg2, sseg3, decimal_point);
	input sw0, sw1, KEY0, KEY1, clk50M;
	output [6:0] sseg0, sseg1, sseg2, sseg3;
	output decimal_point;
	output LED0, LED1, LED2, LED3;
	
	wire clk1k, reset, start, stop;
	wire [11:0] random_num;
	wire [1:0] en, carry1, carry2, carry3, carry4;
	wire [3:0] BCD0, BCD1, BCD2, BCD3;
	wire [3:0] display0, display1, display2, display3;
	wire [15:0] high_score;
	
	
	assign reset = sw1;
	
	clock_divider D1(clk50M, clk1k);
	
	lfsr L1(clk50M, random_num);
	
	state_machine SM1(clk50M, KEY0, KEY1, reset, countdown_finish, en);
	
	countdown C1(random_num, en, KEY0, clk1k, countdown_finish);
	
	BCD_countup B1(clk1k, en, BCD0, BCD1, BCD2, BCD3);
	
	LED_test T1(en, LED0, LED1, LED2, LED3); // shows the current state with LEDs
	
	high_score H1(en, BCD0, BCD1, BCD2, BCD3, high_score);
	
	multiplexer M1(BCD0, high_score[3:0], sw0, display0);
	multiplexer M2(BCD1, high_score[7:4], sw0, display1);
	multiplexer M3(BCD2, high_score[11:8], sw0, display2);
	multiplexer M4(BCD3, high_score[15:12], sw0, display3);
	
	sevenseg S0(BCD0, sseg0);
	sevenseg S1(BCD1, sseg1);
	sevenseg S2(BCD2, sseg2);
	sevenseg S3(BCD3, sseg3);
	
	
	assign decimal_point = 1'b0;
	
endmodule
	
	
	
	