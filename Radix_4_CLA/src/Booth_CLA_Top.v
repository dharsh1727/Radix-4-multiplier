`timescale 1ns / 1ps 
 

module Booth_CLA_Top ( 
    input  signed [7:0] X, 
    input  signed [7:0] Y, 
    output signed [15:0] Product,
    output  Overflow
); 
 
    wire [11:0] op; 
 
    wire signed [15:0] PP0, PP1, PP2, PP3; 
 
    wire [15:0] S1, C1; 
    wire [15:0] S2, C2; 
 
    // Booth Encoder 
    booth_4 BE (.X(X), .op(op)); 
 
    // Partial Products 
    ppg PPG ( .Y(Y), .op(op), .PP0(PP0), .PP1(PP1), .PP2(PP2),  .PP3(PP3) ); 
 
    // CSA Stage 1 
    csa CSA1 (.A(PP0), .B(PP1), .C(PP2), .Sum(S1), .Carry(C1)); 
 
    // CSA Stage 2 
    csa CSA2 (.A(S1), .B({C1[14:0],1'b0}), .C(PP3), .Sum(S2), .Carry(C2)); 
 
    // Final Adder
    CLA_16 CLA (.A(S2), .B({C2[14:0],1'b0}), .Sum(Product), .Cout(Overflow)); 
 
endmodule
