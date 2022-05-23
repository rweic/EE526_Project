module gaussian_ctrl (
  // inputs
  input clk,
  input rst,
  // outputs
  output reg done
);

reg ren1, wen1, ren2, wen2;
reg [18:0] raddr;
reg [18:0] waddr;
//reg [7:0] wdata1, wdata2;
wire [7:0] output_pixel;
wire [391:0] rdata1, rdata2;
reg [391:0] input_pixels;
reg writefile; //comment out later

parameter BITS = 8;
parameter WIDTH = 7;
parameter ROW = 480;
parameter COL = 640;
integer i = 0;
integer j = 0;
            
dram_ori dr(clk, ren1, wen1, raddr, 19'hxxx, 8'hx, rdata1);
dram buffer(clk, ren2, wen2, 19'hxxx, waddr, output_pixel, writefile, rdata2);

gaussian_core gc (.input_pixels(input_pixels), .result(output_pixel));

always @(posedge clk) begin
  //writefile = 1'b0;
  if (i < ROW - 6) begin
    if (j < COL - 6) begin
      ren1 = 1'b1;
      ren2 = 1'b0;
      wen1 = 1'b0;
      wen2 = 1'b1;
      raddr = 19'd640 * i + j;
      waddr = 19'd640 * (i+1) + (j+1);
      input_pixels = rdata1;
      j = j + 1;
    end else begin
      i = i + 1;
      j = 0;
    end
  end else begin
    ren1 = 1'b0;
    ren2 = 1'b0;
    wen1 = 1'b0;
    wen2 = 1'b0;
    writefile = 1'b1;
  end
end

always @(posedge clk) begin
  done <= 1'b0;
  if (writefile)
      done <= 1'b1;
end
  
endmodule
