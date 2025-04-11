module seven_segment_decoder (
	input a2, a1, a0,
	output seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g, seg_p
	);
	
	not (not_a2, a2);
	not (not_a1, a1);
	not (not_a0, a0);

	and (w0, not_a2, not_a1, a0);
	and (w1, a2, not_a1, not_a0);
	or (seg_a, w0, w1);
	
	and (w2, a2, not_a1, a0);
	and (w3, a2, a1, not_a0);
	or (seg_b, w2, w3);
	
	and (seg_c, not_a2, a1, not_a0);
	
	and (w4, not_a2, not_a1, a0);
	and (w5, a2, not_a1, not_a0);
	and (w6, a2, a1, a0);
	or (seg_d, w4, w5, w6);
	
	and (w7, a0, 1);
	and (w8, a2, not_a1);
	or (seg_e, w7, w8);
	
	and (w9, not_a2, a0);
	and (w10, not_a2, a1);
	and (w11, a1, a0);
	or (seg_f, w9, w10, w11);
	
	and (w12, not_a2, not_a1);
	and (w13, a2, a1, a0);
	or (seg_g, w12, w13);
	
	and (seg_p, 1, 1);
	
endmodule 