/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    output reg spi_miso,
    output reg [3:0] spi_channel,
    output reg avr_rx,
    output reg [7:0] io_seg,
    output reg [7:0] io_sel,
    output reg bb1_led,
    output reg bb2_led,
    output reg by1_led,
    output reg by2_led,
    input bb1,
    input bb2,
    input by1,
    input by2
  );
  
  
  
  reg rst;
  
  reg [15:0] time_ones;
  
  reg [15:0] time_tens;
  
  reg start;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [10-1:0] M_score_scr1;
  wire [10-1:0] M_score_scr2;
  reg [1-1:0] M_score_p1;
  reg [1-1:0] M_score_p2;
  score_2 score (
    .clk(clk),
    .rst(rst),
    .p1(M_score_p1),
    .p2(M_score_p2),
    .scr1(M_score_scr1),
    .scr2(M_score_scr2)
  );
  wire [32-1:0] M_pn_gen_num;
  reg [1-1:0] M_pn_gen_next;
  reg [32-1:0] M_pn_gen_seed;
  pn_gen_3 pn_gen (
    .clk(clk),
    .rst(rst),
    .next(M_pn_gen_next),
    .seed(M_pn_gen_seed),
    .num(M_pn_gen_num)
  );
  wire [16-1:0] M_ctr_value;
  counter_4 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  wire [7-1:0] M_all_segs_seg;
  wire [8-1:0] M_all_segs_sel;
  reg [32-1:0] M_all_segs_values;
  multi_seven_seg_5 all_segs (
    .clk(clk),
    .rst(rst),
    .values(M_all_segs_values),
    .seg(M_all_segs_seg),
    .sel(M_all_segs_sel)
  );
  localparam IDLE_state = 3'd0;
  localparam RAND_state = 3'd1;
  localparam B_state = 3'd2;
  localparam Y_state = 3'd3;
  localparam END_state = 3'd4;
  
  reg [2:0] M_state_d, M_state_q = IDLE_state;
  reg [0:0] M_buttonb1_d, M_buttonb1_q = 1'h0;
  reg [0:0] M_buttonb1r_d, M_buttonb1r_q = 1'h0;
  reg [0:0] M_buttonb2_d, M_buttonb2_q = 1'h0;
  reg [0:0] M_buttonb2r_d, M_buttonb2r_q = 1'h0;
  reg [0:0] M_buttony1_d, M_buttony1_q = 1'h0;
  reg [0:0] M_buttony1r_d, M_buttony1r_q = 1'h0;
  reg [0:0] M_buttony2_d, M_buttony2_q = 1'h0;
  reg [0:0] M_buttony2r_d, M_buttony2r_q = 1'h0;
  reg [9:0] M_p1_hundreds_d, M_p1_hundreds_q = 1'h0;
  reg [9:0] M_p1_tens_d, M_p1_tens_q = 1'h0;
  reg [9:0] M_p1_ones_d, M_p1_ones_q = 1'h0;
  reg [9:0] M_p2_hundreds_d, M_p2_hundreds_q = 1'h0;
  reg [9:0] M_p2_tens_d, M_p2_tens_q = 1'h0;
  reg [9:0] M_p2_ones_d, M_p2_ones_q = 1'h0;
  wire [1-1:0] M_bb1_e_out;
  reg [1-1:0] M_bb1_e_in;
  edge_detector_6 bb1_e (
    .clk(clk),
    .in(M_bb1_e_in),
    .out(M_bb1_e_out)
  );
  wire [1-1:0] M_bb2_e_out;
  reg [1-1:0] M_bb2_e_in;
  edge_detector_6 bb2_e (
    .clk(clk),
    .in(M_bb2_e_in),
    .out(M_bb2_e_out)
  );
  wire [1-1:0] M_by1_e_out;
  reg [1-1:0] M_by1_e_in;
  edge_detector_6 by1_e (
    .clk(clk),
    .in(M_by1_e_in),
    .out(M_by1_e_out)
  );
  wire [1-1:0] M_by2_e_out;
  reg [1-1:0] M_by2_e_in;
  edge_detector_6 by2_e (
    .clk(clk),
    .in(M_by2_e_in),
    .out(M_by2_e_out)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_p2_tens_d = M_p2_tens_q;
    M_p2_hundreds_d = M_p2_hundreds_q;
    M_p1_ones_d = M_p1_ones_q;
    M_p1_tens_d = M_p1_tens_q;
    M_p1_hundreds_d = M_p1_hundreds_q;
    M_buttony1r_d = M_buttony1r_q;
    M_buttonb1r_d = M_buttonb1r_q;
    M_buttonb2r_d = M_buttonb2r_q;
    M_p2_ones_d = M_p2_ones_q;
    M_buttonb1_d = M_buttonb1_q;
    M_buttony1_d = M_buttony1_q;
    M_buttony2_d = M_buttony2_q;
    M_buttony2r_d = M_buttony2r_q;
    M_buttonb2_d = M_buttonb2_q;
    
    M_bb1_e_in = bb1;
    M_bb2_e_in = bb2;
    M_by1_e_in = by1;
    M_by2_e_in = by2;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_pn_gen_seed = 6'h27;
    M_pn_gen_next = 1'h0;
    time_tens = M_ctr_value / 4'ha;
    time_ones = M_ctr_value - time_tens * 4'ha;
    M_p1_hundreds_d = M_score_scr1 / 7'h64;
    M_p1_tens_d = (M_score_scr1 - (M_p1_hundreds_q * 7'h64)) / 4'ha;
    M_p1_ones_d = M_score_scr1 - M_p1_tens_q * 4'ha;
    M_p2_hundreds_d = M_score_scr2 / 7'h64;
    M_p2_tens_d = (M_score_scr2 - (M_p2_hundreds_q * 7'h64)) / 4'ha;
    M_p2_ones_d = M_score_scr2 - M_p2_tens_q * 4'ha;
    M_all_segs_values = {time_tens[0+3-:4], time_ones[0+3-:4], M_p2_hundreds_q[0+3-:4], M_p2_tens_q[0+3-:4], M_p2_ones_q[0+3-:4], M_p1_hundreds_q[0+3-:4], M_p1_tens_q[0+3-:4], M_p1_ones_q[0+3-:4]};
    io_seg = ~M_all_segs_seg;
    io_sel[0+7-:8] = ~M_all_segs_sel;
    M_score_p1 = 1'h0;
    M_score_p2 = 1'h0;
    bb1_led = M_buttonb1_q;
    bb2_led = M_buttonb2_q;
    by1_led = M_buttony1_q;
    by2_led = M_buttony2_q;
    if (M_bb1_e_out == 1'h1 && M_buttonb1r_q == 1'h1) begin
      M_buttonb1_d = 1'h1;
      M_buttonb1r_d = 1'h0;
    end
    if (M_bb1_e_out == 1'h0 && M_buttonb1r_q == 1'h0 && M_buttonb1_q == 1'h0) begin
      M_buttonb1r_d = 1'h1;
    end
    if (M_bb2_e_out == 1'h1 && M_buttonb2r_q == 1'h1) begin
      M_buttonb2_d = 1'h1;
      M_buttonb2r_d = 1'h0;
    end
    if (M_bb2_e_out == 1'h0 && M_buttonb2r_q == 1'h0 && M_buttonb2_q == 1'h0) begin
      M_buttonb2r_d = 1'h1;
    end
    if (M_by1_e_out == 1'h1 && M_buttony1r_q == 1'h1) begin
      M_buttony1_d = 1'h1;
      M_buttony1r_d = 1'h0;
    end
    if (M_by1_e_out == 1'h0 && M_buttony1r_q == 1'h0 && M_buttony1_q == 1'h0) begin
      M_buttony1r_d = 1'h1;
    end
    if (M_by2_e_out == 1'h1 && M_buttony2r_q == 1'h1) begin
      M_buttony2_d = 1'h1;
      M_buttony2r_d = 1'h0;
    end
    if (M_by2_e_out == 1'h0 && M_buttony2r_q == 1'h0 && M_buttony2_q == 1'h0) begin
      M_buttony2r_d = 1'h1;
    end
    
    case (M_state_q)
      IDLE_state: begin
        led[0+0-:1] = 1'h1;
        if (M_buttonb1_q == 1'h1 && M_buttonb2_q == 1'h1 && M_buttony1_q == 1'h1 && M_buttony2_q == 1'h1) begin
          M_state_d = RAND_state;
          M_buttonb1_d = 1'h0;
          M_buttonb2_d = 1'h0;
          M_buttony1_d = 1'h0;
          M_buttony2_d = 1'h0;
        end
      end
      RAND_state: begin
        led[1+0-:1] = 1'h1;
        start = 1'h1;
        M_pn_gen_next = 1'h1;
        if (M_pn_gen_num[14+0-:1] == 1'h0) begin
          M_state_d = B_state;
        end else begin
          M_state_d = Y_state;
        end
      end
      B_state: begin
        led[2+0-:1] = 1'h1;
        if (M_score_scr1 == 7'h63) begin
          M_state_d = END_state;
        end
        if (M_score_scr2 == 7'h63) begin
          M_state_d = END_state;
        end
        if (M_ctr_value == 1'h0) begin
          M_state_d = END_state;
        end else begin
          if (M_buttonb1_q == 1'h1) begin
            M_score_p1 = 2'h2;
            M_buttonb1_d = 1'h0;
            M_state_d = Y_state;
          end
          if (M_buttonb2_q == 1'h1) begin
            M_score_p2 = 2'h2;
            M_buttonb2_d = 1'h0;
            M_state_d = Y_state;
          end
          if (M_buttony1_q == 1'h1) begin
            M_score_p1 = 1'h1;
            M_buttony1_d = 1'h0;
            M_state_d = Y_state;
          end
          if (M_buttony2_q == 1'h1) begin
            M_score_p2 = 1'h1;
            M_buttony2_d = 1'h0;
            M_state_d = Y_state;
          end
        end
      end
      Y_state: begin
        led[3+0-:1] = 1'h1;
        if (M_score_scr1 == 7'h63) begin
          M_state_d = END_state;
        end
        if (M_score_scr2 == 7'h63) begin
          M_state_d = END_state;
        end
        if (M_ctr_value == 1'h0) begin
          M_state_d = END_state;
        end else begin
          if (M_buttonb1_q == 1'h1) begin
            M_score_p1 = 2'h2;
            M_buttonb1_d = 1'h0;
            M_state_d = B_state;
          end
          if (M_buttonb2_q == 1'h1) begin
            M_score_p2 = 2'h2;
            M_buttonb2_d = 1'h0;
            M_state_d = B_state;
          end
          if (M_buttony1_q == 1'h1) begin
            M_score_p1 = 1'h1;
            M_buttony1_d = 1'h0;
            M_state_d = B_state;
          end
          if (M_buttony2_q == 1'h1) begin
            M_score_p2 = 1'h1;
            M_buttony2_d = 1'h0;
            M_state_d = B_state;
          end
        end
      end
      END_state: begin
        if (M_score_scr1 > M_score_scr2) begin
          led[0+0-:1] = 1'h1;
        end else begin
          led[1+0-:1] = 1'h1;
        end
        M_state_d = IDLE_state;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_buttonb1_q <= 1'h0;
      M_buttonb1r_q <= 1'h0;
      M_buttonb2_q <= 1'h0;
      M_buttonb2r_q <= 1'h0;
      M_buttony1_q <= 1'h0;
      M_buttony1r_q <= 1'h0;
      M_buttony2_q <= 1'h0;
      M_buttony2r_q <= 1'h0;
      M_p1_hundreds_q <= 1'h0;
      M_p1_tens_q <= 1'h0;
      M_p1_ones_q <= 1'h0;
      M_p2_hundreds_q <= 1'h0;
      M_p2_tens_q <= 1'h0;
      M_p2_ones_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_buttonb1_q <= M_buttonb1_d;
      M_buttonb1r_q <= M_buttonb1r_d;
      M_buttonb2_q <= M_buttonb2_d;
      M_buttonb2r_q <= M_buttonb2r_d;
      M_buttony1_q <= M_buttony1_d;
      M_buttony1r_q <= M_buttony1r_d;
      M_buttony2_q <= M_buttony2_d;
      M_buttony2r_q <= M_buttony2r_d;
      M_p1_hundreds_q <= M_p1_hundreds_d;
      M_p1_tens_q <= M_p1_tens_d;
      M_p1_ones_q <= M_p1_ones_d;
      M_p2_hundreds_q <= M_p2_hundreds_d;
      M_p2_tens_q <= M_p2_tens_d;
      M_p2_ones_q <= M_p2_ones_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
