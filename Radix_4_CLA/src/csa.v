module csa ( 
    input  [15:0] A, B, C, 
    output [15:0] Sum, 
    output [15:0] Carry 
); 
    assign Sum   = A ^ B ^ C; 
    assign Carry = (A & B) | (B & C) | (A & C); 
endmodule 
