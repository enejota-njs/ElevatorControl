module movement_control (
	input clock, floor3_key, floor2_key, floor1_key, floor0_key,
	output a1, a0, l1, l0);
	
	arrival_limit (floor3_key, floor2_key, floor1_key, floor0_key, l1, l0);
	
	or (x, floor3_key, floor2_key, floor1_key, floor0_key);
	assign f = clock & x;
	assign m = (~a1 & l1) | (~a1 & ~a0) | (~a0 & l1);
	
	floor_counter (f, l1, l0, m, a1, a0);
	
endmodule 