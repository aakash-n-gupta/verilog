module leftShift_reg #(parameter WIDTH = 8)
(
    input clk, // main clk
    input [WIDTH-1:0] data, // load the register when load is high
    input reset, // reset register to default value
    input load, // drive high when register needs to be loaded
    input shift_en, // data shifts left when shift_en is high
    output reg [WIDTH-1:0] out // data out

);

    reg [WIDTH-1:0] ls_reg;

    always @(posedge clk) begin
        if(reset)
        begin
            ls_reg <= 0;
        end
        else
        begin
            case({load, shift_en})
                2'b00 : ls_reg <= ls_reg;
                2'b01 : {ls_reg[WIDTH-1],ls_reg[WIDTH-2:0]} <= {ls_reg[0], ls_reg[WIDTH-1:1]};
                2'b10 : ls_reg <= data;
                2'b11 : ls_reg <= ls_reg;
            endcase

        end
    end

    always @(*) begin
        out <= ls_reg;
        if (reset) begin
            out <= 0;
            
        end 
        
    end
    
endmodule