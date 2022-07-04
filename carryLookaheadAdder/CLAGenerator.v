module FullAdder(
    input in_bit1,
    input in_bit2,
    input in_carry,
    output out_carry,
    output out_sum); 

    assign {out_carry, out_sum} = in_bit1 + in_bit2 + in_carry;
endmodule

module CLAGenerator #(parameter WIDTH = 4)(
    input [WIDTH-1:0]in_a,
    input [WIDTH-1:0]in_b,
    input in_carry,
    output out_carry,
    output [WIDTH-1:0] out_sum
);

// create full adder and carry lookahead logic
wire [WIDTH-1:0] Gen;
wire [WIDTH-1:0] Prop;
wire [WIDTH-1:0] temp;

wire [WIDTH-1:0] C;

// generateing the CLA logic -- Generate and Propogate signals
assign Gen[0] = in_a[0] & in_b[0];
assign Prop[0] = in_a[0] | in_b[0];
assign C[0] = Gen[0] | (Prop[0] & in_carry);
genvar i;
generate
    for (i = 1; i < WIDTH ; i = i+1) begin
        assign Gen[i] = in_a[i] & in_b[i];
        assign Prop[i] = in_a[i] | in_b[i];
        
        assign C[i] = Gen[i-1] | (Prop[i-1] & C[i-1]);
    end
endgenerate

// generating the full adders for the sum
FullAdder FA_0(in_a[0], in_b[0], in_carry, temp[0], out_sum[0]);
genvar j;
generate
    for (j = 1; j < WIDTH ; j = j+1) begin
        FullAdder FA_inst(.in_bit1(in_a[j]), .in_bit2(in_b[j]), .in_carry(C[j]), .out_carry(temp[j]), .out_sum(out_sum[j]));
    end
endgenerate

assign out_carry = temp[WIDTH-1];
// assign out_sum[WIDTH] = temp[WIDTH-1];

endmodule