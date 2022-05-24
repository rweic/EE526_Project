module dram (
  clk,
  ren,
  wen,
  raddr,
  waddr,
  wdata,
  writefile,
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
input writefile;  // comment out later
// outputs
output reg [MASKLEN-1:0] rdata;

// internal variables
integer i;
reg [D_WIDTH-1:0] memory [0:A_DEPTH-1];
integer out;

always @(posedge clk) begin
  if (ren) begin
    rdata <= memory[raddr];
  end
  else if (wen) begin
    memory[waddr] <= wdata;
  end
  else begin
    rdata <= {392{1'b0}};
  end
end

always @(posedge writefile) begin
  out = $fopen("filtered/out.txt","w");
  for (i=0; i<307200; i=i+1)
    $fwrite(out,"%h\n",memory[i]);
  $fclose(out);
end

initial begin
  for(i = 0; i < A_DEPTH; i = i + 1)
    memory[i] = 8'hff;
end

endmodule
