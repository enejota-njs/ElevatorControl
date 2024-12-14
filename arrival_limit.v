module arrival_limit (
	input floor3_key, floor2_key, floor1_key, floor0_key,
	output l1, l0);
	
	assign l1 = (~floor1_key & ~floor0_key);
	assign l0 = (~floor2_key & ~floor0_key);
	
endmodule 