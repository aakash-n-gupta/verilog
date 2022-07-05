`include "CLAGenerator.v"
module CLA4Stage64(
    input clock,
    input reset,
    input [63:0] in_a,
    input [63:0] in_b,
    output [64:0] out_sum
);

parameter WIDTH = 64;

// IO buffers
reg [WIDTH-1:0] buffer_in_a;
reg [WIDTH-1:0] buffer_in_b;
reg [WIDTH:0] buffer_out_sum;

// stage 0
reg [WIDTH-1:(WIDTH/4)] pipeline0_in_a;
reg [WIDTH-1:(WIDTH/4)] pipeline0_in_b;
reg [(WIDTH/4):0] pipeline0_sum0; // 8 bits for sum and MSB for carry0
wire [(WIDTH/4):0] sum0;

// stage 1
reg [WIDTH-1:(WIDTH/2)] pipeline1_in_a;
reg [WIDTH-1:(WIDTH/2)] pipeline1_in_b;
reg [(WIDTH/2):0] pipeline1_sum1; // for 8 bits of sum1 and sum0[7:0] without carry
wire [(WIDTH/4):0] sum1;


// stage 2
reg [WIDTH-1:(3*WIDTH/4)] pipeline2_in_a;
reg [WIDTH-1:(3*WIDTH/4)] pipeline2_in_b;
reg [(3*WIDTH/4):0] pipeline2_sum2; // 8 bits of sum2 and 16 bits of {sum1, sum0}
wire [(WIDTH/4):0] sum2;


// stage 3
// reg [8:0] pipeline3_sum3;  //final 32 bit result, doubles as output buffer - feeds to IO port
wire [(WIDTH/4):0] sum3;


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

        // stage 0
        pipeline0_in_a <= buffer_in_a[WIDTH-1:(WIDTH/4)];
        pipeline0_in_b <= buffer_in_b[WIDTH-1:(WIDTH/4)];
        pipeline0_sum0 <= sum0;

        // stage 1
        pipeline1_in_a <= pipeline0_in_a[WIDTH-1:(WIDTH/2)];
        pipeline1_in_b <= pipeline0_in_b[WIDTH-1:(WIDTH/2)];
        pipeline1_sum1 <= {sum1, pipeline0_sum0[(WIDTH/4-1):0]};

        // stage 2
        pipeline2_in_a <= pipeline1_in_a[WIDTH-1:(3*WIDTH/4)];
        pipeline2_in_b <= pipeline1_in_b[WIDTH-1:(3*WIDTH/4)];
        pipeline2_sum2 <= {sum2, pipeline1_sum1[(WIDTH/2 - 1):0]};

        // stage 3
        // pipeline3_sum3 <= sum3;
        buffer_out_sum <= {sum3, pipeline2_sum2[(3*WIDTH/4 - 1):0]};
        // buffer_out_sum <= {pipeline3_sum3, pipeline2_sum2[7:0], pipeline1_sum1[7:0], pipeline0_sum0[7:0]};
    end
    
end
// adders for various stages
// stage 0
CLAGenerator #(.WIDTH(16)) adder0(
    .in_a(buffer_in_a[(WIDTH/4-1):0]),
    .in_b(buffer_in_b[(WIDTH/4-1):0]), 
    .in_carry(1'b0),
    .out_carry(sum0[(WIDTH/4)]),
    .out_sum(sum0[(WIDTH/4-1):0]));
// /stage 1
CLAGenerator #(.WIDTH(16)) adder1(
    .in_a(pipeline0_in_a[(WIDTH/2 - 1):(WIDTH/4)]),
    .in_b(pipeline0_in_b[(WIDTH/2 - 1):(WIDTH/4)]), 
    .in_carry(pipeline0_sum0[(WIDTH/4)]), 
    .out_carry(sum1[(WIDTH/4)]), 
    .out_sum(sum1[(WIDTH/4-1):0]));
// stage 2
CLAGenerator #(.WIDTH(16)) adder2(
    .in_a(pipeline1_in_a[(3*WIDTH/4 - 1):(WIDTH/2)]),
    .in_b(pipeline1_in_b[(3*WIDTH/4 - 1):(WIDTH/2)]), 
    .in_carry(pipeline1_sum1[(WIDTH/2)]), 
    .out_carry(sum2[(WIDTH/4)]), 
    .out_sum(sum2[(WIDTH/4-1):0]));
// stage 3
CLAGenerator #(.WIDTH(16)) adder3(
    .in_a(pipeline2_in_a[WIDTH-1:(3*WIDTH/4)]),
    .in_b(pipeline2_in_b[WIDTH-1:(3*WIDTH/4)]), 
    .in_carry(pipeline2_sum2[(3*WIDTH/4)]), 
    .out_carry(sum3[(WIDTH/4)]), 
    .out_sum(sum3[(WIDTH/4-1):0]));

assign out_sum = buffer_out_sum;

endmodule