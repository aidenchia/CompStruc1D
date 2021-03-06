/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_controller_10 (
    input clk,
    input rst,
    input auto_button,
    input toggle,
    input start,
    input [15:0] numbers,
    input next,
    output reg [15:0] out,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel
  );
  
  
  
  localparam MANUAL_fsm_controller = 3'd0;
  localparam AUTO_fsm_controller = 3'd1;
  localparam REALAUTO_fsm_controller = 3'd2;
  localparam ALUFN_fsm_controller = 3'd3;
  localparam A_fsm_controller = 3'd4;
  localparam B_fsm_controller = 3'd5;
  localparam ANSWER_fsm_controller = 3'd6;
  
  reg [2:0] M_fsm_controller_d, M_fsm_controller_q = MANUAL_fsm_controller;
  localparam INITIAL_autostate = 4'd0;
  localparam ADDER1_autostate = 4'd1;
  localparam ADDERERROR_autostate = 4'd2;
  localparam BOOL1_autostate = 4'd3;
  localparam BOOLERROR_autostate = 4'd4;
  localparam COMP1_autostate = 4'd5;
  localparam COMPERROR_autostate = 4'd6;
  localparam SHIF1_autostate = 4'd7;
  localparam SHIFERROR_autostate = 4'd8;
  localparam DEMOADDERROR_autostate = 4'd9;
  localparam DEMOBOOLERROR_autostate = 4'd10;
  localparam DEMOCOMPERROR_autostate = 4'd11;
  localparam DEMOSHIFERROR_autostate = 4'd12;
  
  reg [3:0] M_autostate_d, M_autostate_q = INITIAL_autostate;
  wire [8-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [20-1:0] M_seg_values;
  multi_seven_seg_15 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  reg [29:0] M_counter_d, M_counter_q = 1'h0;
  wire [6-1:0] M_ram1_read_data;
  reg [0-1:0] M_ram1_address;
  reg [6-1:0] M_ram1_write_data;
  reg [1-1:0] M_ram1_write_en;
  simple_ram_16 #(.SIZE(3'h6), .DEPTH(1'h1)) ram1 (
    .clk(clk),
    .address(M_ram1_address),
    .write_data(M_ram1_write_data),
    .write_en(M_ram1_write_en),
    .read_data(M_ram1_read_data)
  );
  wire [16-1:0] M_ram2_read_data;
  reg [0-1:0] M_ram2_address;
  reg [16-1:0] M_ram2_write_data;
  reg [1-1:0] M_ram2_write_en;
  simple_ram_17 #(.SIZE(5'h10), .DEPTH(1'h1)) ram2 (
    .clk(clk),
    .address(M_ram2_address),
    .write_data(M_ram2_write_data),
    .write_en(M_ram2_write_en),
    .read_data(M_ram2_read_data)
  );
  wire [16-1:0] M_ram3_read_data;
  reg [0-1:0] M_ram3_address;
  reg [16-1:0] M_ram3_write_data;
  reg [1-1:0] M_ram3_write_en;
  simple_ram_17 #(.SIZE(5'h10), .DEPTH(1'h1)) ram3 (
    .clk(clk),
    .address(M_ram3_address),
    .write_data(M_ram3_write_data),
    .write_en(M_ram3_write_en),
    .read_data(M_ram3_read_data)
  );
  wire [16-1:0] M_result_read_data;
  reg [0-1:0] M_result_address;
  reg [16-1:0] M_result_write_data;
  reg [1-1:0] M_result_write_en;
  simple_ram_17 #(.SIZE(5'h10), .DEPTH(1'h1)) result (
    .clk(clk),
    .address(M_result_address),
    .write_data(M_result_write_data),
    .write_en(M_result_write_en),
    .read_data(M_result_read_data)
  );
  
  wire [1-1:0] M_checker_truth;
  reg [16-1:0] M_checker_alu_input;
  reg [6-1:0] M_checker_alufn;
  reg [16-1:0] M_checker_a;
  reg [16-1:0] M_checker_b;
  checker_20 checker (
    .alu_input(M_checker_alu_input),
    .alufn(M_checker_alufn),
    .a(M_checker_a),
    .b(M_checker_b),
    .truth(M_checker_truth)
  );
  
  wire [16-1:0] M_alu_out;
  reg [6-1:0] M_alu_alufn;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  alu_unit_21 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .out(M_alu_out)
  );
  
  localparam X = 5'h1d;
  
  always @* begin
    M_fsm_controller_d = M_fsm_controller_q;
    M_autostate_d = M_autostate_q;
    M_counter_d = M_counter_q;
    
    M_seg_values = 20'h739ce;
    M_ram1_address = 1'h0;
    M_ram1_write_data = 6'bxxxxxx;
    M_ram1_write_en = 1'h0;
    M_ram2_address = 1'h0;
    M_ram2_write_data = 16'bxxxxxxxxxxxxxxxx;
    M_ram2_write_en = 1'h0;
    M_ram3_address = 1'h0;
    M_ram3_write_data = 16'bxxxxxxxxxxxxxxxx;
    M_ram3_write_en = 1'h0;
    M_result_address = 1'h0;
    M_result_write_data = 16'bxxxxxxxxxxxxxxxx;
    M_result_write_en = 1'h0;
    M_alu_alufn = 16'bxxxxxxxxxxxxxxxx;
    M_alu_a = 16'bxxxxxxxxxxxxxxxx;
    M_alu_b = 16'bxxxxxxxxxxxxxxxx;
    M_checker_alufn = 16'bxxxxxxxxxxxxxxxx;
    M_checker_a = 16'bxxxxxxxxxxxxxxxx;
    M_checker_b = 16'bxxxxxxxxxxxxxxxx;
    M_checker_alu_input = 16'bxxxxxxxxxxxxxxxx;
    out = 16'h0000;
    io_sel = 4'h0;
    io_seg = 8'hff;
    
    case (M_fsm_controller_q)
      MANUAL_fsm_controller: begin
        M_seg_values = 20'h00443;
        io_seg = M_seg_seg;
        io_sel = ~M_seg_sel;
        if (toggle) begin
          M_fsm_controller_d = AUTO_fsm_controller;
        end
        if (start) begin
          M_fsm_controller_d = ALUFN_fsm_controller;
        end
      end
      ALUFN_fsm_controller: begin
        M_seg_values = 20'h209e8;
        io_seg = M_seg_seg;
        io_sel = ~M_seg_sel;
        M_ram1_write_data = numbers;
        M_ram1_write_en = 1'h1;
        if (next) begin
          M_fsm_controller_d = A_fsm_controller;
        end
        if (toggle) begin
          M_fsm_controller_d = MANUAL_fsm_controller;
        end
      end
      A_fsm_controller: begin
        M_seg_values = 20'h239ce;
        io_seg = M_seg_seg;
        io_sel = ~M_seg_sel;
        M_ram2_write_data = numbers;
        M_ram2_write_en = 1'h1;
        if (next) begin
          M_fsm_controller_d = B_fsm_controller;
        end
      end
      B_fsm_controller: begin
        M_seg_values = 20'h3b9ce;
        io_seg = M_seg_seg;
        io_sel = ~M_seg_sel;
        M_ram3_write_data = numbers;
        M_ram3_write_en = 1'h1;
        if (next) begin
          M_fsm_controller_d = ANSWER_fsm_controller;
        end
      end
      ANSWER_fsm_controller: begin
        M_seg_values = 20'h220ae;
        io_seg = M_seg_seg;
        io_sel = ~M_seg_sel;
        M_alu_alufn = M_ram1_read_data;
        M_alu_a = M_ram2_read_data;
        M_alu_b = M_ram3_read_data;
        out = M_alu_out;
        if (next) begin
          M_fsm_controller_d = ALUFN_fsm_controller;
        end
        if (toggle) begin
          M_fsm_controller_d = MANUAL_fsm_controller;
        end
      end
      AUTO_fsm_controller: begin
        M_seg_values = 20'h219ce;
        io_seg = M_seg_seg;
        io_sel = ~M_seg_sel;
        if (toggle) begin
          M_fsm_controller_d = MANUAL_fsm_controller;
        end
        if (start) begin
          M_fsm_controller_d = REALAUTO_fsm_controller;
        end
      end
      REALAUTO_fsm_controller: begin
        out = M_result_read_data;
        
        case (M_autostate_q)
          INITIAL_autostate: begin
            M_counter_d = 1'h0;
            if (M_counter_q == 1'h0) begin
              M_autostate_d = ADDER1_autostate;
            end
          end
          ADDER1_autostate: begin
            M_seg_values = 20'h20651;
            io_seg = M_seg_seg;
            io_sel = ~M_seg_sel;
            M_alu_alufn = 6'h00;
            M_alu_a = 16'h0002;
            M_alu_b = 16'h0001;
            M_result_write_data = M_alu_out;
            M_result_write_en = 1'h1;
            M_counter_d = M_counter_q + 1'h1;
            if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data == 16'h0003) begin
              M_counter_d = 1'h0;
              M_autostate_d = BOOL1_autostate;
            end else begin
              if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data != 16'h0003) begin
                M_counter_d = 1'h0;
                M_autostate_d = ADDERERROR_autostate;
              end
            end
          end
          ADDERERROR_autostate: begin
            M_counter_d = M_counter_q + 1'h1;
            M_seg_values = 20'h2046e;
            io_seg = M_seg_seg;
            io_sel = ~M_seg_sel;
            if (M_counter_q[29+0-:1] == 1'h1) begin
              M_counter_d = 1'h0;
              M_autostate_d = DEMOBOOLERROR_autostate;
            end
          end
          BOOL1_autostate: begin
            M_seg_values = 20'h3a671;
            io_seg = M_seg_seg;
            io_sel = ~M_seg_sel;
            M_alu_alufn = 6'h1a;
            M_alu_a = 16'h0003;
            M_alu_b = 16'h0001;
            M_result_write_data = M_alu_out;
            M_result_write_en = 1'h1;
            M_counter_d = M_counter_q + 1'h1;
            if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data == 16'h0003) begin
              M_counter_d = 1'h0;
              M_autostate_d = COMP1_autostate;
            end else begin
              if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data != 16'h0003) begin
                M_counter_d = 1'h0;
                M_autostate_d = BOOLERROR_autostate;
              end
            end
          end
          BOOLERROR_autostate: begin
            M_seg_values = 20'h3a46e;
            io_seg = M_seg_seg;
            io_sel = ~M_seg_sel;
            M_counter_d = M_counter_q + 1'h1;
            if (M_counter_q[29+0-:1] == 1'h1) begin
              M_counter_d = 1'h0;
              M_autostate_d = DEMOCOMPERROR_autostate;
            end
          end
          COMP1_autostate: begin
            M_seg_values = 20'h62652;
            io_seg = M_seg_seg;
            io_sel = ~M_seg_sel;
            M_alu_alufn = 6'h33;
            M_alu_a = 16'h0002;
            M_alu_b = 16'h0002;
            M_result_write_data = M_alu_out;
            M_result_write_en = 1'h1;
            M_counter_d = M_counter_q + 1'h1;
            if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data == 16'h0001) begin
              M_counter_d = 1'h0;
              M_autostate_d = SHIF1_autostate;
            end else begin
              if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data != 16'h0001) begin
                M_counter_d = 1'h0;
                M_autostate_d = COMPERROR_autostate;
              end
            end
          end
          COMPERROR_autostate: begin
            M_seg_values = 20'h6246e;
            io_seg = M_seg_seg;
            io_sel = ~M_seg_sel;
            M_counter_d = M_counter_q + 1'h1;
            if (M_counter_q[29+0-:1] == 1'h1) begin
              M_counter_d = 1'h0;
              M_autostate_d = DEMOSHIFERROR_autostate;
            end
          end
          SHIF1_autostate: begin
            M_seg_values = 20'h28a71;
            io_seg = M_seg_seg;
            io_sel = ~M_seg_sel;
            M_alu_alufn = 6'h20;
            M_alu_a = 16'h0003;
            M_alu_b = 16'h0001;
            M_result_write_data = M_alu_out;
            M_result_write_en = 1'h1;
            M_counter_d = M_counter_q + 1'h1;
            if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data == 16'h0006) begin
              M_counter_d = 1'h0;
              M_autostate_d = DEMOADDERROR_autostate;
            end else begin
              if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data != 16'h0006) begin
                M_counter_d = 1'h0;
                M_autostate_d = SHIFERROR_autostate;
              end
            end
          end
          SHIFERROR_autostate: begin
            M_seg_values = 20'h2886e;
            io_seg = M_seg_seg;
            io_sel = ~M_seg_sel;
            M_counter_d = M_counter_q + 1'h1;
            if (M_counter_q[29+0-:1] == 1'h1) begin
              M_counter_d = 1'h0;
              M_autostate_d = INITIAL_autostate;
            end
          end
          DEMOADDERROR_autostate: begin
            M_alu_alufn = 6'h00;
            M_alu_a = 16'h0002;
            M_alu_b = 16'h0001;
            M_result_write_data = M_alu_out + 1'h1;
            M_result_write_en = 1'h1;
            M_seg_values = 20'h20651;
            io_seg = M_seg_seg;
            io_sel = ~M_seg_sel;
            M_counter_d = M_counter_q + 1'h1;
            if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data == 16'h0003) begin
              M_counter_d = 1'h0;
              M_autostate_d = BOOL1_autostate;
            end else begin
              if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data != 16'h0003) begin
                M_counter_d = 1'h0;
                M_autostate_d = ADDERERROR_autostate;
              end
            end
          end
          DEMOBOOLERROR_autostate: begin
            M_seg_values = 20'h3a671;
            io_seg = M_seg_seg;
            io_sel = ~M_seg_sel;
            M_alu_alufn = 6'h1a;
            M_alu_a = 16'h0003;
            M_alu_b = 16'h0001;
            M_result_write_data = M_alu_out + 1'h1;
            M_result_write_en = 1'h1;
            M_counter_d = M_counter_q + 1'h1;
            if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data == 16'h0003) begin
              M_counter_d = 1'h0;
              M_autostate_d = COMP1_autostate;
            end else begin
              if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data != 16'h0003) begin
                M_counter_d = 1'h0;
                M_autostate_d = BOOLERROR_autostate;
              end
            end
          end
          DEMOCOMPERROR_autostate: begin
            M_seg_values = 20'h62652;
            io_seg = M_seg_seg;
            io_sel = ~M_seg_sel;
            M_alu_alufn = 6'h33;
            M_alu_a = 16'h0002;
            M_alu_b = 16'h0002;
            M_result_write_data = M_alu_out + 1'h1;
            M_result_write_en = 1'h1;
            M_counter_d = M_counter_q + 1'h1;
            if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data == 16'h0001) begin
              M_counter_d = 1'h0;
              M_autostate_d = SHIF1_autostate;
            end else begin
              if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data != 16'h0001) begin
                M_counter_d = 1'h0;
                M_autostate_d = COMPERROR_autostate;
              end
            end
          end
          DEMOSHIFERROR_autostate: begin
            M_seg_values = 20'h28a71;
            io_seg = M_seg_seg;
            io_sel = ~M_seg_sel;
            M_alu_alufn = 6'h20;
            M_alu_a = 16'h0003;
            M_alu_b = 16'h0001;
            M_result_write_data = M_alu_out + 1'h1;
            M_result_write_en = 1'h1;
            M_counter_d = M_counter_q + 1'h1;
            if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data == 16'h0006) begin
              M_counter_d = 1'h0;
              M_autostate_d = ADDER1_autostate;
            end else begin
              if (M_counter_q[29+0-:1] == 1'h1 && M_result_read_data != 16'h0006) begin
                M_counter_d = 1'h0;
                M_autostate_d = SHIFERROR_autostate;
              end
            end
          end
        endcase
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
      M_fsm_controller_q <= 1'h0;
      M_autostate_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
      M_fsm_controller_q <= M_fsm_controller_d;
      M_autostate_q <= M_autostate_d;
    end
  end
  
endmodule
