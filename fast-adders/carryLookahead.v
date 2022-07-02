module carryLookahead(
    input [3:0] in_a,
    input [3:0] in_b,
    input in_carry,
    output [3:0] out_sum,
    output out_carry
    // output PG,
    // output GG
    );
    wire [3:0] G;
    wire [3:0] P;
    wire [3:0] C;

    assign G = in_a & in_b; //Generate
    assign P = in_a ^ in_b; //Propagate

    assign C[0] = in_carry;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);

    assign out_carry = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
    assign out_sum = P ^ C;
    // assign PG = P[3] & P[2] & P[1] & P[0];
    // assign GG = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
endmodule