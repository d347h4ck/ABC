`timescale 1ns/10ps

module splitter (
    out1,
    out2,
    in
);


output [31:0] out1;
wire [31:0] out1;
output [31:0] out2;
wire [31:0] out2;
input [31:0] in;

assign out1 = in;
assign out2 = in;

endmodule
