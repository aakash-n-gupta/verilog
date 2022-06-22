`include "adderGenerator.v"

module adderBuf (
    input clock,
    input reset,
    input [15:0] in_a, 
    input [15:0] in_b,
    output [15:0] out_sum
);

reg [15:0] reg_a;
reg [15:0] reg_b;
reg [15:0] reg_sum;
reg reg_carry;

wire [15:0] sum0;
wire carry0;

always @(posedge clock) begin

    reg_a <= in_a;
    reg_b <= in_b;
    reg_sum <= sum0;    
    reg_carry <= carry0;
end
adderGenerator adder(reg_a, reg_b, 1'b0, sum0, carry0);
assign out_sum = reg_sum;
    
endmodule