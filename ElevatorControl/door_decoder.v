module door_decoder (
	input c2, c1, c0,
	output l9, l8, l7, l6, l5, l4, l3, l2, l1, l0);
	
	assign l9 = 1;
	assign l8 = (c1) | (c2);
	assign l7 = (c1 & c0) | (c2);
	assign l6 = (c2);
	assign l5 = (c2 & c0);
	assign l4 = (c2 & c0);
	assign l3 = (c2);
	assign l2 = (c1 & c0) | (c2);
	assign l1 = (c1) | (c2);
	assign l0 = 1;
endmodule 