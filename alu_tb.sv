module tb_alu();
  // declarations from Lab 5 outline
  reg [15:0] data_in;
  reg [2:0] writenum, readnum;
  reg write, clk;
  wire [15:0] data_out;
  
  regfile dut(.data_in(data_in), .writenum(writenum), .write(write), .readnum(readnum), .clk(clk), .data_out(data_out));
endmodule: tb_alu
