module dram_ori (
  // inputs
  input clk,
  input ren,
  input wen,
  input [18:0] raddr,
  input [18:0] waddr,
  input [7:0] wdata,
  // input writefile,  // comment out later
  
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
    rdata <= {memory[raddr], memory[raddr+20'd1], memory[raddr+20'd2], memory[raddr+20'd3], memory[raddr+20'd4], memory[raddr+20'd5], memory[raddr+20'd6],
              memory[raddr+20'd640], memory[raddr+20'd641], memory[raddr+20'd642], memory[raddr+20'd643], memory[raddr+20'd644], memory[raddr+20'd645], memory[raddr+20'd646],
              memory[raddr+20'd1280], memory[raddr+20'd1281], memory[raddr+20'd1282], memory[raddr+20'd1283], memory[raddr+20'd1284], memory[raddr+20'd1285], memory[raddr+20'd1286],
              memory[raddr+20'd1920], memory[raddr+20'd1921], memory[raddr+20'd1922], memory[raddr+20'd1923], memory[raddr+20'd1924], memory[raddr+20'd1925], memory[raddr+20'd1926],
              memory[raddr+20'd2560], memory[raddr+20'd2561], memory[raddr+20'd2562], memory[raddr+20'd2563], memory[raddr+20'd2564], memory[raddr+20'd2565], memory[raddr+20'd2566],
              memory[raddr+20'd3200], memory[raddr+20'd3201], memory[raddr+20'd3202], memory[raddr+20'd3203], memory[raddr+20'd3204], memory[raddr+20'd3205], memory[raddr+20'd3206],
              memory[raddr+20'd3840], memory[raddr+20'd3841], memory[raddr+20'd3842], memory[raddr+20'd3843], memory[raddr+20'd3844], memory[raddr+20'd3845], memory[raddr+20'd3846]
    };
  if (wen)
    memory[waddr] <= wdata;
end

// comment out this block later
/*always @(posedge writefile) begin
  out = $fopen("out.txt","w");
  for (i=0; i<307200; i=i+1)
    $fwrite(out,"%h\n",memory[i]);
  $fclose(out);
end*/

initial
begin
  for(i = 0; i < A_DEPTH; i = i + 1)
    memory[i] = 0;
  $readmemh("../../figures/bf/img1.txt", memory, 0, 307199);
  end

endmodule
