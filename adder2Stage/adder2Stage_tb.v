`timescale  10ns / 1ns

module tb_adder2Stage;
reg clock;
reg reset;
reg[31:0] in_1;
reg[31:0] in_2;
wire[32:0]out_sum;
wire out_carry;

adder2Stage uut (
    .clock(clock),
    .reset(reset),
    .in_1(in_1),
    .in_2(in_2),
    .out_sum(out_sum)
);

parameter PERIOD = 10;

initial begin
    $dumpfile("db_tb_adder2Stage.vcd");
    $dumpvars(0, tb_adder2Stage);
    $monitor(clock, reset, in_1, in_2, out_sum[31:0], out_sum[32]);
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
    #10;
    in_1 = 32'd3827;
    in_2 = 32'd9273;
    #10;    
    in_1 = 32'd0;
    in_2 = 32'd9253;
    #10;    
    in_1 = 32'd1;
    in_2 = 32'd0;
    #10;    
    in_1 = 32'd200;
    in_2 = 32'd100;
    #10;
    // reset = 1;
    #10;
    reset = 0;
    #10;    
    in_1 = 32'd0;
    in_2 = 32'd9273;
    #10;    
    in_1 = 32'd0;
    in_2 = 32'd0;
    #10;    
    in_1 = 32'd13442;
    in_2 = 32'd10042;
    #40;
    in_1 = 32'hfffffff;
    in_2 = 32'hffffffef;
    #80;
    // reset = 1;
    #10;
    reset = 0;
    #10;    
    in_1 = 32'd0;
    in_2 = 32'd9273;
    #10;    
    in_1 = 32'd0;
    in_2 = 32'd0;
    #10;    
    in_1 = 32'd13442;
    in_2 = 32'd10042;
    #10;
    in_1 = 32'hfffffff1;
    in_2 = 32'h0fffffef;
    #10;
    in_1 = 32'hfffffff1;
    in_2 = 32'h0fffffef;
    #10;
    in_1 = 32'hfffffff1;
    in_2 = 32'h0fffffef;
    #10;
    in_1 = 32'hefff0001;
    in_2 = 32'h0fff0000;
    #10;
    in_1 = 32'hffff1000;
    in_2 = 32'hfffff000;
    #10;
    in_1 = 32'hffff0000;
    in_2 = 32'hffff0000;
    #10;
    in_1 = 32'hfffffff1;
    in_2 = 32'hffffafef;
    #10;
    in_1 = 32'hffffeeee;
    in_2 = 32'hffff1111;
    #10;
    in_1 = 32'hffff3841;
    in_2 = 32'hffffb3ae;
    // reset = 1;
    #100;
    $finish();
end
endmodule
