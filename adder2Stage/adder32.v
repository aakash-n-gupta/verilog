module adderGenerator #(parameter WIDTH = 32) (
    input [WIDTH - 1 : 0] in_a, 
    input [WIDTH - 1 : 0] in_b, 
    input in_carry,
    output [WIDTH - 1 : 0] sum,
    output out_carry 
);

    assign {out_carry, sum} = in_a + in_b + in_carry;
endmodule

module adder32 #(parameter WIDTH = 32)(
    input clock,
    input reset,
    input [WIDTH - 1:0] in_a, 
    input [WIDTH - 1:0] in_b,
    output [WIDTH:0] out_sum
);

wire [WIDTH:0] sum0;
// wire carry0;

reg [WIDTH:0] buffer_out_sum;

always @(posedge clock) begin
    if(reset) begin
        buffer_out_sum <= {WIDTH{1'b0}};
    end
else begin
    buffer_out_sum <= sum0;
end
end
adderGenerator adder(in_a, in_b, 1'b0, sum0[WIDTH-1:0], sum0[WIDTH]);
assign out_sum = buffer_out_sum;
    
endmodule

// input not buffered, synthesys fails 
/*
Error: resize.tcl, 62 empty command name ""
Command exited with non-zero status 1
Elapsed time: 0:00.46[h:]min:sec. CPU time: user 0.43 sys 0.03 (99%). Peak memory: 100276KB.
Makefile:491: recipe for target 'results/nangate45/adder32/base/3_4_place_resized.odb' failed
make: *** [results/nangate45/adder32/base/3_4_place_resized.odb] Error 1
*/