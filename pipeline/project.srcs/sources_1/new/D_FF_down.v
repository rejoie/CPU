`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 18:56:05
// Design Name: 
// Module Name: D_FF_down
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


module D_FF_down(D,Clk,Q,Qn);
input D,Clk;
output Q,Qn;
wire Clkn,Q0,Qn0;
not i0(Clkn,Clk);
D_Latch d0(D,Clk,Q0,Qn0);
D_Latch d1(Q0,Clkn,Q,Qn);
endmodule
