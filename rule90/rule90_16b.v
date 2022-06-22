// pause and play simulation at any time
//load state allows initial condition of LEDs to be set
// => load, rst, pause&play toggle
// data is taken from the input switches
// to use load using a push button, 
// rst and start_stop is mapped to the push buttons


module rule90_16b(
    input clk,
    input load,
    input start_stop,
    input rst,
    input [15:0] data,
    output [15:0] q ); 

    integer i;
    
    always@(posedge clk)
        begin
            case ({load, rst, start_stop})

            3'b000: begin
                for(integer i = 1; i < 15; i = i + 1)
            end 
                default: 
            endcase     
        end

endmodule