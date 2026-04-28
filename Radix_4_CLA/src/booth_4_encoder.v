module booth_4 ( 
    input  signed [7:0] X, 
    output reg [11:0] op 
); 

    integer i; 
    reg [9:0] X_ext;  

    always @(*) begin 
        op = 12'b0;  // avoid latches

        // Sign extension + appended 0 (x[-1])
        X_ext = {X[7], X, 1'b0}; 

        for (i = 0; i < 4; i = i + 1) begin 
            case (X_ext[2*i +: 3]) 
                3'b000, 3'b111: op[3*i +: 3] = 3'b000; // 0 
                3'b001, 3'b010: op[3*i +: 3] = 3'b001; // +1 
                3'b011:         op[3*i +: 3] = 3'b010; // +2 
                3'b100:         op[3*i +: 3] = 3'b110; // -2 
                3'b101, 3'b110: op[3*i +: 3] = 3'b111; // -1 
                default:        op[3*i +: 3] = 3'b000; 
            endcase 
        end 
    end 

endmodule
