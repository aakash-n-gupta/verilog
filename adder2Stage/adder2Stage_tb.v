`timescale  1ns / 10ps

module tb_adder2Stage;
reg clock;
reg reset;
reg[31:0] in_1;
reg[31:0] in_2;
wire[31:0]out_sum;
wire out_carry;

adder2Stage uut (
    .clock(clock),
    .reset(reset),
    .in_1(in_1),
    .in_2(in_2),
    .out_sum(out_sum),
    .out_carry(out_carry)
);

parameter PERIOD = 10;

initial begin
    $dumpfile("db_tb_adder2Stage.vcd");
    $dumpvars(0, tb_adder2Stage);
    $monitor(clock, reset, in_1, in_2, out_sum, out_carry);
    clock = 1'b0;
    reset = 1'b0;
    in_1 = 32'b0;
    in_2 = 32'b0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clock = ~clock;
end

initial begin
    // #10;
    in_1 = 32'd3827;
    in_2 = 32'd9273;
    #20;
    in_1 = 32'd3827;
    in_2 = 32'd9273;
    #20;    
    in_1 = 32'd0;
    in_2 = 32'd9253;
    #20;    
    in_1 = 32'd1;
    in_2 = 32'd0;
    #20;    
    in_1 = 32'd200;
    in_2 = 32'd100;
    #20;
    reset = 1;
    #20;
    reset = 0;
    #20;    
    in_1 = 32'd0;
    in_2 = 32'd9273;
    #20;    
    in_1 = 32'd0;
    in_2 = 32'd0;
    #20;    
    in_1 = 32'd13442;
    in_2 = 32'd10042;
    #40;
    in_1 = 32'hfffffff;
    in_2 = 32'hffffffef;
    #40;
    reset = 1;
    #10;
    reset = 0;
    #20;    
    in_1 = 32'd0;
    in_2 = 32'd9273;
    #20;    
    in_1 = 32'd0;
    in_2 = 32'd0;
    #20;    
    in_1 = 32'd13442;
    in_2 = 32'd10042;
    #20;
    in_1 = 32'hfffffff;
    in_2 = 32'hffffffef;
    reset = 1;
    #100;
    $finish();
end
endmodule
