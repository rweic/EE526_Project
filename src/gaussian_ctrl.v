`define ROW = 480
`define COL = 640

module gaussian_ctrl (
  // inputs
  input clk,
  // outputs
  output reg [391:0] pixels
);


parameter BITS = 8;
parameter WIDTH = 7;
integer i, j;



always_ff @(posedge clk)
  begin
    $display(BITS);
  end
endmodule
