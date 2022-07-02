// `include "carryLookahead.v"
`include "carry_lookahead_adder.v"

module fastAdderCLA (
    input clock,
    input reset,
    input [31:0] in_a,
    input [31:0] in_b,
    output [32:0] out_sum
);

    // using generate loop to generate 8 CarryLookahead adders
    parameter WIDTH = 32;

    reg [WIDTH-1:0] reg_in_a;
    reg [WIDTH-1:0] reg_in_b;
    reg [WIDTH:0] reg_out_sum;

    wire [WIDTH:0] sum0;

    always @(posedge clock) begin
        if (reset) begin
            reg_in_a <= {(WIDTH-1){1'b0}};
            reg_in_b <= {(WIDTH-1){1'b0}};
        end 
        else begin
            reg_in_a <= in_a;
            reg_in_b <= in_b;
        end        
    end

    // carryLookahead adder0 (reg_in_a, reg_in_b, 1'b0, sum0[WIDTH-1:0], sum0[WIDTH]);
    carry_lookahead_adder adder0(reg_in_a, reg_in_b, sum0);
    
    always @(posedge clock) begin
        if (reset) begin
            reg_out_sum <= {WIDTH{1'b0}};
        end 
        else begin
            reg_out_sum <= sum0;            
        end        
    end

    assign out_sum = reg_out_sum;
    
endmodule