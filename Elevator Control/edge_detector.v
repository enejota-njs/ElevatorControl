module edge_detector (
    input clk,
    input btn,
    output reg pulso
	);
    
	 reg btn_sync0, btn_sync1;

    always @(posedge clk) begin
        btn_sync0 <= btn;              
        btn_sync1 <= btn_sync0;         
        pulso <= btn_sync0 & ~btn_sync1; 
    end
	 
endmodule 