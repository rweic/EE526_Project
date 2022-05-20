`define ROW = 480
`define COL = 640

module gaussian_ctrl (
  // inputs
  input clk,
  //input [391:0] input_pixels,
  // outputs
  //output reg [7:0] result
);


parameter BITS = 8;
parameter WIDTH = 7;

// internal variables
reg [BITS-1:0] A [0:WIDTH-1][0:WIDTH-1];
reg [BITS+9:0] sum = 0;


always@(*)
  begin
  end
endmodule
