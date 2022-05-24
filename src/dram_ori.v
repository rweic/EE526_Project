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
parameter A_WIDTH = 19;
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
              memory[raddr+640], memory[raddr+641], memory[raddr+642], memory[raddr+643], memory[raddr+644], memory[raddr+645], memory[raddr+646],
              memory[raddr+1280], memory[raddr+1281], memory[raddr+1282], memory[raddr+1283], memory[raddr+1284], memory[raddr+1285], memory[raddr+1286],
              memory[raddr+1920], memory[raddr+1921], memory[raddr+1922], memory[raddr+1923], memory[raddr+1924], memory[raddr+1925], memory[raddr+20'd1926],
              memory[raddr+2560], memory[raddr+2561], memory[raddr+2562], memory[raddr+2563], memory[raddr+2564], memory[raddr+2565], memory[raddr+20'd2566],
              memory[raddr+3200], memory[raddr+3201], memory[raddr+3202], memory[raddr+3203], memory[raddr+3204], memory[raddr+3205], memory[raddr+20'd3206],
              memory[raddr+3840], memory[raddr+3841], memory[raddr+3842], memory[raddr+3843], memory[raddr+3844], memory[raddr+3845], memory[raddr+3846]
    };
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
  $readmemh("../../figures/bf/img1.txt", memory, 0, 307199);
end

endmodule
