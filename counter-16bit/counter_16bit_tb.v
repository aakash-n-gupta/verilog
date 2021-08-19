`timescale 1ns/1ns

module counter_16bit_tb (
    
);
    reg r_clk, r_rst_async;
    wire [15:0] w_count ;
    integer i;

    // instanciating DUT
    counter_16bit counter_1 (r_clk, r_rst_async, w_count[15:0]);

    initial begin
        r_clk = 1'b0;
        r_rst_async = 1'b0;
        #2;
        r_rst_async = 1'b1;
        w_count = 16'hfff0;
    end 
        
    // #10;

    // always begin
    //     r_clk = ~r_clk;
    //     #5;
    // end

    initial 
        begin
            $monitor(r_clk, w_count[15:0]);
            $dumpfile("counter_16bit.vcd");
            $dumpvars(0, counter_16bit_tb);

            // #2;
            for (i = 0; i < 1025 ; i = i + 1) begin

                r_clk <= ~r_clk;
                #1;
            end

            // r_rst_async = 1'b0;
            // for (i = 0; i < 4000 ; i = i + 1) begin

            //     r_clk <= ~r_clk;
            //     #1;
            // end
        
        end
endmodule