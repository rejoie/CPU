`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 16:39:35
// Design Name: 
// Module Name: D_FFEC1
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


module D_FFEC1(D,Clk,En,Clrn,Q,Qn);
input D,Clk,En,Clrn;
output Q,Qn;
D_FFEC d(D,Clk,En,Clrn,Q,Qn);
endmodule
