module ALU(Ain,Bin,ALUop,out,Z);
  input [15:0] Ain, Bin;
  input [1:0] ALUop;
  output [15:0] out;
  output Z;

  always_comb begin 
    case (ALUop) 
      2'b00: out = Ain + Bin;
      2'b01: out = Ain - Bin; 
      2'b10: out = Ain && Bin; 
      default: out = ~Bin; 
    endcase 
    case (out)
      2'b0000000000000000: Z = 1; 
      default: Z = 0; 
    endcase 
  end 
  
endmodule
