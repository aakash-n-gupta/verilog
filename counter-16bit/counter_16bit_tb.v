`timescale 1ns/1ns

module counter_16bit_tb (
    
);
    reg r_clk = 0;
    reg r_rst_async = 1;
    wire [15:0] w_count ;
    integer i;

    // instanciating DUT
    counter_16bit counter_1 (r_clk, r_rst_async, w_count[15:0]);

    always begin
        r_clk = ~r_clk;
        #5;
    end

    initial 
        begin

            $monitor(r_clk, w_count[15:0]);
            $dumpfile("counter_16bit.vcd");
            $dumpvars(0, counter_16bit_tb);
        
            #500000;
            r_rst_async = 0;
            #12;
            r_rst_async = 1;
            #100000;





        end

        // $finish();
        // $stop();
endmodule