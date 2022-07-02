module adderGenerator #(parameter WIDTH = 16) (
    input [WIDTH -1 : 0] in_a, 
    input [WIDTH -1 : 0] in_b, 
    input in_carry,
    output [WIDTH - 1 : 0] sum,
    output out_carry 
    );
    assign {out_carry, sum} = in_a + in_b + in_carry;
endmodule

module adder2Stage(
    input clock,
    input reset,
    input [31:0] in_1,
    input [31:0] in_2, 
    output [32:0] out_sum
    // output out_carry
);

// parameter WIDTH = 32;

// stage 1  steps --- 
// adder0 adds 15:0 and generates carry0
// pipeline_reg delays 31:16 for in_a and in_b
// sum0 gets stored in pipeline_reg

reg [15:0] pipeline_reg_in_1;
reg [15:0] pipeline_reg_in_2;
reg pipeline_reg_cout0;

reg[32:0] buffer_out_sum;

wire [15:0] sum0;
wire carry0;

adderGenerator adder0 (in_1[15:0], in_2[15:0], 1'b0, sum0, carry0);

always @(posedge clock) begin
    if (reset) begin
        pipeline_reg_in_1 <= 0;
        pipeline_reg_in_2 <= 0;        
        pipeline_reg_cout0 <= 0;
    end

    else begin
        pipeline_reg_in_1 <= in_1[31:16];
        pipeline_reg_in_2 <= in_2[31:16];
        pipeline_reg_cout0 <= carry0;
    end    
end

// stage 1 compelte,,, 
// stage 2 of adder - pipeline sum0 from adder0

reg [15:0] pipeline_sum0;
wire[16:0] sum1;
// wire carry1;

adderGenerator adder1 (pipeline_reg_in_1, pipeline_reg_in_2, pipeline_reg_cout0, sum1[15:0], sum1[16]);

always @(posedge clock) begin
    if (reset) begin
        pipeline_sum0 <= 0;
        
    end
    else begin        
        pipeline_sum0 <= sum0; 
        buffer_out_sum <= {sum1, pipeline_sum0}   ;
    end
end

assign out_sum = buffer_out_sum;
// assign out_sum[32] = carry1;
    
endmodule