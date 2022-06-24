`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 15:17:03
// Design Name: 
// Module Name: pipeline
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


module pipeline(Clk,Clrn,Iaddr,Inst,D_Iaddr,D_Inst,Q0_reg,Q1_reg,Q2_reg,Q3_reg,Q4_reg,Q5_reg,Q6_reg,Q7_reg,Q8_reg,Q9_reg,
Q10_reg,Q11_reg,Q12_reg,Q13_reg,Q14_reg,Q15_reg,Q16_reg,Q17_reg,Q18_reg,Q19_reg,Q20_reg,Q21_reg,Q22_reg,Q23_reg,Q24_reg,
Q25_reg,Q26_reg,Q27_reg,Q28_reg,Q29_reg,Q30_reg,Q31_reg,pcplus4,pc_b,pc_j,pc,D,Qa,Qb,im_ext,im_extsl,E_Pc_b,E_Sa,M_R,W_R,E_Qa_fwd,E_Qb_fwd,X,Y,E_Qa,E_Qb,E_Im_ext,
R,M_Qb_fwd,Dout,addr,im,op,func,E_Op,rs,rt,rd,sa,E_Rd,M_Rd,Wr,Aluc,E_Aluc,Pcsrc,FwdA,FwdB,E_FwdA,E_FwdB,Stall,Condep,Z,Regrt,Se,Wreg,Aluqa,Aluqb,Wmem,Reg2reg,E_Wreg,E_Reg2reg,E_Wmem,E_Aluqa,E_Aluqb,M_Wreg,M_Reg2reg,
M_Wmem,W_Wreg,W_Reg2reg,W_Rd,W_Dout);


input Clk,Clrn;
output [31:0]Iaddr,Inst,D_Iaddr,D_Inst,Q0_reg,Q1_reg,Q2_reg,Q3_reg,Q4_reg,Q5_reg,Q6_reg,Q7_reg,Q8_reg,Q9_reg,Q10_reg,Q11_reg,
Q12_reg,Q13_reg,Q14_reg,Q15_reg,Q16_reg,Q17_reg,Q18_reg,Q19_reg,Q20_reg,Q21_reg,Q22_reg,Q23_reg,Q24_reg,Q25_reg,
Q26_reg,Q27_reg,Q28_reg,Q29_reg,Q30_reg,Q31_reg,W_Dout;
output [31:0]pcplus4,pc_b,pc_j,pc,D,Qa,Qb,im_ext,im_extsl,E_Pc_b,E_Sa,M_R,W_R,E_Qa_fwd,E_Qb_fwd,X,Y,E_Qa,E_Qb,E_Im_ext,
R,M_Qb_fwd,Dout,sa;
output [25:0]addr;
output [15:0]im;
output [5:0]op,func,E_Op;
output [4:0]rs,rt,rd,E_Rd,M_Rd,Wr,W_Rd;
output [3:0]Aluc,E_Aluc;
output [1:0]Pcsrc,FwdA,FwdB,E_FwdA,E_FwdB;
output Stall,Condep,Z,Regrt,Se,Wreg,Aluqa,Aluqb,Wmem,Reg2reg,E_Wreg,E_Reg2reg,E_Wmem,E_Aluqa,E_Aluqb,M_Wreg,M_Reg2reg,
M_Wmem,W_Wreg,W_Reg2reg;


//IF
MUX4X32 mux0(pcplus4,,E_Pc_b,pc_j,Pcsrc,pc);
D_FFEC32 PC(pc,Clk,Stall,Clrn,Iaddr); //先清，等下如果有错可以注意这里
ADDSUB_32 addsub0(Iaddr,32'h4,0,pcplus4);
//module INSTMEM_pipeline(Addr,Inst);
INSTMEM_pipeline instmem(Iaddr,Inst);
//module IFID(pcplus4,inst,Clk,En,Clrn,Pcplus4,Inst);
IFID ifid(pcplus4,Inst,Clk,Stall,Clrn&Condep,D_Iaddr,D_Inst);


//ID
assign op=D_Inst[31:26];assign func=D_Inst[5:0];
assign rs=D_Inst[25:21];assign rt=D_Inst[20:16];
assign rd=D_Inst[15:11];assign sa={27'b0,D_Inst[10:6]};
assign im=D_Inst[15:0];assign addr=D_Inst[25:0];
/*module CONUNIT_pipeline(Op,Func,Z,Regrt,Se,Wreg,Aluqa,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg,E_Rd,M_Rd,E_Wreg,M_Wreg,Rs,Rt,FwdA,FwdB,
E_Reg2reg,Stall,Condep,E_Op);*/
CONUNIT_pipeline conunit_pipeline(op,func,Z,Regrt,Se,Wreg,Aluqa,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg,E_Rd,M_Rd,E_Wreg,M_Wreg,
rs,rt,FwdA,FwdB,E_Reg2reg,Stall,Condep,E_Op);
MUX2X5 mux2x5(rd,rt,Regrt,Wr);
//module REGFILE_down(Ra,Rb,D,Wr,We,Clk,Clrn,Qa,Qb);
REGFILE_down regfile_down(rs,rt,D,W_Rd,W_Wreg,Clk,Clrn,Qa,Qb,Q0_reg,Q1_reg,Q2_reg,Q3_reg,Q4_reg,Q5_reg,Q6_reg,Q7_reg,Q8_reg,
Q9_reg,Q10_reg,Q11_reg,Q12_reg,Q13_reg,Q14_reg,Q15_reg,Q16_reg,Q17_reg,Q18_reg,Q19_reg,Q20_reg,Q21_reg,Q22_reg,Q23_reg,
Q24_reg,Q25_reg,Q26_reg,Q27_reg,Q28_reg,Q29_reg,Q30_reg,Q31_reg);
EXT16T32 ext(im,Se,im_ext);
SHIFTER32_L2 shifter32_l2(im_ext,im_extsl);
ADDSUB_32 addsub2(D_Iaddr,im_extsl,0,pc_b);
CONNECT connect(D_Iaddr,addr,pc_j);
/*module IDEX(Wreg,Reg2reg,Wmem,Op,Aluc,Aluqa,Aluqb,FwdA,FwdB,Qa,Qb,Im_ext,Pc_b,Sa,Rd,Clk,En,Clrn,
E_Wreg,E_Reg2reg,E_Wmem,E_Op,E_Aluc,E_Aluqa,E_Aluqb,E_FwdA,E_FwdB,E_Qa,E_Qb,E_Im_ext,E_Pc_b,E_Sa,E_Rd);*/
IDEX idex(Wreg,Reg2reg,Wmem,op,Aluc,Aluqa,Aluqb,FwdA,FwdB,Qa,Qb,im_ext,pc_b,sa,Wr,Clk,1'b1,Clrn&Condep,
E_Wreg,E_Reg2reg,E_Wmem,E_Op,E_Aluc,E_Aluqa,E_Aluqb,E_FwdA,E_FwdB,E_Qa,E_Qb,E_Im_ext,E_Pc_b,E_Sa,E_Rd);


//EX
MUX4X32 mux1(E_Qa,D,M_R,,E_FwdA,E_Qa_fwd);
MUX4X32 mux2(E_Qb,D,M_R,,E_FwdB,E_Qb_fwd);
MUX2X32 mux3(E_Qa_fwd,E_Sa,E_Aluqa,X);
MUX2X32 mux4(E_Im_ext,E_Qb_fwd,E_Aluqb,Y);
//module ALU4(X,Y,Aluc,R,Z);
ALU4 alu(X,Y,E_Aluc,R,Z);
//module EXMEM(Wreg,Reg2reg,Wmem,Qb_fwd,R,Rd,Clk,En,Clrn,M_Wreg,M_Reg2reg,M_Wmem,M_Qb_fwd,M_R,M_Rd);
EXMEM exmem(E_Wreg,E_Reg2reg,E_Wmem,E_Qb_fwd,R,E_Rd,Clk,1'b1,Clrn,M_Wreg,M_Reg2reg,M_Wmem,M_Qb_fwd,M_R,M_Rd);
//module DATAMEM(Addr,Din,Clk,We,Dout);


//MEM
DATAMEM datamem(M_R,M_Qb_fwd,Clk,M_Wmem,Dout);
//module MEMWB(Wreg,Reg2reg,R,Dout,Rd,Clk,En,Clrn,W_Wreg,W_Reg2reg,W_R,W_Dout,W_Rd);
MEMWB memwb(M_Wreg,M_Reg2reg,M_R,Dout,M_Rd,Clk,1'b1,Clrn,W_Wreg,W_Reg2reg,W_R,W_Dout,W_Rd);


//WB
MUX2X32 mux5(W_Dout,W_R,W_Reg2reg,D);
endmodule
