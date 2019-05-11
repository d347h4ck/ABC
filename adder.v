`timescale 1ns/10ps

module adder (
    out,
    y,
    z,
    clock,
    reset
);


output [31:0] out;
reg [31:0] out;
input [31:0] y;
input [31:0] z;
input clock;
input reset;




always @(posedge clock, negedge reset) begin: ADDER_ADDE
    if (reset == 0) begin
        out <= 0;
    end
    else begin
        out <= (y + z);
    end
end

endmodule
