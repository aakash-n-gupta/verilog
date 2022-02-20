`timescale 1ns / 1ps

// counter based clock divider
// Principle formula - Fout = 2*(counter_value + 1)/Fin(100Mhz in this case)


module clk_divider #(parameter DIVIDER_VALUE = 9999999)
(   input clk,
    output reg divided_clk = 0
    );
    

    integer counter_value = 0;

    // this always block creates a counter
    always @(posedge clk ) begin
        if(counter_value == DIVIDER_VALUE)
        begin
            counter_value = 0; //reset at DIVIDER_VALUE
            divided_clk <= ~divided_clk;
        end
        else
        begin
            counter_value <= counter_value + 1;
            divided_clk <= divided_clk;

        end
    end

endmodule
