module datapath(datapath_in, vsel, writenum, write, readnum, clk, loada, loadb, shift, asel, bsel, ALUop, loads, loadc, Z_out, datapath_out);

  Z_out, datapath_out; 
  
  input [15:0] datapath_in; 
  input [2:0] writenum, readnum;
  input [1:0] shift, ALUop; 
  input vsel, write, clk, loada, loadb, asel, asel, loads, loadc;   


  // from ALU file 
  // declarations from Lab 5 outline
  input [15:0] Ain, Bin;
  input [1:0] ALUop;
  output reg [15:0] out;
  output reg Z;

  // from shifter file 
  // declarations of inputs and output
  input [15:0] in; // The 16-bit input that is to be shifted
  input [1:0] shift; //The 2-bit contol signal for the shift operation
  output reg [15:0] sout; //The 16-bit shifted output
  
  
  
  // :)))))))
