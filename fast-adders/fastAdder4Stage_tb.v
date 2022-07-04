`timescale 1ns/1ps

module tb_fastAdder4Stage;

reg clock;
reg reset;
reg [31:0] in_a;
reg [31:0] in_b;
wire [32:0] out_sum;

fastAdder4Stage uut (
    .clock(clock),
    .reset(reset),
    .in_a(in_a),
    .in_b(in_b),
    .out_sum(out_sum)
);

parameter PERIOD = 10;

initial begin
    $dumpfile("db_tb_fastAdder4Stage.vcd");
    $dumpvars(0, tb_fastAdder4Stage);
    clock = 1'b0;
    in_a = 32'b0;
    in_b = 32'b0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clock = ~clock;
end


initial begin
    #60;
    in_a = 32'd3827;
    in_b = 32'd9273;
    #50;
    in_a = 32'd3827;
    in_b = 32'd9273;
    #50;    
    in_a = 32'd0;
    in_b = 32'd9253;
    #50;    
    in_a = 32'd1;
    in_b = 32'd0;
    #50;    
    in_a = 32'd200;
    in_b = 32'd100;
    #50;
    // reset = 1;
    // #50;
    // reset = 0;
    #50;    
    in_a = 32'd0;
    in_b = 32'd9273;
    #50;    
    in_a = 32'd0;
    in_b = 32'd0;
    #50;    
    in_a = 32'd13442;
    in_b = 32'd10042;
    #50;
    in_a = 32'hfffffff;
    in_b = 32'hffffffef;
    #80;
    // reset = 1;
    // #50;
    // reset = 0;
    #50;    
    in_a = 32'd0;
    in_b = 32'd9273;
    #50;    
    in_a = 32'd0;
    in_b = 32'd0;
    #50;    
    in_a = 32'd13442;
    in_b = 32'd10042;
    #50;
    in_a = 32'hfffffff1;
    in_b = 32'h0fffffef;
    #50;
    in_a = 32'hfffffff1;
    in_b = 32'h0fffffef;
    #60;
    in_a = 32'hfffffff1;
    in_b = 32'h0fffffef;
    #60;
    in_a = 32'hefff0001;
    in_b = 32'h0fff0000;
    #60;
    in_a = 32'hffff1000;
    in_b = 32'hfffff000;
    #60;
    in_a = 32'hffff0000;
    in_b = 32'hffff0000;
    #60;
    in_a = 32'hfffffff1;
    in_b = 32'hffffafef;
    #60;
    in_a = 32'hffffeeee;
    in_b = 32'hffff1111;
    #60;
    in_a = 32'hffff3841;
    in_b = 32'hffffb3ae;
    // reset = 1;
    #400;
    $finish();
end

endmodule
