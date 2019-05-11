`timescale 1ns/10ps

module B (
    out,
    x,
    clock,
    reset
);


output [31:0] out;
reg [31:0] out;
input [31:0] x;
input clock;
input reset;

wire [31:0] d0;
wire [31:0] d1;
wire [31:0] d2;

assign d0 = 32'd1238144;
assign d1 = 32'd12738209;
assign d2 = 32'd281023108;


always @(posedge clock, negedge reset) begin: B_T
    if (reset == 0) begin
        out <= 0;
    end
    else begin
        out <= (((x ^ d0) + d1) ^ d2);
    end
end

endmodule
