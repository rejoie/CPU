`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/04 18:05:15
// Design Name: 
// Module Name: Br_Jump_addr
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


module Br_Jump_addr(I,currentAddress_4,Br_addr,jump);
    input [31:0] I,currentAddress_4;
    output [31:0] Br_addr,jump;
    wire Cout;
    wire [31:0] signExt_imm16;
    EXT16T32 imm(I[15:0],1'b1,signExt_imm16);
    CLA_32 add1(currentAddress_4,signExt_imm16<<2,1'b0,Br_addr,Cout);
    assign jump={currentAddress_4[31:28],I[25:0]<<2};
endmodule
