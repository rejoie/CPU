`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 15:10:54
// Design Name: 
// Module Name: D_FF
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


module D_FF(D,Clk,Q,Qn);
input D,Clk;
output Q,Qn;
wire Clkn,Q0,Qn0;
not i0(Clkn,Clk);
D_Latch d0(D,Clkn,Q0,Qn0);
D_Latch d1(Q0,Clk,Q,Qn);
endmodule
