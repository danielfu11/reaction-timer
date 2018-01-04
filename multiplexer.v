module multiplexer(m1,m2,sw,mout);
	input [3:0] m1;
	input [3:0] m2;
	input sw;
	output reg [3:0] mout;
	
	
	always @(m1 or m2 or sw) begin
		case(sw)
			0: mout = m1;
			1: mout = m2;
		endcase
	end
	
endmodule 