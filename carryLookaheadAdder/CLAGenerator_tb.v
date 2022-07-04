`timescale 1ns/1ps

module tb_CLAGenerator;

// parameter WIDTH = 4;
reg clk;

reg [3:0] in_a;
reg [3:0] in_b;
reg in_carry;
wire out_carry;
wire[4:0] out_sum;

CLAGenerator uut (
    .in_a(in_a),
    .in_b(in_b),
    .in_carry(in_carry),
    .out_carry(out_carry),
    .out_sum(out_sum)
);

parameter PERIOD = 10;

initial begin
    $dumpfile("db_tb_CLAGenerator.vcd");
    $dumpvars(0, tb_CLAGenerator);
    clk = 1'b0;
    in_a = 4'd0;
    in_b = 4'd0;
    in_carry = 1'd0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clk = ~clk;
end

initial begin
    #10;
    in_a = 4'd10;
    in_b = 4'd15;
    in_carry = 1'd1;
    #10;
    in_a = 10;
    in_b = 15;
    in_carry = 0;
    #10;
    in_a = 1;
    in_b = 1;
    in_carry = 1;
    #10;
    in_a = 8;
    in_b = 8;
    in_carry = 1;
    #10;
    in_a = 0;
    in_b = 1;
    in_carry = 1;
    #10;
    in_a = 1;
    in_b = 0;
    in_carry = 0;
    #10;
    in_a = 7;
    in_b = 15;
    in_carry = 1;
    #10;
    in_a = 10;
    in_b = 14;
    in_carry = 1;
    #10;
    in_a = 15;
    in_b = 15;
    in_carry = 0;
    #10;
    in_a = 11;
    in_b = 15;
    in_carry = 1;
    #10;
    in_a = 11;
    in_b = 15;
    in_carry = 0;
    #10;
    in_a = 15;
    in_b = 15;
    in_carry = 1;
    #10;
    
    in_a = 7;
    in_b = 7;
    in_carry = 1;
    #10;
    in_a = 8;
    in_b = 0;
    in_carry = 0;
    #10;
    in_a = 0;
    in_b = 8;
    in_carry = 1;
    #10;
    in_a = 7;
    in_b = 7;
    in_carry = 0;
    #10;
    in_a = 8;
    in_b = 8;
    in_carry = 0;
    #10;
    $finish();

    
end

endmodule
