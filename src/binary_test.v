module binary_test (
  // inputs
  input [7:0] x1,
  input [7:0] y1,
  input [7:0] x2,
  input [7:0] y2,
  input [7:0] x3,
  input [7:0] y3,
  input [7:0] x4,
  input [7:0] y4,
  input [7:0] x5,
  input [7:0] y5,
  input [7:0] x6,
  input [7:0] y6,
  input [7:0] x7,
  input [7:0] y7,
  input [7:0] x8,
  input [7:0] y8,
  // outputs
  output reg [7:0] result
);

always@(x1, x2, x3, x4, x5, x6, x7, x8, y1, y2, y3, y4, y5, y6, y7, y8)
  begin
     result[7] <= x1 < y1 ? 1:0;
     result[6] <= x2 < y2 ? 1:0;
     result[5] <= x3 < y3 ? 1:0;
     result[4] <= x4 < y4 ? 1:0;
     result[3] <= x5 < y5 ? 1:0;
     result[2] <= x6 < y6 ? 1:0;
     result[1] <= x7 < y7 ? 1:0;
     result[0] <= x8 < y8 ? 1:0;
  end
endmodule
