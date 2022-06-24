`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 17:44:15
// Design Name: 
// Module Name: EXMEM
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


module EXMEM(Wreg,Reg2reg,Wmem,Qb_fwd,R,Rd,Clk,En,Clrn,M_Wreg,M_Reg2reg,M_Wmem,M_Qb_fwd,M_R,M_Rd);
input Wreg,Reg2reg,Wmem,Clk,En,Clrn;
input [4:0]Rd;
input [31:0]R,Qb_fwd;
output M_Wreg,M_Reg2reg,M_Wmem;
output [4:0]M_Rd;
output [31:0]M_R,M_Qb_fwd;
D_FFEC1 wreg(Wreg,Clk,En,Clrn,M_Wreg);
D_FFEC1 reg2reg(Reg2reg,Clk,En,Clrn,M_Reg2reg);
D_FFEC1 wmem(Wmem,Clk,En,Clrn,M_Wmem);
D_FFEC5 rd(Rd,Clk,En,Clrn,M_Rd);
D_FFEC32 r(R,Clk,En,Clrn,M_R);
D_FFEC32 qb_fwd(Qb_fwd,Clk,En,Clrn,M_Qb_fwd);
endmodule
