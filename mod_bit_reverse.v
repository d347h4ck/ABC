module mod_bit_reverse( in, out );
input wire [31:0]in;
output wire [31:0]out;
genvar i;
generate
  for(i=0; i<32; i=i+1)
  begin
    assign out[31-i] = in[i];
  end
endgenerate
endmodule
