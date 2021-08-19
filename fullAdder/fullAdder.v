// this full adder is made directly, without calling 2 HAs

module fullAdder (
    input x0,
    input x1,
    input cin,
    output sum,
    output cout


);
    // what will happen during timing analysis??
    // assign sum = x0 ^ x1 ^ cin;     // single level logic
    assign {cout, sum} = x0 + x1 + cin;      // 2 level logic

endmodule