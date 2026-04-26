`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2026 15:36:24
// Design Name: 
// Module Name: csa
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


module csa (
    input  [15:0] A, B, C,
    output [15:0] Sum,
    output [15:0] Carry
);
    assign Sum   = A ^ B ^ C;
    assign Carry = (A & B) | (B & C) | (A & C);
endmodule