`timescale 1ns/1ps
module tb_carryLookahead;

reg[3:0]in_a;
reg[3:0]in_b;
reg in_carry;

reg clk;
wire[3:0]out_sum;
wire out_carry;
wire PG;
wire GG;

integer i;
integer j;
integer k;

carryLookahead uut (.in_a(in_a),.in_b(in_b),.in_carry(in_carry),.out_sum(out_sum),.out_carry(out_carry),.PG(PG), .GG(GG));

parameter PERIOD = 10;

initial begin
    $dumpfile("db_tb_carryLookahead.vcd");
    $dumpvars(0, tb_carryLookahead);
    clk = 1'b0;
    in_a = 4'b0;
    in_b = 4'b0;
    in_carry = 1'b0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clk = ~clk;
end

initial begin
    for (i = 0; i < 16; i = i+1) begin
            for (j = 0; j < 16; j = j+1 ) begin
                for (k = 0; k < 2; k = k+1) begin
                    in_a = i;
                    in_b = j;
                    in_carry = k;
                    #10;
                end
                
            end
    end
    #20;
    $finish();
    
end

endmodule
