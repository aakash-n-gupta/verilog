// 7 segment display controller for the 4 LED displays of the basys3
// cant decide on clock, this module expects a divided clock of 
// set it as a 16 bit counter?? - takes 16bit value and displays that on the 7 seg

module seven_seg_controller (
    input clk,
    input hex_in[3:0]
    input rst,
    input led_select[1:0],

    output seg[6:0],
    output an[3:0]
);
    parameter LED3 = 2'b11;
    parameter LED2 = 2'b10;
    parameter LED1 = 2'b01;
    parameter LED0 = 2'b00;

    reg [15:0] counter = 0;
    
    always @(posedge clk) 
    begin
        // async reset
        if(rst)
            begin
                seg[6:0] <= 7'b1111_111; // all LEDs will be turned off
                an[3:0] <= 4'b0000;
            end

        else
        begin
            case (seg_select)
            // anode active low??
                LED3 : an[3:0] = 4'b0111;
                LED2 : an[3:0] = 4'b1011;
                LED1 : an[3:0] = 4'b1101;
                LED0 : an[3:0] = 4'b1110;
                default: an[3:0] = 4'b1111;
    endcase
        end
        
    end


    
endmodule

module cathode_decoder (
    input hex[3:0],
    output cathode[6:0]
);

    always @(*) 
        begin
            case (hex)
                4'b0000 : cathode = 7'b0000_001;
                4'b0001 : cathode = 7'b1001_111;
                4'b0010 : cathode = 7'b0010_010;
                4'b0011 : cathode = 7'b0000_110;

                4'b0100 : cathode = 7'b1001_100;
                4'b0101 : cathode = 7'b0100_010;
                4'b0110 : cathode = 7'b0100_000;
                4'b0111 : cathode = 7'b0001_111;

                4'b1000 : cathode = 7'b0;
                4'b1001 : cathode = 7'b100;
                4'b1010 : cathode = 7'b10;
                4'b1011 : cathode = 7'b0101_011;

                4'b1100 : cathode = 7'b0101_001;
                4'b1101 : cathode = 7'b1000_010;
                4'b1110 : cathode = 7'b0010_000;
                4'b1111 : cathode = 7'b0111_000;
            endcase
            // default case not needed as all 16 cases are used
        
        end
    
endmodule

// module led_select (
//     input select[1:0],
//     output anode[3:0];
// );
    
// endmodule