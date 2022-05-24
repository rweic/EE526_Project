module gaussian_ctrl (
  clk,
  rst,
  raddr,
  waddr,
  ren1,
  wen1,
  ren2,
  wen2,
  writefile
);

// parameters
parameter BITS = 8;
parameter WIDTH = 7;
parameter ADDRLEN = 19;
parameter MASKLEN = 392;
parameter ROW = 480;
parameter COL = 640;
integer i = 0;
integer j = 0;

// inputs
input clk;
input rst;
// outputs
output reg [ADDRLEN-1:0] raddr;
output reg [ADDRLEN-1:0] waddr;
output reg ren1;
output reg wen1;
output reg ren2;
output reg wen2;
output reg writefile;

// internal variables
wire [BITS-1:0] output_pixel;
wire [MASKLEN-1:0] rdata1, rdata2;
reg  [MASKLEN-1:0] input_pixels;

always @(posedge clk) begin
  if (rst) begin
    ren1 <= 1'b0;
    ren2 <= 1'b0;
    wen1 <= 1'b0;
    wen2 <= 1'b0; 
    writefile <= 1'b0;
    raddr <= 19'b0000000000000000000;
    waddr <= 19'b0000000000000000000;
    i <= 0;
    j <= 0;
  end
  else if (i < ROW - WIDTH + 1) begin
    ren1 <= 1'b1;
    ren2 <= 1'b0;
    wen1 <= 1'b0;
    wen2 <= 1'b1;
    writefile <= 1'b0;
    if (j < COL - WIDTH + 1) begin
      raddr <= 640 * i + j;
      waddr <= 640 * (i+3) + (j+3);
      j <= j + 1;
    end
    else begin
      raddr <= 19'b0000000000000000000;
      waddr <= 19'b0000000000000000000;
      i <= i+1;
      j <= 0;
    end
  end
  else begin
    ren1 <= 1'b0;
    ren2 <= 1'b0;
    wen1 <= 1'b0;
    wen2 <= 1'b0;
    writefile = 1'b1;
    raddr <= 19'b0000000000000000000;
    waddr <= 19'b0000000000000000000;
  end
end
  
endmodule
