module reset_control (
	input clock,
	output rst);
	
	assign lim = c1 & ~c0;
	
	assign c1p = (~c1 & c0) | (c1 & ~c0);
	assign c0p = (~c0);
	
	flip_flop_d (clock, c1p, ~lim, 0, c1);
	flip_flop_d (clock, c0p, ~lim, 0, c0);
	
	and (rst, ~c1, c0);

endmodule 