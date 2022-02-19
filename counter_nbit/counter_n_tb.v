//~ `New testbench
`timescale  1ns / 1ps

module tb_counter_n;

// counter_n Parameters
parameter PERIOD  = 10;
parameter WIDTH = 16;


// counter_n Inputs
reg   r_clk = 0 ;
reg   r_rst = 0 ;

// counter_n Outputs
wire  [WIDTH-1:0]  w_counter_val = 0;   


initial
begin
    forever #(PERIOD/2)  r_clk =~ r_clk;
end

// initial
// begin
//     #(PERIOD*2) rst_n  =  1;
// end

counter_n  #(.WIDTH(16), .MAX(5000)) ut_counter_n (.clk(r_clk), .rst(r_rst), .counter_val( w_counter_val[WIDTH-1:0] ));

// counter_n counter_inst_tb (.clk(r_clk), .rst(r_rst), .counter_val(w_counter_val));

initial
begin
    $monitor(r_clk, r_rst);
    $dumpfile("counter_n_test2.vcd");
    $dumpvars(0, tb_counter_n);
    r_rst = 0;
    // w_counter_val = 0;
    #100
    r_rst = 1;
    #100
    r_rst = 0;
    #20100
    $finish;
end

endmodule