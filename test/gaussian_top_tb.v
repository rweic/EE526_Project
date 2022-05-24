`timescale 1 ns/ 1 ps
module gaussian_top_tb();
reg clk, rst;
wire done;

gaussian_top gt (clk, rst, done);

initial begin
	clk = 1'b0;
	repeat (1000000) clk = #2 ~clk;
end

initial
  begin
    $dumpfile("gaussian_top_tb.vcd");
    $dumpvars(0, gaussian_top_tb);
    // test 1
    rst = 1'b1;
    #10
    // test 2
    rst = 1'b0;
    // test 3
    #1300000
    //#2000
    $finish ; // This causes the simulation to end.  Without, it would go on..and on.
  end
  
endmodule
