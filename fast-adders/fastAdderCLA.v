`include "carryLookahead16.v"
module fastAdderCLA (
    input clock,
    input reset,
    input [31:0] in_a,
    input [31:0] in_b,
    output [32:0] out_sum
);

    // using generate loop to generate 8 CarryLookahead adders
    parameter WIDTH = 16;

    reg [WIDTH-1:0] reg_in_a;
    reg [WIDTH-1:0] reg_in_b;
    reg [WIDTH:0] reg_out_sum;

    wire [(WIDTH/2):0] sum0;
    // wire [(WIDTH/2):0] sum1;

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

    // wire temp_carry0;
    // assign temp_carry0 = sum0[(WIDTH/2)];
    CLA_16bit adder15_0 (reg_in_a[15:0], reg_in_b[15:0], 1'b0, sum0[(WIDTH/2 -1):0], sum0[(WIDTH/2)]);
    // CLA_16bit adder31_16 (reg_in_a[31:16], reg_in_b[31:16], temp_carry0, sum1[(WIDTH/2 - 1):0], sum1[(WIDTH/2)]);
    // carry_lookahead_adder adder0(reg_in_a, reg_in_b, sum0);
    
    always @(posedge clock) begin
        if (reset) begin
            reg_out_sum <= {WIDTH{1'b0}};
        end 
        else begin
            // reg_out_sum <= {sum1, sum0[(WIDTH/2 - 1):0]};   
            reg_out_sum <= sum0;         
        end        
    end

    assign out_sum = reg_out_sum;
    
endmodule