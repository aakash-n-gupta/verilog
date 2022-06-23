`timescale  1ns / 10ps

module tb_adderBuf;

reg clock;
reg reset;
reg[15:0] in_a;
reg[15:0] in_b;

wire [16:0] out_sum;

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
    in_a = 16'b0;
    in_b = 16'b0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clock = ~clock;

    // #1000;
    // $finish();
end

initial begin
    #20;
    #(PERIOD);
    in_a = 16'd199;
    in_b = 16'd1;    
    
    #(PERIOD);
    in_a = 16'd199;
    in_b = 16'd100;

    #(PERIOD);
    in_a = 16'd1990;
    in_b = 16'd183;
    #(PERIOD);
    #(PERIOD);
    #(PERIOD);
    $finish();

end


endmodule
