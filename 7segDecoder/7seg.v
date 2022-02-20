// 7 segment display controller for the 4 LED displays of the basys3
// cant decide on clock, this module expects a divided clock of 
// set it as a 16 bit counter?? - takes 16bit value and displays that on the 7 seg

module seven_seg_controller (
    input clk,
    input rst,
    input hex_in[3:0],
    // input led_select[1:0], commented out for initial testing

    output seg[6:0],
    output an[3:0]
);
    reg [16:0] counter;
    cathode_decoder decoder_inst1(hex_in[3:0], seg[6:0]);
    
    // always @(posedge clk_100hz) 
    // begin
    //     if(rst)
    //         counter <= 0;
    //     else
    //         counter
        
    // end    
endmodule

    // parameter LED3 = 2'b11;
    // parameter LED2 = 2'b10;
    // parameter LED1 = 2'b01;
    // parameter LED0 = 2'b00;


    //     if(rst)
    //         begin
    //             seg[6:0] <= 7'b1111111; // all LEDs will be turned off
    //             an[3:0] <= 4'b1111;
    //         end

    //     else
    //     begin
    //         case (seg_select[1:0])
    //             LED3 : an[3:0] = 4'b0111;
    //             LED2 : an[3:0] = 4'b1011;
    //             LED1 : an[3:0] = 4'b1101;
    //             LED0 : an[3:0] = 4'b1110;
    //             default: an[3:0] = 4'b1111;
    // endcase
    //     end
        