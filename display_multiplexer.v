module display_multiplexer (
	input clk, g2, g1, g0, h2, h1, h0,
	output out2, out1, out0);
	
	and (y0, ~clk, g2);
	and (y1, clk, h2);
	or (out2, y0, y1);
	
	and (y2, ~clk, g1);
	and (y3, clk, h1);
	or (out1, y2, y3);
	
	and (y4, ~clk, g0);
	and (y5, clk, h0);
	or (out0, y4, y5);
	
endmodule 