`timescale 1 ns/ 1 ps
module gaussian_core_tb();
reg clk;
reg [391:0] input_pixels;
wire [7:0] output_pixel;

gaussian_core gc (input_pixels, output_pixel);

initial begin
	clk = 1'b0;
	repeat (1000) clk = #5 ~clk;
end

initial
  begin
    $dumpfile("gaussian_core_tb.vcd");
    $dumpvars(0, gaussian_core_tb);
    // test 1
    input_pixels = {{13{8'b11111111}}, {13{8'b11001111}},{23{8'b11111101}}};
    #10
    // test 2
    input_pixels = {{44{8'b00000001}},{5{8'b00000001}}};
    #10
    // test 3
    input_pixels = {{13{8'b11100011}}, {13{8'b10001111}},{23{8'b00011101}}};
    #20
    $finish ; // This causes the simulation to end.  Without, it would go on..and on.
  end
  
endmodule
