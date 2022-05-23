module dram (
  // inputs
  input clk,
  input ren,
  input wen,
  input [18:0] raddr,
  input [18:0] waddr,
  input [7:0] wdata,
  input writefile,  // comment out later
  
  // outputs
  output reg [391:0] rdata
);

parameter D_WIDTH =  8;
parameter A_WIDTH =  19;
parameter A_DEPTH = (1 << A_WIDTH);

integer i;
reg [D_WIDTH - 1:0] memory [0:A_DEPTH - 1];

integer out;

always @(posedge clk) begin
  if (ren)
    rdata <= memory[raddr];
  if (wen)
    memory[waddr] <= wdata;
end

// comment out this block later
always @(posedge writefile) begin
  out = $fopen("filtered/out.txt","w");
  for (i=0; i<307200; i=i+1)
    $fwrite(out,"%h\n",memory[i]);
  $fclose(out);
end

initial
begin
  for(i = 0; i < A_DEPTH; i = i + 1)
    memory[i] = 0;
  //$readmemh("../../figures/bf/img1.txt", memory, 0, 307199);
  end

endmodule
