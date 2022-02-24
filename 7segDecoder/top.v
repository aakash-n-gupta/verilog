// how do i drive the 7 segment??
// the controller seems ready, need to produce desired inputs for it
// in the first iteration, make it a counter

module top (
    input clk,
    input rst,
    // input hex[3:0],

    output seg[6:0],
    output an[3:0]
);
    // wire clk_400hz;
    wire clk_100hz;
    reg [3:0] counter;
    
    clk_divider#(.DIVIDER_VALUE(499999)) clk_100hz_inst(clk, clk_100hz);

    always @(posedge clk_100hz ) 
    begin
        counter <= counter + 1;
                
    end
    seven_seg_controller ctrl1(clk_100hz, rst, counter, seg, an);
    
endmodule