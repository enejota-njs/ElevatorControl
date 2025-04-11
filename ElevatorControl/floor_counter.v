module floor_counter (
	input clock, l1, l0, direction,
	output a1, a0
	);
	
	assign en = (~a0 & l0) | (~a1 & l1) | (a0 & ~l0) | (a1 & ~l1);
	
	and (w0, a0, direction);
	and (w1, ~a0, ~direction);
	or (d1, w0, w1);
	
	flip_flop_jk (clock, d1, d1, en, a1);
	flip_flop_jk (clock, 1, 1, en, a0);
endmodule