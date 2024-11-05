module shifter_tb ();
  reg [15:0] in;
  reg [1:0] shift;
  wire [15:0] s_out;
  reg error;

  shifter dut(.in(in), .shift(shift), .s_out(s_out));
  initial begin
    error = 0;
    //Test case 1: no shift
    in = 16'b1111000011001111;
    shift = 2'b00;
    #10 // wait one clock cycle 
          if s_out !== 16'b1111000011001111
            begin
              $display ("Error got s_out is %b, expected 1111000011001111" , tb_shift.dut.s_out);
              error = 1;
            end 


    //Test case 2: left shift by 1
    in = 16'b1111000011001111;
    shift = 2'b01;
    #10 // wait one clock cycle 
          if s_out !== 16'b1110000110011110
            begin
              $display ("Error got s_out is %b, expected 1110000110011110" , tb_shift.dut.s_out);
              error = 1;
            end 
    //Test case 3: right shift by 1 MSB becomes 0
    in = 16'b1111000011001111;
    shift = 2'b10;
    #10 // wait one clock cycle 
          if s_out !== 16'b0111100001100111
            begin
              $display ("Error got s_out is %b, expected 0111100001100111" , tb_shift.dut.s_out);
              error = 1;
            end 
    //Test case: right shift by 1, MSB is a copy of in's MSB
    in = 16'b1111000011001111;
    shift = 2'b11;
    #10 // wait one clock cycle 
          if s_out !== 16'b1111100001100111
            begin
              $display ("Error got s_out is %b, expected 1111100001100111" , tb_shift.dut.s_out);
              error = 1;
            end
    if (error == 0) 
      $display("Shift.sv passed all tests!);
               else
                 $display("Shift.sv failed atleast 1 test");
                 $stop;
       end
endmodule
                 
               



    
