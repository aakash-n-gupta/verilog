// add reset condition - all 28 segments become off 
//  this implies all cathodes go to high state, (active low logic)
// no need for messing with the 


module cathode_decoder (
    input hex[3:0],
    input rst,
    output cathode[6:0]
);

    always @(*) 
        begin
            if(rst)
                cathode = 7'b1111_111;
            else
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
        end
    
endmodule