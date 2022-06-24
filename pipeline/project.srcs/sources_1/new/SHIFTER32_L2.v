`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 14:33:52
// Design Name: 
// Module Name: SHIFTER32_L2
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


module SHIFTER32_L2(X,Sh);
input [31:0]X;
output [31:0]Sh;
assign Sh[0]=1'b0;
assign Sh[1]=1'b0;
assign Sh[2]=X[0];
assign Sh[3]=X[1];
assign Sh[4]=X[2];
assign Sh[5]=X[3];
assign Sh[6]=X[4];
assign Sh[7]=X[5];
assign Sh[8]=X[6];
assign Sh[9]=X[7];
assign Sh[10]=X[8];
assign Sh[11]=X[9];
assign Sh[12]=X[10];
assign Sh[13]=X[11];
assign Sh[14]=X[12];
assign Sh[15]=X[13];
assign Sh[16]=X[14];
assign Sh[17]=X[15];
assign Sh[18]=X[16];
assign Sh[19]=X[17];
assign Sh[20]=X[18];
assign Sh[21]=X[19];
assign Sh[22]=X[20];
assign Sh[23]=X[21];
assign Sh[24]=X[22];
assign Sh[25]=X[23];
assign Sh[26]=X[24];
assign Sh[27]=X[25];
assign Sh[28]=X[26];
assign Sh[29]=X[27];
assign Sh[30]=X[28];
assign Sh[31]=X[29];
endmodule
