/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module seven_seg_22 (
    input [3:0] char,
    output reg [7:0] out
  );
  
  
  
  always @* begin
    out = 8'hff;
    
    case (char)
      1'h0: begin
        out = 8'hf9;
      end
      1'h1: begin
        out = 8'ha1;
      end
      2'h2: begin
        out = 8'hc7;
      end
      2'h3: begin
        out = 8'h86;
      end
      3'h4: begin
        out = 8'h88;
      end
      3'h5: begin
        out = 8'h92;
      end
      3'h6: begin
        out = 8'hc1;
      end
      3'h7: begin
        out = 8'h80;
      end
      4'h8: begin
        out = 8'hc8;
      end
      4'h9: begin
        out = 8'hc0;
      end
      4'ha: begin
        out = 8'h88;
      end
      4'hb: begin
        out = 8'h89;
      end
      4'hc: begin
        out = 8'hc6;
      end
      4'hd: begin
        out = 8'h8c;
      end
      4'he: begin
        out = 8'hff;
      end
      4'hf: begin
        out = 8'h8e;
      end
    endcase
  end
endmodule
