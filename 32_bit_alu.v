`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2026 11:44:52 AM
// Design Name: 
// Module Name: alu_32bit
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


module alu_32bit (
    input  [31:0] A,
    input  [31:0] B,
    input  [3:0] ALU_Sel,
    output reg [31:0] ALU_Out,
    output reg CarryOut,
    output reg Overflow,
    output reg Zero
);

always @(*)
 begin
    CarryOut = 0;
    
    case(ALU_Sel)
        4'b0000: begin
            {CarryOut, ALU_Out} = A + B;   // Addition
        end
        4'b0001: begin
            {CarryOut, ALU_Out} = A - B;   // Subtraction
        end
        4'b0010: ALU_Out = A & B;               // AND

        4'b0011: ALU_Out = A | B;               // OR

        4'b0100: ALU_Out = A ^ B;               // XOR

        4'b0101: ALU_Out = ~A;                  // NOT

        4'b0110: ALU_Out = A << 1;              // Shift Left

        4'b0111: ALU_Out = A >> 1;              // Shift Right

        4'b1000: begin
            ALU_Out = (A == B) ? 32'd1 : 32'd0; // Compare equal or not
        end

        default: begin
            ALU_Out = 32'd0;
        end

    endcase
Overflow = CarryOut;
    if(ALU_Out == 0)
        Zero = 1;
    else
        Zero = 0;
   
end

endmodule

