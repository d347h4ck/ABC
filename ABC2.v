`timescale 1ns/10ps

module ABC2 (
	 LED,
    CLOCK_50,
    KEY
);

reg [31:0] out;
input CLOCK_50;
input [1:0] KEY;
output [7:0] LED;

wire reset;
wire clock;

assign reset = KEY[0];
assign clock = CLOCK_50;

wire [31:0] z0;
wire [31:0] z3;

wire  [31:0]  x_in_wire;
wire  [31:0] x_out_wire;
wire  [31:0] B_out_wire;
wire  [31:0]  B_in_wire;
wire  [31:0] pi_in_wire;
wire  [31:0] pol_out_wire;
wire  [31:0] pol_in_wire;

lsfr A(.o0(z0), .o3(z3), .clock(clock), .reset(reset));

Register x(
			.D(x_in_wire),
			.Q(x_out_wire),
			.Clk(clock)
			);
			
adder Add(
			.out(x_in_wire),
			.y(z0),
			.z(B_out_wire),
			.clock(clock),
			.reset(reset)
		);
B B_1(
		 .out(B_out_wire),
		 .x(B_in_wire),
		 .clock(clock),
		 .reset(reset)
		);
splitter S(
		 .out1(B_in_wire),
		 .out2(pi_in_wire),
		 .in(x_out_wire)
		);	
pi Pi(
		 .in(pi_in_wire),
		 .out(pol_in_wire)
);

C C_1(
		 .out(pol_out_wire),
		 .x(pol_in_wire),
		 .a(z3),
		 .clock(clock),
		 .reset(reset)
);

assign LED[7:0] = pol_out_wire[7:0];
	
endmodule
