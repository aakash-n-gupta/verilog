//~ `New testbench
`timescale  1ns / 1ps

module tb_pulse_generator;

// pulse_generator Parameters
// parameter PERIOD  = 10;


// pulse_generator Inputs
reg   clk                                  = 0 ;
reg   rst                                  = 0 ;
reg   [7:0]  pulse_width                   = 12 ;
reg   [7:0]  high_width                    = 5;

// pulse_generator Outputs
wire  pulse                                ;


initial
begin
    forever #(5)  clk=~clk;
end

pulse_generator  u_pulse_generator (
    .clk                     ( clk                ),
    .rst                     ( rst                ),
    .pulse_width             ( pulse_width  [7:0] ),
    .high_width              ( high_width   [7:0] ),

    .pulse                   ( pulse              )
);

initial
begin
    #5;
    rst = 1;
    #5
    rst = 0;


    $monitor(clk, rst, pulse_width, high_width);
    $dumpfile("pulse.vcd");
    $dumpvars(0, tb_pulse_generator);
    #1000;

    $finish;
end

endmodule