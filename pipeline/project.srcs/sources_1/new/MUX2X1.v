`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 15:04:04
// Design Name: 
// Module Name: MUX2X1
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


module MUX2X1(A,B,S,Y);
input A,B,S;
output Y;
wire A_S,B_S,S_n;
not i0(S_n,S);
and i1(A_S,A,S_n);
and i2(B_S,B,S);
or i3(Y,A_S,B_S);
endmodule
