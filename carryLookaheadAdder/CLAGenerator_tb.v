`timescale 1ns/1ps

module tb_CLAGenerator;

parameter WIDTH = 32;
reg clk;

reg [WIDTH-1:0] in_a;
reg [WIDTH-1:0] in_b;
reg in_carry;
// wire out_carry;
wire[WIDTH:0] out_sum;

CLAGenerator #(.WIDTH(32)) uut (
    .in_a(in_a),
    .in_b(in_b),
    .in_carry(in_carry),
    .out_carry(out_sum[WIDTH]),
    .out_sum(out_sum[WIDTH-1:0])
);

parameter PERIOD = 10;

initial begin
    $dumpfile("db_tb_CLAGenerator.vcd");
    $dumpvars(0, tb_CLAGenerator);
    clk = 1'b0;
    in_a = {(WIDTH-1){1'd0}};
    in_b = {(WIDTH-1){1'd0}};
    in_carry = 1'd0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clk = ~clk;
end

initial begin

    repeat(1000) begin
        in_a = $random;
        in_b = $random;
        in_carry = $random;
        #10;
        // $display("%0d + %0d + %0d = %0d ", in_a, in_b, in_carry, out_sum);
        if(in_a + in_b + in_carry != out_sum)
            $display("TEST FAILED: Output value did not match!");
    end
    $finish();
end

endmodule
