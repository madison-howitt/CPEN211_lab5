module datapath(datapath_in, vsel, writenum, write, readnum, clk, loada, loadb, shift, asel, bsel, ALUop, loads, loadc, Z_out, datapath_out);
  input [15:0] datapath_in; 
  input [2:0] writenum, readnum;
  input [1:0] shift, ALUop; 
  input vsel, write, clk, loada, loadb, asel, asel, loads, loadc;   
  output [15:0] datapath_out; 
  output Z_out; 

  reg [15:0] data_in 

  always_comb begin 
    data_in = vsel ? datapath_in : datapath_out;
    
    regfile register(data_in, writenum, write, readnum, clk, data_out); 
    
  


  
  
  
  // :)))))))
