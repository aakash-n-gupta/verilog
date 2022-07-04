
module carryLookahead(
    input [3:0]in_a,
    input [3:0]in_b,
    input in_carry,
    output out_carry,
    output[3:0]out_sum
    );

  wire [3:1]C;
  wire [0:3]P; 
  wire [0:3]G;
  
  /// Making Ps
  xor #(2) p0(P[0] , in_a[0] , in_b[0]);
  xor #(2) p1(P[1] , in_a[1] , in_b[1]);
  xor #(2) p2(P[2] , in_a[2] , in_b[2]);
  xor #(2) p3(P[3] , in_a[3] , in_b[3]);
  
  /// Making Gs 
  and #(2) g0(G[0] , in_a[0] , in_b[0]);
  and #(2) g1(G[1] , in_a[1] , in_b[1]);
  and #(2) g2(G[2] , in_a[2] , in_b[2]);
  and #(2) g3(G[3] , in_a[3] , in_b[3]);
  
  /// Making C1
  wire tmp1;
  and #(2) c11(tmp1 , P[0] , in_carry);
  or #(2) c12(C[1] , G[0] , tmp1);
  
  /// Making C2
  wire tmp2;
  wire tmp3;
  and #(2) c21(tmp2 , P[1] , G[0]);
  and #(3) c22(tmp3 , P[1] , P[0] , in_carry);
  or #(3) c23(C[2] , tmp2 , tmp3 , G[1]);
  
  /// Making C3
  wire tmp4;
  wire tmp5;
  wire tmp6;
  and #(2) c31(tmp4 , P[2] , G[1]);
  and #(3) c32(tmp5 , P[2] , P[1] , G[0]);
  and #(4) c33(tmp6 , P[2] , P[1] , P[0] , in_carry);
  or #(4) c34(C[3] , tmp4 , tmp5 , tmp6 , G[2]);
  
  /// Making out_carry (C4)
  wire tmp7;
  wire tmp8;
  wire tmp9;
  wire tmp10;
  and #(2) c41(tmp7 , P[3] , G[2]);
  and #(3) c42(tmp8 , P[3] , P[2] , G[1]);
  and #(4) c43(tmp9 , P[3] , P[2] , P[1] , G[0]);
  and #(5) c44(tmp10 , P[3] , P[2] , P[1] , P[0] , in_carry);
  or #(5) c45(out_carry , tmp7 , tmp8 , tmp9 , tmp10 , G[3]);
  
  /// Making Sums
  xor #(2) s0(out_sum[0] , P[0] , in_carry);
  xor #(2) s1(out_sum[1] , P[1] , C[1]);
  xor #(2) s2(out_sum[2] , P[2] , C[2]);
  xor #(2) s3(out_sum[3] , P[3] , C[3]);
  
endmodule

module CLA_16bit(
    input [15:0]in_a,
    input [15:0]in_b, 
    input in_carry,
    output [15:0]out_sum,
    output out_carry );

  wire [3:1] C;
  
  carryLookahead F0_3 (in_a[3:0] , in_b[3:0] , in_carry, C[1], out_sum[3:0]);
  carryLookahead F4_7 (in_a[7:4] , in_b[7:4] , C[1],  C[2],out_sum[7:4]);
  carryLookahead F8_11 (in_a[11:8] , in_b[11:8] , C[2], C[3],out_sum[11:8]);
  carryLookahead F12_15 (in_a[15:12] , in_b[15:12] , C[3] , out_carry,out_sum[15:12]);
  
endmodule

module CLA_8bit(
    input [7:0]in_a,
    input [7:0]in_b, 
    input in_carry,
    output [7:0]out_sum,
    output out_carry );

  wire C;
  // wire [2:1] C;
  
  carryLookahead F0_3 (in_a[3:0] , in_b[3:0] , in_carry, C, out_sum[3:0]);
  carryLookahead F4_7 (in_a[7:4] , in_b[7:4] , C,  out_carry ,out_sum[7:4]);
  // carryLookahead F8_11 (in_a[11:8] , in_b[11:8] , C[2], C[3],out_sum[11:8]);
  // carryLookahead F12_15 (in_a[15:12] , in_b[15:12] , C[3] , out_carry,out_sum[15:12]);
  
endmodule
////////////// --------- ////////////////////////////