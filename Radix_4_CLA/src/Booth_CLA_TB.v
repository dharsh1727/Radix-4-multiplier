`timescale 1ns / 1ps

module Booth_CLA_TB();
reg signed [7:0] X, Y;   // âœ… FIXED
wire [15:0] Product;
wire Overflow;
Booth_CLA_Top UUT (
    .X(X),
    .Y(Y),
    .Product(Product),
    .Overflow(Overflow)
);
initial begin
    X = 8'd5; Y = 8'd3; #10;
    X = -8'd5; Y = 8'd8; #10;
    X = -8'd15; Y = -8'd26; #10;
    X = 8'd127; Y = 8'd127; #10;
    X = -8'd128; Y = -8'd118; #10;
    X = -8'd128; Y = 8'd127; #10;
    $finish;
end

endmodule
