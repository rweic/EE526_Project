module dram_ori (
  clk,
  ren,
  wen,
  raddr,
  waddr,
  wdata,
  rdata
);

// parameters
parameter D_WIDTH = 8;
parameter A_WIDTH = 21;
parameter A_DEPTH = (1 << A_WIDTH);
parameter MASKLEN = 392;

// inputs
input clk;
input ren;
input wen;
input [A_WIDTH-1:0] raddr;
input [A_WIDTH-1:0] waddr;
input [D_WIDTH-1:0] wdata;
// outputs
output reg [MASKLEN-1:0] rdata;

// internal variables
integer i;
reg [D_WIDTH-1:0] memory [0:A_DEPTH-1];

always @(posedge clk) begin
  if (ren) begin
    rdata <= {memory[raddr], memory[raddr+1], memory[raddr+2], memory[raddr+3], memory[raddr+4], memory[raddr+5], memory[raddr+6],
              memory[raddr+1280], memory[raddr+1281], memory[raddr+1282], memory[raddr+1283], memory[raddr+1284], memory[raddr+1285], memory[raddr+1286],
              memory[raddr+2560], memory[raddr+2561], memory[raddr+2562], memory[raddr+2563], memory[raddr+2564], memory[raddr+2565], memory[raddr+20'd2566],
              memory[raddr+3840], memory[raddr+3841], memory[raddr+3842], memory[raddr+3843], memory[raddr+3844], memory[raddr+3845], memory[raddr+3846],
              memory[raddr+5120], memory[raddr+5121], memory[raddr+5122], memory[raddr+5123], memory[raddr+5124], memory[raddr+5125], memory[raddr+5126],
              memory[raddr+6400], memory[raddr+6401], memory[raddr+6402], memory[raddr+6403], memory[raddr+6404], memory[raddr+6405], memory[raddr+6406],
              memory[raddr+7680], memory[raddr+7681], memory[raddr+7682], memory[raddr+7683], memory[raddr+7684], memory[raddr+7685], memory[raddr+7686]};
  end
  else if (wen) begin
    memory[waddr] <= wdata;
  end
  else begin
    rdata <= {392{1'b0}};
  end
end

initial begin
  for(i = 0; i < A_DEPTH; i = i + 1)
    memory[i] = 8'hff;
  $readmemh("../../figures/bf/img1.txt", memory, 0, 921599);
end

endmodule
