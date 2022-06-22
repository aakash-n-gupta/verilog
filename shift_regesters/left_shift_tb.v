//~ `New testbench
`timescale  1ns / 1ps

module tb_leftShift_reg;

// leftShift_reg Parameters
parameter PERIOD  = 10;


// leftShift_reg Inputs
reg   r_clk                                  = 0 ;
reg   [WIDTH-1:0]  r_data                    = 0 ;
reg   r_reset                                = 0 ;
reg   r_load                                 = 0 ;
reg   r_shift_en                             = 0 ;

// leftShift_reg Outputs
wire  [WIDTH-1:0]  w_out;

initial
begin
    forever #(PERIOD/2)  r_clk = ~r_clk;
end

initial
// begin
//     #(PERIOD*2) rst_n  =  1;
// end

// leftShift_reg  u_leftShift_reg (.clk( clk),.data( data [WIDTH-1:0] ),.reset( reset),.load( load),.shift_en( shift_en),.out( out[WIDTH-1:0] ));

leftShift_reg #(.WIDTH(8)) u_leftShift_reg  (r_clk, r_data[WIDTH-1:0], r_reset, r_load, r_shift_en, w_out[WIDTH-1:0]);

initial
begin
    #PERIOD;
    r_reset = 0;
    r_load = 1;
    r_shift_en = 0;
    r_data = 8'b10101010;
    #PERIOD;

    // shift starts
    r_shift_en = 1;
    #(PERIOD * 10);

    // shifting stops
    r_shift_en = 0;
    #(PERIOD * 3);

    // load register again
    #PERIOD;
    r_reset = 0;
    r_load = 1;
    r_shift_en = 0;
    r_data = 8'b11001100;
    #PERIOD;


    // shift starts again
    r_shift_en = 1;
    #(PERIOD * 5);

    // assertign reset
    r_reset = 1;
    #(PERIOD * 10);

    
    
   
    $monitor(r_clk, r_data[WIDTH-1:0], r_reset, r_shift_en, r_load, w_out);
    $dumpfile("leftshift_tb.vcd");
    $dumpvars(0, tb_leftShift_reg);

    $finish;
end

endmodule