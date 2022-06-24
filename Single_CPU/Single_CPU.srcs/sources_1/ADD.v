`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 18:21:41
// Design Name: 
// Module Name: ADD
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


module ADD(X,Y,Cin,S,Cout);
input X,Y,Cin;
output S,Cout;
assign S=X^Y^Cin;
//assign Cout=(X&Y)|(X&Cin)|(Y&Cin);
assign Cout=~((~(X&Y))&(~(X&Cin))&(~(Y&Cin)));
endmodule
