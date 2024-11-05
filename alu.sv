module ALU(Ain,Bin,ALUop,out,Z);
  // declarations from Lab 5 outline
  input [15:0] Ain, Bin;
  input [1:0] ALUop;
  output reg [15:0] out;
  output reg Z;

  always_comb begin 
    case (ALUop)   // preforms operations based on the value of ALUop
      2'b00: out = Ain + Bin;             // addition
      2'b01: out = Ain + (~Bin + 1'b1);   // subtraction using 2's complement
      2'b10: out = Ain & Bin;             // bit-wise AND
      default: out = ~Bin;                // bit-wise NOT using 2's complement, ~Bin = -Bin - 1
    endcase 
    Z = (out == 16'b0) ? 1 : 0;   // if the output is 0, Z = 1
  end 
  
endmodule
