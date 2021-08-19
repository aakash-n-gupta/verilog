module fullAdder_tb (
    
);
    reg r_BIT0 = 0;
    reg r_BIT1 = 0;
    reg r_CIN = 0;

    wire w_sum;
    wire w_cout;

    integer i;

    fullAdder FA_test(r_BIT0, r_BIT1, r_CIN, w_sum, w_cout);

    initial 
    begin

        $monitor(w_cout, w_sum);
        $dumpfile("fullAdder.vcd");
        $dumpvars(0, fullAdder_tb);

        for ( i = 0; i < 8 ; i = i+1) 
        begin

            // $display("current i value %d", i);
            {r_BIT0, r_BIT1, r_CIN}  = i;
            #5;
            
        end
        
    end

endmodule