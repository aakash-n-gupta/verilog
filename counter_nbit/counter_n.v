// parameter defines the width of the counter
// MAX defines the mod reset value of the counter

module counter_n #(parameter WIDTH = 8, MAX = 200) 
(
    input clk,
    input rst,
    output reg[WIDTH-1:0] counter_val
);

    always @(posedge clk) 
    begin

        if(rst)
            counter_val <= 0;
        else
        begin
            if(counter_val > MAX - 2)
                counter_val <= 0;
            else
                counter_val <= counter_val + 1;
        end
    end
    
endmodule