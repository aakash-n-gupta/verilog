module pulse_generator(
    input clk,
    input rst,
    input [7:0]pulse_width,
    input [7:0]high_width,
    output reg pulse
);

    reg [7:0] counter;


    always @(posedge clk) begin
        if(rst)
        begin
            pulse <= 0;
            counter <= 0;
        end
        else
        begin
            counter <= counter + 1;

            if(counter >= high_width)
            begin
                pulse <= 0;
            end
            else
            begin
                pulse <= 1;
            end

            if (counter == pulse_width - 1)
            begin
                counter <= 0;
            end
        end
        
    end
endmodule