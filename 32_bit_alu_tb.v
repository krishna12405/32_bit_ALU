`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2026 11:46:16 AM
// Design Name: 
// Module Name: tb_alu_32bit
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



module tb_alu_32bit;

reg [31:0] A;
reg [31:0] B;
reg [3:0] ALU_Sel;

wire [31:0] ALU_Out;
wire CarryOut;
wire Overflow;
wire Zero;

alu_32bit DUT (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .CarryOut(CarryOut),
    .Overflow(Overflow),
    .Zero(Zero)
);

initial begin
    // Addition
    A = 32'h80000000;
    B = 32'h80000000;
    ALU_Sel = 4'b0000;
    #10;
    // Subtraction
    A = 20;
    B = 32'h80000000;
    ALU_Sel = 4'b0001;
    #10;
    // AND
    A = 32'hF0F0;
    B = 32'h0FF0;
    ALU_Sel = 4'b0010;
    #10;
    // OR
    ALU_Sel = 4'b0011;
    #10;
    // XOR
    ALU_Sel = 4'b0100;
    #10;
    // NOT
    A = 32'h0000FFFF;
    ALU_Sel = 4'b0101;
    #10;
    // Shift Left
    A = 32'd8;
    ALU_Sel = 4'b0110;
    #10;
    // Shift Right
    A = 32'd16;
    ALU_Sel = 4'b0111;
    #10;
    // Compare Equal
    A = 100;
    B = 100;
    ALU_Sel = 4'b1000;
    #10;
    // Compare Not Equal
    A = 100;
    B = 50;
    ALU_Sel = 4'b1000;
    #10;

    $finish;
end
endmodule
