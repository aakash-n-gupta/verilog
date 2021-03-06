`timescale  10ns / 1ns

module tb_adderBuf;

reg clock;
reg reset;
reg[31:0] in_a;
reg[31:0] in_b;

wire [32:0] out_sum;

adderBuf uut (
    .clock(clock),
    .reset(reset),
    .in_a(in_a),
    .in_b(in_b),
    .out_sum(out_sum));

parameter PERIOD = 10;

initial begin
    $dumpfile("db_tb_adderBuf.vcd");
    $dumpvars(0, tb_adderBuf);
    $monitor(clock, reset,in_a, in_b, out_sum);
    clock = 1'b0;
    reset = 1'b0;
    in_a = 32'b0;
    in_b = 32'b0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clock = ~clock;

    // #1000;
    // $finish();
end

initial begin
    #20;
    in_a = 32'd3827;
    in_b = 32'd9273;
    #10;
    in_a = 32'd3827;
    in_b = 32'd9273;
    #10;    
    in_a = 32'd0;
    in_b = 32'd9253;
    #10;    
    in_a = 32'd1;
    in_b = 32'd0;
    #10;    
    in_a = 32'd200;
    in_b = 32'd100;
    #10;
    // reset = 1;
    // #10;
    // reset = 0;
    #10;    
    in_a = 32'd0;
    in_b = 32'd9273;
    #10;    
    in_a = 32'd0;
    in_b = 32'd0;
    #10;    
    in_a = 32'd13442;
    in_b = 32'd10042;
    #40;
    in_a = 32'hfffffff;
    in_b = 32'hffffffef;
    #80;
    // reset = 1;
    // #10;
    // reset = 0;
    #10;    
    in_a = 32'd0;
    in_b = 32'd9273;
    #10;    
    in_a = 32'd0;
    in_b = 32'd0;
    #10;    
    in_a = 32'd13442;
    in_b = 32'd10042;
    #10;
    in_a = 32'hfffffff1;
    in_b = 32'h0fffffef;
    #10;
    in_a = 32'hfffffff1;
    in_b = 32'h0fffffef;
    #10;
    in_a = 32'hfffffff1;
    in_b = 32'h0fffffef;
    #10;
    in_a = 32'hefff0001;
    in_b = 32'h0fff0000;
    #10;
    in_a = 32'hffff1000;
    in_b = 32'hfffff000;
    #10;
    in_a = 32'hffff0000;
    in_b = 32'hffff0000;
    #10;
    in_a = 32'hfffffff1;
    in_b = 32'hffffafef;
    #10;
    #10;
    in_a = 32'hfffffff1;
    in_b = 32'hffffafef;
    #10;
    #20
    in_a = 32'hffffeeee;
    in_b = 32'hffff1111;
    #10;
    in_a = 32'hffff3841;
    in_b = 32'hffffb3ae;
    #20;
    in_a = 32'hffff3841;
    in_b = 32'hffffb3ae;
    // reset = 1;
    #100;
    $finish();

end


endmodule
