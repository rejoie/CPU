`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 16:08:08
// Design Name: 
// Module Name: IFID
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
//module D_FFEC32(D,Clk,En,Clrn,Q,Qn);

module IFID(pcplus4,inst,Clk,En,Clrn,Pcplus4,Inst);
input Clk,En,Clrn;
input [31:0]pcplus4,inst;
output [31:0]Pcplus4,Inst;
wire [31:0]Pcplus4_n,Inst_n;
D_FFEC32 d0(pcplus4,Clk,En,Clrn,Pcplus4,Pcplus4_n);
D_FFEC32 d1(inst,Clk,En,Clrn,Inst,Inst_n);
endmodule
