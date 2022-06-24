`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 18:15:15
// Design Name: 
// Module Name: MEMWB
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


module MEMWB(Wreg,Reg2reg,R,Dout,Rd,Clk,En,Clrn,W_Wreg,W_Reg2reg,W_R,W_Dout,W_Rd);
input Wreg,Reg2reg,Clk,En,Clrn;
input [4:0]Rd;
input [31:0]R,Dout;
output W_Wreg,W_Reg2reg;
output [4:0]W_Rd;
output [31:0]W_R,W_Dout;
D_FFEC1 wreg(Wreg,Clk,En,Clrn,W_Wreg);
D_FFEC1 reg2reg(Reg2reg,Clk,En,Clrn,W_Reg2reg);
D_FFEC5 rd(Rd,Clk,En,Clrn,W_Rd);
D_FFEC32 r(R,Clk,En,Clrn,W_R);
D_FFEC32 dout(Dout,Clk,En,Clrn,W_Dout);
endmodule
