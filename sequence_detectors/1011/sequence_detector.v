// sequence detector for 1011 (no overlapping) FSM

module sequence_detector (
    input data_in,
    input clk,
    input rst,
    output reg data_out
);

    reg [1:0] state;
    parameter S0 = 00;
    parameter S1 = 01;
    parameter S2 = 10;
    parameter S3 = 11;


    always @(posedge clk) begin
        if (rst) begin
            state <= S0;
        end
        else begin
            case (state)
            S0 : begin
                if (data_in) begin
                    state <= S1;
                end
            end

            S1 : begin
                if (!data_in) begin
                    state <= S2;
                end
                else
                    state <= S1;
            end

            S2 : begin
                if (data_in) begin
                    state <= S3;
                end
                else
                    state <= S1;
            end

            S3 : begin
                if (data_in) begin
                    state <= S0;
                    data_out <= 1;
                end
            end


                default: begin
                    data_out <= 0;
                    state <= S0;
                end
            endcase
            
        end      
    end
    
endmodule