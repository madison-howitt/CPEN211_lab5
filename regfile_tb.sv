module regfile_tb();
  // declarations from Lab 5 outline
  reg [15:0] data_in;
  reg [2:0] writenum, readnum;
  reg write, clk;
  wire [15:0] data_out;
  
  regfile dut(.data_in(data_in), .writenum(writenum), .write(write), .readnum(readnum), .clk(clk), .data_out(data_out));

  initial begin   // forever looping clock 
        forever begin
            clk = 1'b0; #5; 
            clk = 1'b1; #5; 
        end
    end 
  
  initial begin
    data_in = 16'b0000000000000000;
    writenum = 3'b000;
    readnum = 3'b000;
    write = 0;
    err = 0; 
    #10;   // wait one clock cycle 
    
    // TEST CASE #1: check for j = 42, write = 1, R3
    
    data_in = 16'b0000000000101010;    // data_in = 42
    writenum = 3'b011;                 // writing to R3 
    write = 1;                         // write is true, so 42 is written to R3
    #10; 

    if (dut.R3 !== 16'b0000000000101010) begin 
      $display("ERROR: R3 is %b, expected 1111000011001111", dut.R3);
      err = 1;
    end

    readnum = 3'b011;   // reading R3
    #5;                 // read not coordinated to clk, so don't need to wait a full clock cycle

    if (dut.data_out !== 16'b0000000000101010) begin 
      $display("ERROR: data_out is %b, expected 0000000000101010", dut.data_out);
      err = 1;
    end
    #5; 

    // displays 42 -  42 was written to R3 and then read from R3 

    // PASSED


    // TEST CASE #2: check for j = 91, write = 0, R3

    data_in = 16'b0000000001011011;    // data_in = 91
    writenum = 3'b011;                 // writing to R3
    write = 0;                         // write is false, so 91 is not be written to R3
    #10; 

    if (dut.R3 !== 16'b0000000000101010) begin   // R3 is still 42 since write = 0 
      $display("ERROR: R3 is %b, expected 0000000000101010", dut.R3);
      err = 1;
    end

    readnum = 3'b011;   // reading R3
    #5;                 // read not coordinated to clk, so don't need to wait a full clock cycle

    if (dut.data_out !== 16'b0000000000101010) begin 
      $display("ERROR: data_out is %b, expected 0000000000101010", dut.data_out);
      err = 1;
    end
    #5;

    // displays 42 -  91 was NOT written to R3 so the previous value was read from R3 

    // PASSED 


    // TEST CASE #3: check for j = 166, write = 0, R6

    data_in = 16'b0000000010100110;    // data_in = 166
    writenum = 3'b110;                 // writing to R6
    write = 0;                         // write is false, so 166 is not be written to R3
    #10; 

    if (dut.R6 !== 16'bxxxxxxxxxxxxxxxx) begin 
      $display("ERROR: R6 is %b, expected xxxxxxxxxxxxxxxx", dut.R6);
      err = 1;
    end

    readnum = 3'b110;   // reading R3
    #5;                 // read not coordinated to clk, so don't need to wait a full clock cycle

    if (dut.data_out !== 16'bxxxxxxxxxxxxxxxx) begin 
      $display("ERROR: data_out is %b, expected xxxxxxxxxxxxxxxx", dut.data_out);
      err = 1;
    end
    #5; 

    // displays x - 166 was NOT written to R6 so the previous value was read from R6
    		 // R6 had not yet been written to so it contained a garbage value 

    // PASSED 

    if (err = 0) 
      $display("Passed all tests!");

    $stop;
  end
endmodule: regfile_tb
