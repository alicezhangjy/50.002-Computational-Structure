/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module score_2 (
    input clk,
    input rst,
    input p1,
    input p2,
    output reg [9:0] scr1,
    output reg [9:0] scr2
  );
  
  
  
  wire [16-1:0] M_alu_alu;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  reg [6-1:0] M_alu_alufn;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  alu_10 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .alu(M_alu_alu),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n)
  );
  
  localparam ADD_state = 1'd0;
  localparam MUL_state = 1'd1;
  
  reg M_state_d, M_state_q = ADD_state;
  reg [9:0] M_score1_d, M_score1_q = 1'h0;
  reg [9:0] M_score2_d, M_score2_q = 1'h0;
  
  always @* begin
    M_score1_d = M_score1_q;
    
    M_alu_alufn = 4'bzzzz;
    M_alu_a = 1'h0;
    M_alu_b = 1'h0;
    scr1 = M_score1_q;
    scr2 = M_score2_q;
    
    case (M_state_q)
      ADD_state: begin
        if (p1 == 1'h1) begin
          M_alu_alufn = 1'h0;
          M_alu_a = M_score1_q;
          M_alu_b = 1'h1;
          M_score1_d = M_alu_z;
        end
        if (p2 == 1'h1) begin
          M_alu_alufn = 1'h0;
          M_alu_a = M_score1_q;
          M_alu_b = 1'h1;
          M_score1_d = M_alu_z;
        end
        if (p1 == 2'h2) begin
          M_alu_alufn = 1'h1;
          M_alu_a = M_score1_q;
          M_alu_b = 1'h1;
          M_score1_d = M_alu_z;
        end
        if (p2 == 2'h2) begin
          M_alu_alufn = 1'h1;
          M_alu_a = M_score1_q;
          M_alu_b = 1'h1;
          M_score1_d = M_alu_z;
        end
      end
      MUL_state: begin
        if (p1 == 1'h1) begin
          M_alu_alufn = 17'h186a0;
          M_alu_a = M_score1_q;
          M_alu_b = 2'h2;
          M_score1_d = M_alu_z;
        end
        if (p2 == 1'h1) begin
          M_alu_alufn = 17'h186a0;
          M_alu_a = M_score1_q;
          M_alu_b = 2'h2;
          M_score1_d = M_alu_z;
        end
        if (p1 == 2'h2) begin
          M_alu_alufn = 17'h186a1;
          M_alu_a = M_score1_q;
          M_alu_b = 2'h2;
          M_score1_d = M_alu_z;
        end
        if (p2 == 2'h2) begin
          M_alu_alufn = 17'h186a1;
          M_alu_a = M_score1_q;
          M_alu_b = 2'h2;
          M_score1_d = M_alu_z;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_score1_q <= 1'h0;
      M_score2_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_score1_q <= M_score1_d;
      M_score2_q <= M_score2_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
