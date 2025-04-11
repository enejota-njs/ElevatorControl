module people_control (
	input m, a2, a1, a0, b2, b1, b0,
	output s2, s1, s0);
	
	incrementer_decrementer (m, a0, b0, te, s0, w0);
	incrementer_decrementer (m, a1, b1, w0, s1, w1);
	incrementer_decrementer (m, a2, b2, w1, s2, w2);
	
endmodule 