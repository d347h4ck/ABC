`timescale 1ns/10ps

module lsfr (
    o0,
    o3,
    clock,
    reset
);


output [31:0] o0;
reg [31:0] o0;
output [31:0] o3;
reg [31:0] o3;
input clock;
input reset;

reg [31:0] z3;
reg [31:0] z2;
reg [31:0] z1;
reg [31:0] z0;



always @(posedge clock, negedge reset) begin: LSFR_WORK
    if (reset == 0) begin
        z0 <= 364;
        o0 <= 0;
        o3 <= 0;
        z2 <= 2;
        z3 <= 3;
        z1 <= 1;
    end
    else begin
        z0 <= z1;
        z1 <= z2;
        z2 <= z3;
        z3 <= ((z2 ^ (z1 << 31)) ^ (z0 >>> 1));
        o0 <= z0;
        o3 <= z3;
    end
end

endmodule
