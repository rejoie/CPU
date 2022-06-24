`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 23:09:28
// Design Name: 
// Module Name: CLA_8
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


module CLA_8(X,Y,Cin,S,Cout);
input [7:0] X,Y;
input Cin;
output [7:0] S;
output Cout;
wire [6:0] carry;

ADD m0(X[0],Y[0],Cin,S[0],carry[0]);
ADD m1(X[1],Y[1],carry[0],S[1],carry[1]);
ADD m2(X[2],Y[2],carry[1],S[2],carry[2]);
ADD m3(X[3],Y[3],carry[2],S[3],carry[3]);
ADD m4(X[4],Y[4],carry[3],S[4],carry[4]);
ADD m5(X[5],Y[5],carry[4],S[5],carry[5]);
ADD m6(X[6],Y[6],carry[5],S[6],carry[6]);
ADD m7(X[7],Y[7],carry[6],S[7],Cout);
endmodule
