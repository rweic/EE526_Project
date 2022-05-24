module gaussian_top (
  clk,
  rst,
  done
);

// parameters
parameter BITS = 8;
parameter WIDTH = 7;
parameter ADDRLEN = 19;
parameter MASKLEN = 392;

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
wire [MASKLEN-1:0] rdata1, rdata2;
reg  [MASKLEN-1:0] input_pixels;
wire writefile; //comment out later
            
dram_ori dr (.clk(clk),
             .ren(ren1),
             .wen(wen1),
             .raddr(raddr),
             .waddr(waddr),
             .wdata(output_pixel),
             .rdata(rdata1));

dram buffer (.clk(clk),
             .ren(ren2),
             .wen(wen2),
             .raddr(raddr),
             .waddr(waddr),
             .wdata(output_pixel),
             .writefile(writefile),
             .rdata(rdata2));

gaussian_core gc (.clk(clk),
                  .input_pixels(input_pixels),
                  .result(output_pixel));

gaussian_ctrl gctrl (.clk(clk),
                     .rst(rst),
                     .raddr(raddr),
                     .waddr(waddr),
                     .ren1(ren1),
                     .wen1(wen1),
                     .ren2(ren2),
                     .wen2(wen2),
                     .writefile(writefile));

always @(posedge clk) begin
  input_pixels = rdata1;
end

always @(posedge clk) begin
  done <= 1'b0;
  if (writefile)
      done <= 1'b1;
end
  
endmodule
