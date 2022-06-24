module adderGenerator #(parameter WIDTH = 16) (
    input [WIDTH -1 : 0] in_a, 
    input [WIDTH -1 : 0] in_b, 
    input in_carry,
    output [WIDTH - 1 : 0] sum,
    output out_carry 
);

    assign {out_carry, sum} = in_a + in_b;
endmodule

module adderBuf (
    input clock,
    input reset,
    input [31:0] in_a, 
    input [31:0] in_b,
    output [32:0] out_sum
);

parameter WIDTH = 32;

reg [WIDTH-1:0] reg_a;
reg [WIDTH-1:0] reg_b;
reg [WIDTH:0] reg_sum;
// reg reg_carry;

wire [WIDTH:0] sum0;
// wire carry0;

always @(posedge clock) begin
    if(reset) begin
        reg_a <= 32'b0;
        reg_b <= 32'b0;
        reg_sum <= 33'b0;
        // reg_carry <= 1'b0;

    end
else begin
    reg_a <= in_a;
    reg_b <= in_b;
    reg_sum <= sum0;    
    // reg_carry <= carry0;
end
end
adderGenerator #(.WIDTH(32)) adder (reg_a, reg_b, 1'b0, sum0[WIDTH-1:0], sum0[WIDTH]);
// adderGenerator #(.WIDTH(32)) adder (reg_a, reg_b, 1'b0, sum0, carry0);
// assign out_sum ={reg_carry, reg_sum};
assign out_sum = reg_sum;
// assign out_carry = reg_carry;
    
endmodule