module gaussian_top (
  clk,
  rst,
  done
);

// parameters
parameter BITS = 8;
parameter WIDTH = 7;
parameter ADDRLEN = 21;
parameter MASKLEN = 392;
parameter PATCHLEN = 961*8;

// inputs
input clk;
input rst;
// outputs
output reg done;

// internal variables
wire ren1, wen1, ren2, wen2;
wire [ADDRLEN-1:0] raddr;
wire [ADDRLEN-1:0] waddr;
wire [BITS-1:0] output_pixel;
wire [PATCHLEN-1:0] rdata2;
// reg  [MASKLEN-1:0] input_pixels;
wire writefile; //comment out later
wire [BITS-1:0] gaussian_write;
             
gaussian_ctrl gctrl (.clk(clk),
                     .rst(rst),
                     .outpixeladdr(waddr),
                     .output_pixel(gaussian_write),
                     .renbuffer(ren2),
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

always @(posedge clk) begin
  done <= 1'b0;
  if (writefile)
      done <= 1'b1;
end
  
endmodule
