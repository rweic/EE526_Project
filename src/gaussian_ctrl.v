// This file generate the control signals for gaussian part
module gaussian_ctrl (
  clk,
  rst,
  outpixeladdr,
  output_pixel,
  //renbuffer,
  wenbuffer,
  writefile
);

// parameters
parameter BITS = 8;
parameter WIDTH = 7;
parameter ADDRLEN = 21;
parameter MASKLEN = 392;
parameter ROW = 720;
parameter COL = 1280;
integer i = 0;
integer j = 0;

// inputs
input clk;
input rst;
// outputs
output reg [ADDRLEN-1:0] outpixeladdr;
output wire [BITS-1:0] output_pixel;
//output reg renbuffer;
output reg wenbuffer;
output reg writefile;

// internal variables
reg  ren1, wen1, wen2;
reg  [ADDRLEN-1:0] raddr;
wire [MASKLEN-1:0] input_pixels;
reg  [ADDRLEN-1:0] waddr;
reg  wf_buf, wf_buf2;

dram_ori dr (.clk(clk),
             .ren(ren1),
             .wen(wen1),
             .raddr(raddr),
             .waddr(waddr),
             .wdata(output_pixel),
             .rdata(input_pixels));

gaussian_core gc (.clk(clk),
                  .input_pixels(input_pixels),
                  .result(output_pixel));

always @(posedge clk) begin
  raddr <= 1280 * i + j;
  waddr <= 1280 * (i+3) + (j+3);
  outpixeladdr <= waddr;
  wenbuffer <= wen2;
  writefile <= wf_buf2;
  wf_buf2 <= wf_buf;
end

always @(posedge clk) begin
  if (rst) begin
    ren1 <= 1'b0;
    //renbuffer <= 1'b0;
    wen1 <= 1'b0;
    wen2 <= 1'b0; 
    wf_buf <= 1'b0;
    i <= 0;
    j <= 0;
  end
  else if (i < ROW-WIDTH+1) begin
    if (j < COL-WIDTH) begin
      // shift right by one
      ren1 <= 1'b1;
      //renbuffer <= 1'b0;
      wen1 <= 1'b0;
      wen2 <= 1'b1;
      writefile <= 1'b0;
      j <= j + 1;
    end
    else begin
      // start a new line
      ren1 <= 1'b1;
      //renbuffer <= 1'b0;
      wen1 <= 1'b0;
      wen2 <= 1'b1;
      writefile <= 1'b0;
      i <= i+1;
      j <= 0;
    end
  end
  else begin
    ren1 <= 1'b0;
    //renbuffer <= 1'b0;
    wen1 <= 1'b0;
    wen2 <= 1'b0;
    wf_buf = 1'b1;
  end
end
  
endmodule
