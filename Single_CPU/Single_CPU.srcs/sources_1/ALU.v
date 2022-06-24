`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 14:58:28
// Design Name: 
// Module Name: ALU
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


module ALU(X,Y,Aluc,R,Z);
    input [31:0] X,Y;
    input [2:0] Aluc;
    output [31:0] R;
    output Z;
    wire [31:0] d_as,d_and,d_or,d_and_or;
    wire Cout;
    ADDSUB_32 as32(X,Y,Aluc[0],d_as,Cout);
    assign d_and=X&Y;
    assign d_or=X|Y;
    MUX2_1 select1(d_and,d_or,Aluc[0],d_and_or);
    MUX2_1 select2(d_as,d_and_or,Aluc[1],R);
    assign Z=~|R;
endmodule
