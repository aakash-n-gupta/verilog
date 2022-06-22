// active low rst d flip flop

module d_ff (
    input clk,
    input d,
    input rst_async,
    output q
);

    always @(posedge clk) 
    begin
        if(rst)
            q <= d;
        else
            q <= 0;
        
    end
    
endmodule