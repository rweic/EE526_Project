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
parameter A_WIDTH = 21;
parameter A_DEPTH = (1 << A_WIDTH);
parameter PATCHLEN = 961*8;

// inputs
input clk;
input ren;
input wen;
input [A_WIDTH-1:0] raddr;
input [A_WIDTH-1:0] waddr;
input [D_WIDTH-1:0] wdata;
input writefile;  // comment out later
// outputs
output reg [PATCHLEN-1:0] rdata;

// internal variables
integer i;
reg [D_WIDTH-1:0] memory [0:A_DEPTH-1];
integer out;
wire [247:0] patch [0:30];

// modify this part later
genvar j;
generate
  for (j=0; j<31; j=j+1) begin
    assign patch[j] = {memory[raddr+(j-15)*1280-15],memory[raddr+(j-15)*1280-14],memory[raddr+(j-15)*1280-13],memory[raddr+(j-15)*1280-12],
                       memory[raddr+(j-15)*1280-11],memory[raddr+(j-15)*1280-10],memory[raddr+(j-15)*1280- 9],memory[raddr+(j-15)*1280- 8],
                       memory[raddr+(j-15)*1280- 7],memory[raddr+(j-15)*1280- 6],memory[raddr+(j-15)*1280- 5],memory[raddr+(j-15)*1280- 4],
                       memory[raddr+(j-15)*1280- 3],memory[raddr+(j-15)*1280- 2],memory[raddr+(j-15)*1280- 1],memory[raddr+(j-15)*1280   ],
                       memory[raddr+(j-15)*1280+ 1],memory[raddr+(j-15)*1280+ 2],memory[raddr+(j-15)*1280+ 3],memory[raddr+(j-15)*1280+ 4],
                       memory[raddr+(j-15)*1280+ 5],memory[raddr+(j-15)*1280+ 6],memory[raddr+(j-15)*1280+ 7],memory[raddr+(j-15)*1280+ 8],
                       memory[raddr+(j-15)*1280+ 9],memory[raddr+(j-15)*1280+10],memory[raddr+(j-15)*1280+11],memory[raddr+(j-15)*1280+12],
                       memory[raddr+(j-15)*1280+13],memory[raddr+(j-15)*1280+14],memory[raddr+(j-15)*1280+15]};
  end
endgenerate


always @(posedge clk) begin
  if (ren) begin
    rdata <= {patch[0], patch[1], patch[2], patch[3], patch[4], patch[5], patch[6], patch[7],
              patch[8], patch[9], patch[10],patch[11],patch[12],patch[13],patch[14],patch[15],
              patch[16],patch[17],patch[18],patch[19],patch[20],patch[21],patch[22],patch[23],
              patch[24],patch[25],patch[26],patch[27],patch[28],patch[29],patch[30]};
  end
  else if (wen) begin
    memory[waddr] <= wdata;
  end
  else begin
    rdata <= {PATCHLEN{1'b0}};
  end
end

/*
// this is just for testing (priting out the memory), comment out later
always @(posedge writefile) begin
  out = $fopen("filtered/out22.txt","w");
  for (i=0; i<921600; i=i+1)
    $fwrite(out,"%h\n",memory[i]);
  $fclose(out);
end
*/

initial begin
  for(i = 0; i < A_DEPTH; i = i + 1)
    memory[i] = 8'hff;
end

endmodule
