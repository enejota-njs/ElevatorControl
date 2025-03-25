module debounce (
	input clock, button,
	output out
	);
	
	flip_flop_d (clock, button, 1, 0, Q0);
	flip_flop_d (clock, Q0, 1, 0, Q1);
	
	and (out, Q0, ~Q1);
	
endmodule 