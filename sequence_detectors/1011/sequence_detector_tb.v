`timescale 1ns/1ns
module sequence_detector_tb ();

reg r_clk;
reg r_rst;
reg r_data_in;
wire w_data_out;

reg state_parm;

integer i;

// instantiating DUT
sequence_detector test(r_data_in, r_clk, r_rst, w_data_out);


initial 
    begin
        // one clock cycle is 4 ns
        // pos cycle = neg cycle = 2ns
        r_clk = 0;
        forever 
        #2  r_clk = ~r_clk;
    end

    initial begin
        $monitor(r_clk, r_data_in, w_data_out, i);
        $dumpfile("sequence.vcd");
        $dumpvars(0, sequence_detector_tb);
        #400;
        $finish();
    end

always @(posedge r_clk) begin
    for (i = 0; i < 100 ; i = i+1) begin
        r_data_in = i;
    end
    
end
endmodule