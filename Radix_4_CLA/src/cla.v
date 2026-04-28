module CLA_16(
    input  [15:0] A,
    input  [15:0] B,
    output [15:0] Sum,
    output Cout
);

wire C1, C2, C3;

Carry_look_ahead_adder CLA0 (
    .A(A[3:0]),
    .B(B[3:0]),
    .Cin(1'b0),
    .Sum(Sum[3:0]),
    .Cout(C1)
);

Carry_look_ahead_adder CLA1 (
    .A(A[7:4]),
    .B(B[7:4]),
    .Cin(C1),
    .Sum(Sum[7:4]),
    .Cout(C2)
);

Carry_look_ahead_adder CLA2 (
    .A(A[11:8]),
    .B(B[11:8]),
    .Cin(C2),
    .Sum(Sum[11:8]),
    .Cout(C3)
);

Carry_look_ahead_adder CLA3 (
    .A(A[15:12]),
    .B(B[15:12]),
    .Cin(C3),
    .Sum(Sum[15:12]),
    .Cout(Cout)
);

endmodule
