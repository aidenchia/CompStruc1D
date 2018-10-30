/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_unit_26 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out,
    output reg z,
    output reg n,
    output reg v
  );
  
  
  
  reg [15:0] sum;
  
  reg [15:0] xb;
  
  always @* begin
    if (alufn[0+0-:1]) begin
      xb = ~b;
      sum = a - b;
    end else begin
      xb = b;
      sum = a + b;
    end
    out = sum;
    z = (sum[0+15-:16] == 1'h0);
    v = (a[15+0-:1] & xb[15+0-:1] & !(sum[15+0-:1])) | (!(a[15+0-:1]) & !(xb[15+0-:1]) & sum[15+0-:1]);
    n = sum[15+0-:1];
  end
endmodule
