`timescale 1 ns/ 1 ps
module dram_ori_tb();
reg clk, ren, wen;
reg [19:0] raddr;
reg [19:0] waddr;
reg [7:0] wdata;
wire [7:0] rdata;

dram_ori dr(clk, ren, wen, raddr, waddr, wdata, rdata);

initial begin
	clk = 1'b0;
	repeat (1000) clk = #5 ~clk;
end

initial
  begin
    $dumpfile("dram_ori_tb.vcd");
    $dumpvars(0, dram_ori_tb);
    #20
    // test 1
    ren = 1'b1;
    wen = 1'b0;
    raddr = 20'b0;
    waddr = 20'b0;
    wdata = 8'b0;
    #10
    // test 2
    ren = 1'b1;
    wen = 1'b0;
    raddr = 20'b1;
    waddr = 20'b0;
    wdata = 8'b0;
    #10
    // test 3
    ren = 1'b1;
    wen = 1'b0;
    raddr = 20'b10;
    waddr = 20'b0;
    wdata = 8'b0;
    #10
    // test 4
    ren = 1'b1;
    wen = 1'b0;
    raddr = 20'b1101011111100001;
    waddr = 20'b0;
    wdata = 8'b0;
    #10
    // test 5
    ren = 1'b1;
    wen = 1'b0;
    raddr = 20'b1101011111100010;
    waddr = 20'b0;
    wdata = 8'b0;
    #20
    $finish;
  end
  
endmodule
