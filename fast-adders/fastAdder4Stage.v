`include "carryLookahead16.v"
module fastAdder4Stage(
    input clock,
    input reset,
    input [31:0] in_a,
    input [31:0] in_b,
    output [32:0] out_sum
);

parameter WIDTH = 32;

// IO buffers
reg [31:0] buffer_in_a;
reg [31:0] buffer_in_b;
reg [32:0] buffer_out_sum;

// stage 1
reg [31:8] pipeline1_in_a;
reg [31:8] pipeline1_in_b;
reg [8:0] pipeline1_sum0; // 8 bits for sum and MSB for carry0
wire [8:0] sum0;

// stage 2
reg [31:16] pipeline2_in_a;
reg [31:16] pipeline2_in_b;
reg [8:0] pipeline2_sum1; // for 8 bits of sum1 and sum0[7:0] without carry
wire [8:0] sum1;


// stage 3
reg [31:24] pipeline3_in_a;
reg [31:24] pipeline3_in_b;
reg [8:0] pipeline3_sum2; // 8 bits of sum2 and 16 bits of {sum1, sum0}
wire [8:0] sum2;


// stage 4 
reg [8:0] pipeline_sum3;  //final 32 bit result, doubles as output buffer - feeds to IO port
wire [8:0] sum3;


always @(posedge clock) begin
    if (reset) begin
        // flush IO buffer ports
        buffer_in_a <= {(WIDTH - 1){1'b0}};
        buffer_in_b <= {(WIDTH - 1){1'b0}};
        buffer_out_sum <= {(WIDTH){1'b0}};        
    end 
    else begin
        // buffer Input 
        buffer_in_a <= in_a;
        buffer_in_b <= in_b;

        // stage 1 
        pipeline1_in_a <= buffer_in_a[31:8];
        pipeline1_in_b <= buffer_in_b[31:8];
        pipeline1_sum0 <= sum0;

        // stage 2
        pipeline2_in_a <= pipeline1_in_a[31:16];
        pipeline2_in_b <= pipeline1_in_b[31:16];
        pipeline2_sum1 <= sum1;

        // stage 3
        pipeline3_in_a <= pipeline2_in_a[31:24];
        pipeline3_in_b <= pipeline2_in_b[31:24];
        pipeline3_sum2 <= sum2;

        // stage 4
        pipeline_sum3 <= sum3;
        buffer_out_sum <= {sum3, sum2[7:0], sum1[7:0], sum0[7:0]};        
    end
    
end

CLA_8bit adder0(buffer_in_a[7:0], buffer_in_b[7:0], 1'b0, sum0[7:0], sum0[8]);
CLA_8bit adder1(pipeline1_in_a[15:8], pipeline1_in_b[15:8], pipeline1_sum0[8], sum1[7:0], sum1[8]);
CLA_8bit adder2(pipeline2_in_a[23:16], pipeline2_in_b[23:16], pipeline2_sum1[8], sum2[7:0], sum2[8]);
CLA_8bit adder3(pipeline3_in_a[31:24], pipeline3_in_b[31:24], pipeline3_sum2[8], sum3[7:0], sum3[8]);

assign out_sum = buffer_out_sum;


endmodule