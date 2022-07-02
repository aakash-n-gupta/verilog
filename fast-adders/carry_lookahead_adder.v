module full_adder (
  input i_bit1,
  input i_bit2,
  input i_carry,
  output o_sum,
  output o_carry);

  assign {o_carry, o_sum} = i_bit1 + i_bit2 + i_carry;
  
endmodule




module carry_lookahead_adder
  #(parameter WIDTH = 32)
  (
   input [WIDTH-1:0] in_a,
   input [WIDTH-1:0] in_b,
   output [WIDTH:0]  out_sum
   );
     
  wire [WIDTH:0]     w_C;
  wire [WIDTH-1:0]   w_G, w_P, w_SUM;
 
  // Create the Full Adders
  genvar             ii;
  generate
    for (ii=0; ii<WIDTH; ii=ii+1) 
      begin
        full_adder full_adder_inst
            ( 
              .i_bit1(in_a[ii]),
              .i_bit2(in_b[ii]),
              .i_carry(w_C[ii]),
              .o_sum(w_SUM[ii]),
              .o_carry()
              );
      end
  endgenerate
 
  // Create the Generate (G) Terms:  Gi=Ai*Bi
  // Create the Propagate Terms: Pi=Ai+Bi
  // Create the Carry Terms:
  genvar             jj;
  generate
    for (jj=0; jj<WIDTH; jj=jj+1) 
      begin
        assign w_G[jj]   = in_a[jj] & in_b[jj];
        assign w_P[jj]   = in_a[jj] | in_b[jj];
        assign w_C[jj+1] = w_G[jj] | (w_P[jj] & w_C[jj]);
      end
  endgenerate
   
  assign w_C[0] = 1'b0; // no carry input on first adder
 
  assign out_sum = {w_C[WIDTH], w_SUM};   // Verilog Concatenation
 
endmodule // carry_lookahead_adder

