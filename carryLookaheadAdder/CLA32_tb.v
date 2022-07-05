`timescale 1ns/1ps
module tb_CLA32;

reg clock ;
reg reset ;
reg [31:0] in_a;
reg [31:0] in_b;
wire [32:0] out_sum;

CLA32 uut (
    .clock(clock),
    .reset(reset),
    .in_a(in_a),
    .in_b(in_b),
    .out_sum(out_sum)
);

parameter PERIOD = 10;
integer cycles = 0;

initial begin
    $dumpfile("db_tb_CLA32.vcd");
    $dumpvars(0, tb_CLA32);
    clock = 1'b0;
    in_a = 32'b0;
    in_b = 32'b0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clock = ~clock;
end

initial begin
    repeat(1000) begin
        in_a = $urandom;
        in_b = $urandom;
        #10;
        cycles = cycles + 1;
        // $display("%d + %d = %d ", in_a, in_b, out_sum);
        #10;
        if(in_a + in_b != out_sum)
            $display("cycle %d:TEST FAILED: Expected %0d, got %0d",cycles ,(in_a + in_b), out_sum);
    end
    // $display("PASSED: all test cases passed in %d cycles!", cycles);
    $finish();
end


endmodule
