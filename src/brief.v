// top level module for the gaussian + brief part
module brief (
  clk,
  rst,
  fast_en,
  written,
  x,
  y,
  binary_string
);


// parameters
parameter BITS = 8;
parameter WIDTH = 7;
parameter ADDRLEN = 21;
parameter MASKLEN = 392;
parameter PATCHLEN = 961*8;
parameter PNUM = 256;

// inputs
input clk;
input rst;
input fast_en;
input [10:0] x;
input [10:0] y;
// outputs
output wire written;
output wire [PNUM-1:0] binary_string;

// internal variables
wire ren1, wen1, wen2;
wire  ren2;
wire [ADDRLEN-1:0] raddr;
wire [ADDRLEN-1:0] waddr;
wire [BITS-1:0] output_pixel;
wire [PATCHLEN-1:0] rdata2;
// reg  [MASKLEN-1:0] input_pixels;
wire writefile; //comment out later
wire [BITS-1:0] gaussian_write;
reg  gaussian_done;
assign raddr = (y * 1280 + x);
assign ren2 = fast_en & (x>11'd15) & (y>11'd15) & (x<11'd1265) & (y<11'd705);
             
gaussian_ctrl gctrl (.clk(clk),
                     .rst(rst),
                     .outpixeladdr(waddr),
                     .output_pixel(gaussian_write),
                     /*.renbuffer(ren2),*/
                     .wenbuffer(wen2),
                     .writefile(writefile));
               
dram buffer (.clk(clk),
             .ren(ren2),
             .wen(wen2),
             .raddr(raddr),
             .waddr(waddr),
             .wdata(gaussian_write),
             .writefile(writefile),
             .rdata(rdata2));
             
brief_ctrl bc (.clk(clk),
               .rst(rst),
               .en(fast_en),
               .gaussian_done(gaussian_done),
               .patch(rdata2),
               .written(written),
               .binary_string(binary_string));

always @(posedge clk) begin
  gaussian_done <= 1'b0;
  if (writefile)
      gaussian_done <= 1'b1;
end


endmodule
