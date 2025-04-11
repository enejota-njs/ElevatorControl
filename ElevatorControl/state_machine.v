module state_machine (
	input clock, x, rst,
	output e1, e0);
	
	assign d1 = (~e1 & e0 & x) | (e1 & ~e0) | (e1 & ~x);
	assign d0 = (~e0 & x) | (e0 & ~x);
	
	flip_flop_d (clock, d1, 1, rst, e1);
	flip_flop_d (clock, d0, 1, rst, e0);
endmodule 