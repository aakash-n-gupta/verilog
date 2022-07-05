`timescale 1ns/1ps
module tb_CLA2Stage64;

reg clock ;
reg reset ;
reg [63:0] in_a;
reg [63:0] in_b;
wire [64:0] out_sum;

// reg [31:0] ramdomize;

CLA2Stage64 uut (
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
    $dumpfile("db_tb_CLA2Stage64.vcd");
    $dumpvars(0, tb_CLA2Stage64);
    clock = 1'b0;
    in_a = 64'b0;
    in_b = 64'b0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clock = ~clock;
end

initial begin
    repeat(10000) begin
        in_a = $random;
        in_b = $random;
        #30;
        cycles = cycles + 1;
        // $display("%x + %x = %x ", in_a, in_b, out_sum);
        if(in_a + in_b != out_sum)
            $display("cycle %0d:TEST FAILED: Expected %0x got %0x",cycles ,(in_a + in_b), out_sum);
        else begin
            passed = passed+1;
            $display("PASSED: %d test cases passed in %0d cycles!",passed, cycles);
        end
    end
    $finish();
end


endmodule
