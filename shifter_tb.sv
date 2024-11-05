module shifter_tb ();
  reg [15:0] in;
  reg [1:0] shift;
  wire [15:0] sout;
  reg error;
  
//instantiation of the DUT (Device Under Test)
shifter dut (.in(in), .shift(shift), .sout(sout));
  
  initial begin
    error = 0;
    //Test case 1: no shift
    in = 16'b1111000011001111;
    shift = 2'b00;
    #10 // wait one clock cycle 
          if sout !== 16'b1111000011001111
            begin
              $display ("Error, got sout is %b, expected 1111000011001111" , tb_shifter.dut.sout);
              error = 1;
            end 


    //Test case 2: left shift by 1
    in = 16'b1111000011001111;
    shift = 2'b01;
    #10 // wait one clock cycle 
          if sout !== 16'b1110000110011110
            begin
              $display ("Error, got sout is %b, expected 1110000110011110" , tb_shifter.dut.sout);
              error = 1;
            end 
    //Test case 3: right shift by 1 MSB becomes 0
    in = 16'b1111000011001111;
    shift = 2'b10;
    #10 // wait one clock cycle 
          if sout !== 16'b0111100001100111
            begin
              $display ("Error, got sout is %b, expected 0111100001100111" , tb_shifter.dut.sout);
              error = 1;
            end 
    //Test case: right shift by 1, MSB is a copy of in's MSB
    in = 16'b1111000011001111;
    shift = 2'b11;
    #10 // wait one clock cycle 
          if sout !== 16'b1111100001100111
            begin
              $display ("Error, got sout is %b, expected 1111100001100111" , tb_shifter.dut.sout);
              error = 1;
            end
    if (error == 0) 
      $display("Shifter.sv passed all tests!);
               else
                 $display("Shifter.sv failed atleast 1 test");
                 $stop;
       end
endmodule
                 
               



    
