`timescale 1 ns/ 1 ps
module brief_tb();
parameter len = 500; // 3309 5638


reg clk;
reg rst;
reg fast_en;
wire written;
wire [255:0] binary_string;
reg [255:0] bs_list [0:10000];
wire [7:0] bs [0:31];

integer fid_x;
integer fid_y;
integer fid_output;
reg [10:0] x[0:10000];
reg [10:0] y[0:10000];
reg [10:0] x_temp;
reg [10:0] y_temp;
integer ret_x;
integer ret_y;
integer i;
integer j;
integer k;
integer h;
reg start;

reg buf1;
reg buf2;

brief brief0 (clk, rst, fast_en, written, x_temp, y_temp, binary_string);

initial begin
	clk = 1'b0;
	repeat (2000000) clk = #2 ~clk;
end

initial begin
  $dumpfile("brief_tb.vcd");
  $dumpvars(0, brief_tb);
  // init
  fid_x = $fopen("/home/rouwei/Documents/EE526_Project/figures/x_1.csv","r");
  fid_y = $fopen("/home/rouwei/Documents/EE526_Project/figures/y_1.csv","r");
  fid_output = $fopen("brief/brief_out1.txt","w");
  for(i = 0; i<len; i=i+1) begin
    ret_x = $fscanf(fid_x, "%d%*c", x[i]);
    ret_y = $fscanf(fid_y, "%d%*c", y[i]);
    //ret_x = $fscanf(fid_x, "%d%*c%*c%*c", x[i]);
    //ret_y = $fscanf(fid_y, "%d%*c%*c%*c", y[i]);
    //ret_x = $fscanf(fid_x, "%d\n", x[i]);
    //ret_y = $fscanf(fid_y, "%d\n", y[i]);
    //ret_x = $fread(x,fid_x);
    //ret_y = $fread(y,fid_y);
  end
  rst = 1'b1;
  fast_en = 1'b0;
  j <= 0;
  start <= 1'b0;
  k <= 0;
  #10
  // start gaussian15
  rst = 1'b0;
  #3650000
  start = 1'b1;
  //ret_x = $fread(x,fid_x);
  //ret_y = $fread(y,fid_y);
  //ret_x = $fscanf(fid_x, "%d", x);
  //ret_y = $fscanf(fid_y, "%d", y);    mywriter = csv.writer(file, delimiter=',')
  //$fwrite(fid_output, "test_success");
  #3000
  for (i=0; i<len; i=i+1) begin
    //$fwrite(fid_output,"%h, %h, %h, %h,",bs_list[i]);
    for (h=0;h<256;h=h+8) begin
      $fwrite(fid_output,"%d,",{bs_list[i][h+7],bs_list[i][h+6],bs_list[i][h+5],bs_list[i][h+4],bs_list[i][h+3],bs_list[i][h+2],bs_list[i][h+1],bs_list[i][h]});
    end
  end
  $fclose(fid_x);
  $fclose(fid_y);
  $fclose(fid_output);
  $finish;
end

always @(posedge clk) begin
  if (start & j<len) begin
    x_temp <= x[j];
    y_temp <= y[j];
    j <= j+1;
    fast_en <= 1'b1;
  end
  else begin
    x_temp <= 11'b0;
    y_temp <= 11'b0;
    fast_en <= 1'b0;
  end
end

always @(posedge clk) begin
  buf1 <= fast_en;
  buf2 <= buf1;
end

always @(posedge clk) begin
  //$fwrite(fid_output,"%h,",binary_string);
  if (buf2 & k<len) begin
    bs_list[k] <= binary_string;
    k <= k+1;
  end
end

endmodule
