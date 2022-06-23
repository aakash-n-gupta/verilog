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
    input [15:0] in_a, 
    input [15:0] in_b,
    output [16:0] out_sum
);

reg [15:0] reg_a;
reg [15:0] reg_b;
reg [15:0] reg_sum;
reg reg_carry;

wire [15:0] sum0;
wire carry0;

always @(posedge clock) begin
    if(reset) begin
        reg_a <= 16'b0;
        reg_b <= 16'b0;
        reg_sum <= 16'b0;
        reg_carry <= 1'b0;

    end
else begin
    reg_a <= in_a;
    reg_b <= in_b;
    reg_sum <= sum0;    
    reg_carry <= carry0;
end
end
adderGenerator adder(reg_a, reg_b, 1'b0, sum0, carry0);
assign out_sum ={reg_carry, reg_sum};
// assign out_carry = reg_carry;
    
endmodule