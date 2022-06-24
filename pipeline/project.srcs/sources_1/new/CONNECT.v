`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 15:09:38
// Design Name: 
// Module Name: CONNECT
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


module CONNECT(X,Y,S);
input [31:0]X;
input [25:0]Y;
output [31:0]S;
assign S[0]=1'b0;
assign S[1]=1'b0;
assign S[2]=Y[0];
assign S[3]=Y[1];
assign S[4]=Y[2];
assign S[5]=Y[3];
assign S[6]=Y[4];
assign S[7]=Y[5];
assign S[8]=Y[6];
assign S[9]=Y[7];
assign S[10]=Y[8];
assign S[11]=Y[9];
assign S[12]=Y[10];
assign S[13]=Y[11];
assign S[14]=Y[12];
assign S[15]=Y[13];
assign S[16]=Y[14];
assign S[17]=Y[15];
assign S[18]=Y[16];
assign S[19]=Y[17];
assign S[20]=Y[18];
assign S[21]=Y[19];
assign S[22]=Y[20];
assign S[23]=Y[21];
assign S[24]=Y[22];
assign S[25]=Y[23];
assign S[26]=Y[24];
assign S[27]=Y[25];
assign S[28]=X[28];
assign S[29]=X[29];
assign S[30]=X[30];
assign S[31]=X[31];
endmodule
