module state_change_control (
	input e1, e0, floor3_key, floor2_key, floor1_key, floor0_key, c2, c1, c0, a1, a2, a0, u1, u0, l1, l0, d,
	output x);
	
	assign aux_000 = (~e1 & ~e0 & floor0_key) | (~e1 & ~e0 & floor1_key) | (~e1 & ~e0 & floor2_key) | (~e1 & ~e0 & floor3_key);
	assign aux_001 = (~u0 & l0) | (~u1 & l1) | (u0 & ~l0) | (u1 & ~l1);
	assign aux_002 = (aux_000 & ~a2) | (aux_000 & ~a1);
	
	assign p_00 = aux_001 & aux_002;
	assign p_01 = (~e1 & e0 & c2 & ~c1 & c0 & d);
	assign p_10 = (e1 & ~e0 & ~u1 & ~u0 & ~l1 & ~l0) | (e1 & ~e0 & ~u1 & u0 & ~l1 & l0) | (e1 & ~e0 & u1 & ~u0 & l1 & ~l0) | (e1 & ~e0 & u1 & u0 & l1 & l0) | (e1 & ~e0 & ~floor3_key & ~floor2_key & ~floor1_key & ~floor0_key);
	assign p_11 = (e1 & e0 & ~c2 & ~c1 & ~c0 & ~d);
	
	xor (x, p_00, p_01, p_10, p_11);
endmodule 