/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  reg [15:0] a;
  
  reg [15:0] b;
  
  reg [15:0] op;
  
  reg [0:0] error;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam IDLE_state = 4'd0;
  localparam ADD_state = 4'd1;
  localparam SUB_state = 4'd2;
  localparam AND_state = 4'd3;
  localparam OR_state = 4'd4;
  localparam XOR_state = 4'd5;
  localparam A_state = 4'd6;
  localparam INVA_state = 4'd7;
  localparam SHL_state = 4'd8;
  localparam SHR_state = 4'd9;
  localparam SRA_state = 4'd10;
  localparam CMPEQ_state = 4'd11;
  localparam CMPLT_state = 4'd12;
  localparam CMPLE_state = 4'd13;
  localparam ERR_state = 4'd14;
  
  reg [3:0] M_state_d, M_state_q = IDLE_state;
  reg [15:0] M_sum_d, M_sum_q = 1'h0;
  reg [31:0] M_counter_d, M_counter_q = 1'h0;
  
  localparam CYCLE = 5'h1a;
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    M_sum_d = M_sum_q;
    
    error = io_dip[0+0+0-:1];
    a = 16'hc292 + error;
    b = 16'h3114;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    
    case (M_state_q)
      IDLE_state: begin
        if (io_button[0+0-:1] == 1'h1) begin
          M_state_d = ADD_state;
        end
      end
      ADD_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 16'hf3a6;
        M_sum_d = a + b;
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            M_counter_d = 1'h0;
            M_state_d = SUB_state;
          end else begin
            M_counter_d = 1'h0;
            M_state_d = ERR_state;
          end
        end
      end
      SUB_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 16'h917e;
        M_sum_d = a - b;
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            io_led[16+7+0-:1] = 1'h1;
            M_state_d = AND_state;
            M_counter_d = 1'h0;
          end else begin
            M_state_d = ERR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      AND_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 16'h0010;
        M_sum_d = a & b;
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            io_led[16+7+0-:1] = 1'h1;
            M_state_d = OR_state;
            M_counter_d = 1'h0;
          end else begin
            M_state_d = ERR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      OR_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 16'hf396;
        M_sum_d = a | b;
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            io_led[16+7+0-:1] = 1'h1;
            M_state_d = XOR_state;
            M_counter_d = 1'h0;
          end else begin
            M_state_d = ERR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      XOR_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 16'hf386;
        M_sum_d = a ^ b;
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            io_led[16+7+0-:1] = 1'h1;
            M_state_d = A_state;
            M_counter_d = 1'h0;
          end else begin
            M_state_d = ERR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      A_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 16'hc292;
        M_sum_d = a;
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            io_led[16+7+0-:1] = 1'h1;
            M_state_d = INVA_state;
            M_counter_d = 1'h0;
          end else begin
            M_state_d = ERR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      INVA_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 16'h3d6d;
        M_sum_d = ~a;
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            io_led[16+7+0-:1] = 1'h1;
            M_state_d = SHL_state;
            M_counter_d = 1'h0;
          end else begin
            M_state_d = ERR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      SHL_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 16'h5240;
        M_sum_d = a << 3'h5;
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            io_led[16+7+0-:1] = 1'h1;
            M_state_d = SHR_state;
            M_counter_d = 1'h0;
          end else begin
            M_state_d = ERR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      SHR_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 16'h0614;
        M_sum_d = a >> 3'h5;
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            io_led[16+7+0-:1] = 1'h1;
            M_state_d = SRA_state;
            M_counter_d = 1'h0;
          end else begin
            M_state_d = ERR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      SRA_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 16'hfe14;
        M_sum_d = $signed(a) >>> 3'h5;
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            io_led[16+7+0-:1] = 1'h1;
            M_state_d = CMPEQ_state;
            M_counter_d = 1'h0;
          end else begin
            M_state_d = ERR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      CMPEQ_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 1'h0;
        M_sum_d = (a == b);
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            io_led[16+7+0-:1] = 1'h1;
            M_state_d = CMPLT_state;
            M_counter_d = 1'h0;
          end else begin
            M_state_d = ERR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      CMPLT_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 1'h1;
        M_sum_d = ($signed(a) < $signed(b));
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            io_led[16+7+0-:1] = 1'h1;
            M_state_d = CMPLE_state;
            M_counter_d = 1'h0;
          end else begin
            M_state_d = ERR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      CMPLE_state: begin
        M_counter_d = M_counter_q + 1'h1;
        op = 1'h1;
        M_sum_d = ($signed(a) <= $signed(b));
        io_led[0+7-:8] = M_sum_q[0+7-:8];
        io_led[8+7-:8] = M_sum_q[8+7-:8];
        if (op == M_sum_q) begin
          io_led[16+7+0-:1] = 1'h1;
        end
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (op == M_sum_q) begin
            io_led[16+7+0-:1] = 1'h1;
            M_state_d = IDLE_state;
            M_counter_d = 1'h0;
          end else begin
            M_state_d = ERR_state;
            M_counter_d = 1'h0;
          end
        end
      end
      ERR_state: begin
        M_counter_d = M_counter_q + 1'h1;
        io_led[16+7-:8] = $signed(2'h3);
        if (M_counter_q[26+0-:1] == 1'h1) begin
          M_state_d = IDLE_state;
          M_counter_d = 1'h0;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_sum_q <= M_sum_d;
    M_counter_q <= M_counter_d;
    M_state_q <= M_state_d;
  end
  
endmodule
