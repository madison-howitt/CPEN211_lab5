module tb_ALU();
  // declarations from Lab 5 outline
  reg [15:0] Ain, Bin;
  reg [1:0] ALUop;
  reg [15:0] out;
  reg Z;

  ALU dut(.Ain(Ain), .Bin(Bin), .ALUop(ALUop), .out(out), .Z(Z));

  initial begin 

    // TEST CASE #1: check for Ain = 6, Bin = 4
    
    Ain = 16'b0000000000000110;  
    Bin = 16'b0000000000000100; 

    ALUop = 2'b00;   // Test for '+'
    #5

    $display("out is %b, expected 16'b0000000000001010", tb_ALU.dut.out);   // 6 + 4 = 10
    $display("Z is %b, expected 0", tb_regfile.dut.Z);                      // 6 + 4 != 0, so Z = 0
    #5

    ALUop = 2'b01;   // Test for '-'
    #5

    $display("out is %b, expected 16'b0000000000000010", tb_ALU.dut.out);   // 6 - 4 = 2
    $display("Z is %b, expected 0", tb_regfile.dut.Z);                      // 6 - 4 != 0, so Z = 0

    ALUop = 2'b10;   // Test for bitwise '&'
    #5

    $display("out is %b, expected 16'b0000000000000100", tb_ALU.dut.out);   // 6 & 4 = 4
    $display("Z is %b, expected 0", tb_regfile.dut.Z);                      // 6 & 4 != 0, so Z = 0

    ALUop = 2'b11;   // Test for bitwise '~'
    #5

    $display("out is %b, expected 16'b1111111111111011", tb_ALU.dut.out);   // ~4 = 65531
    $display("Z is %b, expected 0", tb_regfile.dut.Z);                      // ~4 != 0, so Z = 0

    //_
    
    
    // TEST CASE #2: check for Ain = 8, Bin = 8
    
    Ain = 16'b0000000000001000;  
    Bin = 16'b0000000000001000;   
    
    ALUop = 2'b00;   // Test for '+'
    #5

    $display("out is %b, expected 16'b0000000000010000", tb_ALU.dut.out);   // 8 + 8 = 16
    $display("Z is %b, expected 0", tb_regfile.dut.Z);                      // 8 + 8 != 0, so Z = 0
    #5

    ALUop = 2'b01;   // Test for '-'
    #5

    $display("out is %b, expected 16'b0000000000000000", tb_ALU.dut.out);   // 8 - 8 = 0
    $display("Z is %b, expected 1", tb_regfile.dut.Z);                      // 8 - 8 = 0, so Z = 1

    ALUop = 2'b10;   // Test for bitwise '&'
    #5

    $display("out is %b, expected 16'b0000000000000100", tb_ALU.dut.out);   // 8 & 8 = 8
    $display("Z is %b, expected 0", tb_regfile.dut.Z);                      // 8 & 8 != 0, so Z = 0

    ALUop = 2'b11;   // Test for bitwise '~'
    #5

    $display("out is %b, expected 16'b1111111111110111", tb_ALU.dut.out);   // ~8 = 65527
    $display("Z is %b, expected 0", tb_regfile.dut.Z);                      // ~8 != 0, so Z = 0

    // _ 


    // TEST CASE #3: check for Ain = 5, Bin = -5
    
    Ain = 16'b0000000000000101;  
    Bin = 16'b1000000000000101;   
    
    ALUop = 2'b00;   // Test for '+'
    #5

    $display("out is %b, expected 16'b0000000000000000", tb_ALU.dut.out);   // 5 + -5 = 0
    $display("Z is %b, expected 1", tb_regfile.dut.Z);                      // 5 + -5 = 0, so Z = 1
    #5

    ALUop = 2'b01;   // Test for '-'
    #5

    $display("out is %b, expected 16'b0000000000001010", tb_ALU.dut.out);   // 5 - -5 = 10
    $display("Z is %b, expected 0", tb_regfile.dut.Z);                      // 5 - -5 != 0, so Z = 0

    ALUop = 2'b10;   // Test for bitwise '&'
    #5

    $display("out is %b, expected 16'b0000000000000101", tb_ALU.dut.out);   // 5 & -5 = 5
    $display("Z is %b, expected 0", tb_regfile.dut.Z);                      // 5 & -5 != 0, so Z = 0

    ALUop = 2'b11;   // Test for bitwise '~'
    #5

    $display("out is %b, expected 16'b0111111111111010", tb_ALU.dut.out);   // ~-5 = 32762
    $display("Z is %b, expected 0", tb_regfile.dut.Z);                      // ~-5 != 0, so Z = 0

    //_ 

    $stop
  end 
endmodule: tb_alu
