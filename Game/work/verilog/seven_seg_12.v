/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module seven_seg_12 (
    input [3:0] char,
    output reg [6:0] segs
  );
  
  
  
  always @* begin
    
    case (char)
      1'h0: begin
        segs = 7'h40;
      end
      1'h1: begin
        segs = 7'h79;
      end
      2'h2: begin
        segs = 7'h24;
      end
      2'h3: begin
        segs = 7'h30;
      end
      3'h4: begin
        segs = 7'h19;
      end
      3'h5: begin
        segs = 7'h12;
      end
      3'h6: begin
        segs = 7'h02;
      end
      3'h7: begin
        segs = 7'h78;
      end
      4'h8: begin
        segs = 7'h00;
      end
      4'h9: begin
        segs = 7'h10;
      end
      default: begin
        segs = 7'h00;
      end
    endcase
  end
endmodule
