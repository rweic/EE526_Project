`timescale 1 ns/ 1 ps
module binary_test_tb();
reg clk;
reg [7:0] x1, x2, x3, x4, x5, x6, x7, x8;
reg [7:0] y1, y2, y3, y4, y5, y6, y7, y8;
wire [7:0] result;

binary_test bt (x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, result);

initial begin
	clk = 1'b0;
	repeat (1000) clk = #5 ~clk;
end

initial
  begin
    $dumpfile("binary_test_tb.vcd");
    $dumpvars(0, binary_test_tb);
    // test 1
    x1 = 8'b11111111;
    y1 = 8'b01111111;
    x2 = 8'b11111111;
    y2 = 8'b01111111;
    x3 = 8'b11111111;
    y3 = 8'b01111111;
    x4 = 8'b11000111;
    y4 = 8'b01111111;
    x5 = 8'b11111111;
    y5 = 8'b01111111;
    x6 = 8'b01111111;
    y6 = 8'b01111001;
    x7 = 8'b11111111;
    y7 = 8'b01100111;
    x8 = 8'b11111111;
    y8 = 8'b01111111;
    #10
    // test 2
    x1 = 8'b00000010;
    y1 = 8'b00000001;
    x2 = 8'b11111111;
    y2 = 8'b01111111;
    x3 = 8'b11111111;
    y3 = 8'b01111111;
    x4 = 8'b11100011;
    y4 = 8'b01111111;
    x5 = 8'b11111111;
    y5 = 8'b01111111;
    x6 = 8'b11111111;
    y6 = 8'b01111101;
    x7 = 8'b11111111;
    y7 = 8'b01111111;
    x8 = 8'b10011111;
    y8 = 8'b01100011;
    #10
    // test 3
    x1 = 8'b10000000;
    y1 = 8'b11111111;
    x2 = 8'b11111111;
    y2 = 8'b01110001;
    x3 = 8'b11110111;
    y3 = 8'b01111111;
    x4 = 8'b11001111;
    y4 = 8'b01111111;
    x5 = 8'b11110011;
    y5 = 8'b01111111;
    x6 = 8'b11111111;
    y6 = 8'b00001111;
    x7 = 8'b11111111;
    y7 = 8'b01111111;
    x8 = 8'b11110001;
    y8 = 8'b01100011;
    #20
    $finish ; // This causes the simulation to end.  Without, it would go on..and on.
  end
  
endmodule
