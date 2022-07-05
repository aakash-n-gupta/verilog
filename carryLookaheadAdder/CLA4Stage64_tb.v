`timescale 1ns/1ps
module tb_CLA4Stage64;

reg clock ;
reg reset ;
reg [63:0] in_a;
reg [63:0] in_b;
wire [64:0] out_sum;

// reg [31:0] ramdomize;

CLA4Stage64 uut (
    .clock(clock),
    .reset(reset),
    .in_a(in_a),
    .in_b(in_b),
    .out_sum(out_sum)
);

parameter PERIOD = 10;
integer cycles = 0;
integer passed = 0;

initial begin
    $dumpfile("db_tb_CLA4Stage64.vcd");
    $dumpvars(0, tb_CLA4Stage64);
    clock = 1'b0;
    in_a = 64'b0;
    in_b = 64'b0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clock = ~clock;
end

initial begin
    repeat(1000000) begin
        in_a = $random;
        in_b = $random;
        #50;
        cycles = cycles + 1;
        // $display("%x + %x = %x ", in_a, in_b, out_sum);
        if(in_a + in_b != out_sum)
            $display("cycle %0d:TEST FAILED: Expected %x got %x",cycles ,(in_a + in_b), out_sum);
        else begin
            passed = passed+1;
        end
    end
    $display("PASSED: %0d test cases passed in %0d cycles!",passed, cycles);
    $finish();
end


endmodule
