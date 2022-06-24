module adderGenerator #(parameter WIDTH = 16) (
    input [WIDTH -1 : 0] in_a, 
    input [WIDTH -1 : 0] in_b, 
    input in_carry,
    output [WIDTH - 1 : 0] sum,
    output out_carry 
);

    assign {out_carry, sum} = in_a + in_b + in_carry;
endmodule