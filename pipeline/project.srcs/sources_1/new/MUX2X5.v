`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 18:34:04
// Design Name: 
// Module Name: MUX2X5
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


module MUX2X5(A,B,S,Y);
input [4:0]A,B;
input S;
output [4:0]Y;
function [4:0]select;
input [4:0]A,B;
input S;
case(S)
1'b0:select=A;
1'b1:select=B;
endcase
endfunction
assign Y=select(A,B,S);
endmodule
