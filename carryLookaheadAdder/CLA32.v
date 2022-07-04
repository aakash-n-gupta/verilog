`include "CLAGenerator.v"
module CLA32 (
    input clock,
    input reset,
    input [31:0] in_a,
    input [31:0] in_b,
    output [32:0] out_sum
);
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

    // CLAGenerator #(.WIDTH(32)) adder0 (reg_in_a, reg_in_b, 1'b0, sum0[WIDTH], sum0[WIDTH-1:0]);

    CLAGenerator #(.WIDTH(16)) adder0 (reg_in_a[(WIDTH/2-1):0], reg_in_b[(WIDTH/2-1):0], 1'b0, sum0[WIDTH/2], sum0[(WIDTH/2-1):0]);
    CLAGenerator #(.WIDTH(16)) adder1 (reg_in_a[WIDTH-1:WIDTH/2], reg_in_b[WIDTH-1:WIDTH/2] ,sum0[WIDTH], sum0[WIDTH],sum0[(WIDTH/2-1):0]);
    
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