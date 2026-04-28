`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2026 15:55:30
// Design Name: 
// Module Name: multiplier_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// tb_booth_multiplier.v
module tb_multiplier_top;

    reg signed [7:0] X, Y;
    wire signed [15:0] Product;

    multiplier_top dut (.X(X), .Y(Y), .Product(Product));

    initial begin
        X = -8'd128; Y = 8'd76; #20;  // Should be -7752 (E1B8)
        X = -8'd45; Y = 8'd12;  #20;
        X = -8'd50; Y = -8'd5;  #20;
        X = 8'd127; Y = 8'd127; #20;

        $finish;
    end

endmodule

