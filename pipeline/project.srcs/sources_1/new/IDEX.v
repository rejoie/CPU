`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 16:16:43
// Design Name: 
// Module Name: IDEX
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

module IDEX(Wreg,Reg2reg,Wmem,Op,Aluc,Aluqa,Aluqb,FwdA,FwdB,Qa,Qb,Im_ext,Pc_b,Sa,Rd,Clk,En,Clrn,
E_Wreg,E_Reg2reg,E_Wmem,E_Op,E_Aluc,E_Aluqa,E_Aluqb,E_FwdA,E_FwdB,E_Qa,E_Qb,E_Im_ext,E_Pc_b,E_Sa,E_Rd);
input Wreg,Reg2reg,Wmem,Aluqa,Aluqb,Clk,En,Clrn;
input [5:0]Op;
input [4:0]Rd;
input [3:0]Aluc;
input [1:0]FwdA,FwdB;
input [31:0]Sa,Pc_b,Qa,Qb,Im_ext;
output E_Wreg,E_Reg2reg,E_Wmem,E_Aluqa,E_Aluqb;
output [5:0]E_Op;
output [4:0]E_Rd;
output [3:0]E_Aluc;
output [1:0]E_FwdA,E_FwdB;
output [31:0]E_Sa,E_Pc_b,E_Qa,E_Qb,E_Im_ext;
D_FFEC1 wreg(Wreg,Clk,En,Clrn,E_Wreg);
D_FFEC1 reg2reg(Reg2reg,Clk,En,Clrn,E_Reg2reg);
D_FFEC1 wmem(Wmem,Clk,En,Clrn,E_Wmem);
D_FFEC1 aluqa(Aluqa,Clk,En,Clrn,E_Aluqa);
D_FFEC1 aluqb(Aluqb,Clk,En,Clrn,E_Aluqb);
D_FFEC2 fwda(FwdA,Clk,En,Clrn,E_FwdA);
D_FFEC2 fwdb(FwdB,Clk,En,Clrn,E_FwdB);
D_FFEC4 aluc(Aluc,Clk,En,Clrn,E_Aluc);
D_FFEC5 rd(Rd,Clk,En,Clrn,E_Rd);
D_FFEC6 op(Op,Clk,En,Clrn,E_Op);
D_FFEC32 sa(Sa,Clk,En,Clrn,E_Sa);
D_FFEC32 pc_b(Pc_b,Clk,En,Clrn,E_Pc_b);
D_FFEC32 qa(Qa,Clk,En,Clrn,E_Qa);
D_FFEC32 qb(Qb,Clk,En,Clrn,E_Qb);
D_FFEC32 im_ext(Im_ext,Clk,En,Clrn,E_Im_ext);
endmodule
