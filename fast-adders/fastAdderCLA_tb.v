`timescale 1ns/1ps

module tb_fastAdderCLA;
reg clock;
reg reset;
reg [3:0] in_a;
reg [3:0] in_b;
wire [4:0] out_sum;

fastAdderCLA uut (.clock(clock), .reset(reset), .in_a (in_a), .in_b (in_b), .out_sum(out_sum));

parameter PERIOD = 10;

integer i;
integer j;

initial begin
    $dumpfile("db_tb_fastAdderCLA.vcd");
    $dumpvars(0, tb_fastAdderCLA);
    clock = 1'b0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clock = ~clock;
end

initial begin
    for (i = 0; i < 16; i = i+1) begin
        for (j = 0; j < 16; j = j+1 ) begin
            #2;
            in_a = i;
            in_b = j;
            #20;
            end        
        end
    #20;
    $finish();
end

endmodule
