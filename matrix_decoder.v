module matrix_decoder (
	input a1, a0,
	output l6, l5, l4, l3, l2, l1, l0, c4, c3, c2, c1, c0);
	
	assign l6 = (a0) | (a1);
	assign l5 = (~a0) | (a1);
	assign l4 = (~a0) | (a1);
	assign l3 = (~a1) | (a0);
	assign l2 = (~a1) | (a0);
	assign l1 = (~a1) | (~a0);
	assign l0 = (~a1) | (~a0);
	assign c4 = 1;
	assign c3 = 1;
	assign c2 = 1;
	assign c1 = 1;
	assign c0 = 1;
	
endmodule 