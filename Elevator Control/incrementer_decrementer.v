module incrementer_decrementer (
	input m, a, b, te,
	output s, ts);
	
	xor (w0, a, b);
	xor (s, w0, te);
	
	assign ts = (b & te) | (~m & a & te) | (~m & a & b) | (m & ~a & te) | (m & ~a & b);
	
endmodule 