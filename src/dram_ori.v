module dram_ori (
  // inputs
  input clk,
  input ren,
  input wen,
  input [19:0] raddr,
  input [19:0] waddr,
  input [7:0] wdata,
  
  // outputs
  output reg [7:0] rdata
);

parameter D_WIDTH =  8;
parameter A_WIDTH =  20;
parameter A_DEPTH = (1 << A_WIDTH);

integer i;
reg [D_WIDTH - 1:0] memory [0:A_DEPTH - 1];

always @(posedge clk) begin
  if (ren)
    rdata <= memory[raddr];
  if (wen)
    memory[waddr] <= wdata;
end

initial
begin
  /*for(i = 0; i < A_DEPTH; i = i + 1)
    memory[i] = 0;*/
  $readmemh("../../figures/bf/img1.mem", memory);
  end

endmodule
