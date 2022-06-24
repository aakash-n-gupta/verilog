`timescale  10ns / 1ns

module tb_adder2StageBuf;
reg clock;
reg reset;
reg[31:0] in_a;
reg[31:0] in_b;
wire[32:0]out_sum;

adder2StageBuf uut (
    .clock(clock),
    .reset(reset),
    .in_a(in_a),
    .in_b(in_b),
    .out_sum(out_sum)
);

parameter PERIOD = 10;

initial begin
    $dumpfile("db_tb_adder2StageBuf.vcd");
    $dumpvars(0, tb_adder2StageBuf);
    $monitor(clock, reset, in_a, in_b, out_sum[32:0]);
    clock = 1'b0;
    reset = 1'b0;
    in_a = 32'b0;
    in_b = 32'b0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clock = ~clock;
end

initial begin
    // #40;
    in_a = 32'd3827;
    in_b = 32'd9273;
    #40;
    in_a = 32'd3827;
    in_b = 32'd9273;
    #40;    
    in_a = 32'd0;
    in_b = 32'd9253;
    #40;    
    in_a = 32'd1;
    in_b = 32'd0;
    #40;    
    in_a = 32'd200;
    in_b = 32'd100;
    #40;
    // reset = 1;
    // #40;
    // reset = 0;
    #40;    
    in_a = 32'd0;
    in_b = 32'd9273;
    #40;    
    in_a = 32'd0;
    in_b = 32'd0;
    #40;    
    in_a = 32'd13442;
    in_b = 32'd10042;
    #40;
    in_a = 32'hfffffff;
    in_b = 32'hffffffef;
    #80;
    // reset = 1;
    // #40;
    // reset = 0;
    #40;    
    in_a = 32'd0;
    in_b = 32'd9273;
    #40;    
    in_a = 32'd0;
    in_b = 32'd0;
    #40;    
    in_a = 32'd13442;
    in_b = 32'd10042;
    #40;
    in_a = 32'hfffffff1;
    in_b = 32'h0fffffef;
    #40;
    in_a = 32'hfffffff1;
    in_b = 32'h0fffffef;
    #40;
    in_a = 32'hfffffff1;
    in_b = 32'h0fffffef;
    #40;
    in_a = 32'hefff0001;
    in_b = 32'h0fff0000;
    #40;
    in_a = 32'hffff1000;
    in_b = 32'hfffff000;
    #40;
    in_a = 32'hffff0000;
    in_b = 32'hffff0000;
    #40;
    in_a = 32'hfffffff1;
    in_b = 32'hffffafef;
    #40;
    in_a = 32'hffffeeee;
    in_b = 32'hffff1111;
    #40;
    in_a = 32'hffff3841;
    in_b = 32'hffffb3ae;
    // reset = 1;
    #400;
    $finish();
end
endmodule
