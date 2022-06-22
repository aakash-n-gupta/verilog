`timescale 1ns/1ns


module adder_subtractor_8_tb(
    
);

    reg [7:0] r_x, r_y;
    reg r_cin, r_sel;

    wire [7:0] w_result;
    wire w_cout, w_overflow;

    // instanting DUT
    adder_subtractor_8 test1 (r_x, r_y, r_cin, r_sel, w_result, w_cout, w_overflow);

    initial begin
        
        $monitor(r_x, r_y, r_cin, w_result, w_cout);
        $dumpfile("adder_subtractor_8_tb.vcd");
        $dumpvars(0, adder_subtractor_8_tb);

        #5;
        // testing adder in stage 1
        r_sel = 1'b0;
        // #10;

        r_x <= 8'd00;
        r_y <= 8'd00;
        r_cin <= 1'b0;

        #5;
        r_x <= 8'd00;
        r_y <= 8'd00;
        r_cin <= 1'b1;

        #5;
        r_x <= 8'd255;
        r_y <= 8'd255;
        r_cin <= 1'b1;

        #5;        
        r_x <= 8'd01;
        r_y <= 8'd255;
        r_cin <= 1'b0;

        #5;        
        r_x <= 8'd255;
        r_y <= 8'd0;
        r_cin <= 1'b1;

        #5;        
        r_x <= 8'd100;
        r_y <= 8'd50;
        r_cin <= 1'b0;


        #5;        
        r_x <= 8'd100;
        r_y <= 8'd50;
        r_cin <= 1'b1;
        
        
        #5;
        r_x <= 8'd200;
        r_y <= 8'd100;
        r_cin <= 1'b0;

        #5;
        r_x <= 8'd200;
        r_y <= 8'd100;
        r_cin <= 1'b1;

        // testing the subtractor
        #15;
        r_sel <= 1'b1;
       
        r_x <= 8'd00;
        r_y <= 8'd00;
        r_cin <= 1'b0;
        #5;

        r_x <= 8'd01;
        r_y <= 8'd00;
        r_cin <= 1'b1;

        #5;
        r_x <= 8'd00;
        r_y <= 8'd01;
        r_cin <= 1'b0;

        #5;        
        r_x <= 8'd200;
        r_y <= 8'd00;
        r_cin <= 1'b0;

        #5;        
        r_x <= 8'd100;
        r_y <= 8'd01;
        r_cin <= 1'b0;

        #5;        
        r_x <= 8'd255;
        r_y <= 8'd255;
        r_cin <= 1'b0;


        #5;        
        r_x <= 8'd100;
        r_y <= 8'd50;
        r_cin <= 1'b1;
        
        
        #5;
        r_x <= 8'd00;
        r_y <= 8'd01;
        r_cin <= 1'b0;
        
        #5;
        r_x <= 8'd100;
        r_y <= 8'd200;
        r_cin <= 1'b1; 
        
        #5;
        r_x <= 8'd100;
        r_y <= 8'd200;
        r_cin <= 1'b0;


    end
    
endmodule
