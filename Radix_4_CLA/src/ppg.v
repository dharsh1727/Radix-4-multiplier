module ppg ( 
    input  signed [7:0] Y, 
    input  [11:0] op, 
    output reg signed [15:0] PP0, 
    output reg signed [15:0] PP1, 
    output reg signed [15:0] PP2, 
    output reg signed [15:0] PP3 
); 

    reg signed [15:0] Y_ext; 
    reg signed [15:0] temp; 

    always @(*) begin 
        // Sign extend Y 
        Y_ext = {{8{Y[7]}}, Y}; 

        // Default values 
        PP0 = 0; 
        PP1 = 0; 
        PP2 = 0; 
        PP3 = 0; 

        // Group 0 
        case (op[2:0]) 
            3'b000: temp = 0; 
            3'b001: temp = Y_ext; 
            3'b010, 3'b011: temp = Y_ext << 1;  // âœ… FIXED
            3'b111: temp = -Y_ext; 
            3'b110: temp = -(Y_ext << 1); 
            default: temp = 0; 
        endcase 
        PP0 = temp; 

        // Group 1 
        case (op[5:3]) 
            3'b000: temp = 0; 
            3'b001: temp = Y_ext; 
            3'b010, 3'b011: temp = Y_ext << 1; 
            3'b111: temp = -Y_ext; 
            3'b110: temp = -(Y_ext << 1); 
            default: temp = 0; 
        endcase 
        PP1 = temp << 2; 

        // Group 2 
        case (op[8:6]) 
            3'b000: temp = 0; 
            3'b001: temp = Y_ext; 
            3'b010, 3'b011: temp = Y_ext << 1; 
            3'b111: temp = -Y_ext; 
            3'b110: temp = -(Y_ext << 1); 
            default: temp = 0; 
        endcase 
        PP2 = temp << 4; 

        // Group 3 
        case (op[11:9]) 
            3'b000: temp = 0; 
            3'b001: temp = Y_ext; 
            3'b010, 3'b011: temp = Y_ext << 1; 
            3'b111: temp = -Y_ext; 
            3'b110: temp = -(Y_ext << 1); 
            default: temp = 0; 
        endcase 
        PP3 = temp << 6; 

    end 

endmodule
