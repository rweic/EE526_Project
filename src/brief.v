module brief (
  // inputs
  input clk,
  // outputs
  output reg [127:0] desc
);


parameter BITS = 8;
parameter WIDTH = 7;
integer i, j;

// random pick block

// ctrl block

// compare block

always_ff @(posedge clk)
  begin
    $display(BITS);
  end
endmodule
