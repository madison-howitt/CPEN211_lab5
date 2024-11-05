module datapath(datapath_in, vsel, writenum, write, readnum, clk, loada, loadb, shift, asel, bsel, ALUop, loads, loadc, Z_out, datapath_out);
  input [15:0] datapath_in; 
  input [2:0] writenum, readnum;
  input [1:0] shift, ALUop; 
  input vsel, write, clk, loada, loadb, asel, asel, loads, loadc;  
  
  output reg [15:0] datapath_out; 
  output reg Z_out; 

  reg [15:0] data_in, data_out, aout, in, sout, Ain, Bin, out;   // initialize intermediate registers  
  reg Z; 

  always_comb begin 
    data_in = vsel ? datapath_in : datapath_out;   // if vsel is true, datapath_in is copied to data_in
                                                   // else the output datapath_out is copied to data_in 

    // instantiate regfile
    regfile reg_block(.data_in(data_in), .writenum(writenum), .write(write), 
                      .readnum(readnum), .clk(clk), .data_out(data_out));
    
    // instantiate shifter 
    shifter shift_block(.in(in), .shift(shift), .sout(sout));

    Ain = asel ? 16'b0 : aout;
    Bin = bsel ? {11'b0, datapath_in[4:0]} : sout; 

    // instantiate ALU 
    ALU alu_block(.Ain(Ain), .Bin(Bin), .ALUop(ALUop), .out(out), .Z(Z)); 
  end

  always_ff (posedge clk) begin 
    if (loada)   // if loada is selected, the value of data_out is copied to aout
      aout <= data_out; 
    if (loadb)   // if loadb is selected, the value of data_out is copied to in  
      in <= data_out; 
    if (loadc)   // if loadc is selected, the value of out is copied to datapath_out
      datapath_out <= out; 
    if (loads)   // if loads is selected, the value of Z is copied to Z_out
      Z_out <= Z; 
  end 
  
endmodule 
// :)))))))
