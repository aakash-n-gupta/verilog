`include "halfAdder.v"

module halfAdder_tb (
    
);
    reg r_BIT1 = 0;
    reg r_BIT2 = 0;
    wire w_SUM;
    wire w_CARRY;

// just 4 inputs so verbose parameters nout used
    halfAdder HA_test(
        r_BIT1,
        r_BIT2,
        w_SUM,
        w_CARRY

    );
    initial 
        begin

            $dumpfile("test.vcd");
            $dumpvars(2, HA_test);



            r_BIT1 = 0;
            r_BIT2 = 0;
            #10;

            r_BIT1 = 1;
            r_BIT2 = 0;
            #10;

            r_BIT1 = 0;
            r_BIT2 = 1;
            #10;

            r_BIT1 = 1;
            r_BIT1 = 1;
            #20;


      
        end
    
endmodule