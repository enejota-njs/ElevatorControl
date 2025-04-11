module flip_flop_jk (
	input clk, J, K, enable,
	output reg Q);
	
	always@(posedge clk)begin
		if (enable) begin	
			case({J,K})
				2'b00 : Q <= Q;
				2'b01 : Q <= 1'b0;
				2'b10 : Q <= 1'b1;
				2'b11 : Q <= ~Q;
			endcase
		end
	end
endmodule 