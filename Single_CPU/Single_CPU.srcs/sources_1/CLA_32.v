`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 23:24:40
// Design Name: 
// Module Name: CLA_32
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


module CLA_32(X,Y,Cin,S,Cout);
input [31:0] X,Y;
input Cin;
output [31:0] S;
output Cout;
wire [2:0] carry;

CLA_8 add0(X[7:0],Y[7:0],Cin,S[7:0],carry[0]);
CLA_8 add1(X[15:8],Y[15:8],carry[0],S[15:8],carry[1]);
CLA_8 add2(X[23:16],Y[23:16],carry[1],S[23:16],carry[2]);
CLA_8 add3(X[31:24],Y[31:24],carry[2],S[31:24],Cout);
endmodule
