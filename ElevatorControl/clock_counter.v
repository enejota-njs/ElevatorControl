module clock_counter (
	input frequency,
	output r);
	
	assign s2p = (s1 & s0);
	assign s1p = (~s1 & s0) | (s1 & ~s0);
	assign s0p = (~s2 & ~s0);
	
	flip_flop_d (frequency, s2p, 1, 0, s2);
	flip_flop_d (frequency, s1p, 1, 0, s1);
	flip_flop_d (frequency, s0p, 1, 0, s0);

	assign test = (~s2 & ~s1 & ~s0) | (~s2 & s1 & s0);
	
	flip_flop_t (frequency, test, r);  

endmodule 