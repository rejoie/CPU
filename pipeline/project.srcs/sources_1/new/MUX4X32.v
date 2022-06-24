`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 19:53:47
// Design Name: 
// Module Name: MUX4X32
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


module MUX4X32(A,B,C,D,S,Y);
input [31:0]A,B,C,D;
input [1:0]S;
output [31:0]Y;
function [31:0]select;
input [31:0]A,B,C,D;
input [1:0]S;
case(S)
2'b00:select=A;
2'b01:select=B;
2'b10:select=C;
2'b11:select=D;
endcase
endfunction
assign Y=select(A,B,C,D,S);
endmodule
