module counter_16bit (
    input clk,
    input rst_async,
    output reg [15:0] count
);
    // wire [15:0] count_last;
    // assign counter = 0;

    // reg [15:0] count;

    always @(posedge clk) 
        begin
            // active low reset
            if (rst_async) 
            begin
                count[15:0] <= count + 1'b1;                
            end
            else
                count <= 1'b0;
        end

    // assign counter[15:0] = count[15:0];


endmodule


