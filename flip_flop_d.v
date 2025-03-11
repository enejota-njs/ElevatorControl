module flip_flop_d(
    input clk,
    input d,
    input enable,
	  input reset,
    output reg q );
    
    always @(posedge clk or posedge reset) begin
      if(reset==1'b1)
			q <= 1'b0; 
		else if (enable)
			q <= d;         
    end
endmodule