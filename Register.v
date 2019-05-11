module Register (input [31:0] D, input Clk, output reg [31:0] Q);
 always @(posedge Clk)
 Q <= D;
endmodule 
