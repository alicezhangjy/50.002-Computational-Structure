/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compare_15 (
    input [5:0] alufn,
    input [0:0] z,
    input [0:0] v,
    input [0:0] n,
    output reg [15:0] op
  );
  
  
  
  reg [0:0] cmp;
  
  always @* begin
    
    case (alufn[1+1-:2])
      2'h1: begin
        cmp = z;
      end
      2'h2: begin
        cmp = n ^ v;
      end
      2'h3: begin
        cmp = z | (n ^ v);
      end
      default: begin
        cmp = 1'h0;
      end
    endcase
    op[1+14-:15] = 15'h0000;
    op[0+0-:1] = cmp;
  end
endmodule
