module door_counter (
	input clk, m, C,
	output a2, a1, a0);	
	
	and (w0, a0, m);
	and (w1, ~a0, ~m);
	or (d1, w0, w1);
	
	and (w2, w0, a1);
	and (w3, w1, ~a1);
	or (d2, w2, w3);
	
	assign en = (~m & a0) | (~m & a1) | (a2 & ~a1 & ~a0) | (m & ~a2);
	
	and (f, clk, C);
	
	flip_flop_jk (f, d2, d2, en, a2);
	flip_flop_jk (f, d1, d1, en, a1);
	flip_flop_jk (f, 1, 1, en, a0);
endmodule 