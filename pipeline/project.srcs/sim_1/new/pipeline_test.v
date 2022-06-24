`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 20:32:12
// Design Name: 
// Module Name: pipeline_test
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


module pipeline_test;
reg Clk,Clrn;
wire [31:0]Iaddr,Inst,D_Iaddr,D_Inst,Q0_reg,Q1_reg,Q2_reg,Q3_reg,Q4_reg,Q5_reg,Q6_reg,Q7_reg,Q8_reg,Q9_reg,
Q10_reg,Q11_reg,Q12_reg,Q13_reg,Q14_reg,Q15_reg,Q16_reg,Q17_reg,Q18_reg,Q19_reg,Q20_reg,Q21_reg,Q22_reg,Q23_reg,Q24_reg,
Q25_reg,Q26_reg,Q27_reg,Q28_reg,Q29_reg,Q30_reg,Q31_reg;
wire [31:0]pcplus4,pc_b,pc_j,pc,D,Qa,Qb,im_ext,im_extsl,E_Pc_b,E_Sa,M_R,W_R,E_Qa_fwd,E_Qb_fwd,X,Y,E_Qa,E_Qb,E_Im_ext,
R,M_Qb_fwd,Dout,W_Dout,sa;
wire [25:0]addr;
wire [15:0]im;
wire [5:0]op,func,E_Op;
wire [4:0]rs,rt,rd,E_Rd,M_Rd,Wr,W_Rd;
wire [3:0]Aluc,E_Aluc;
wire [1:0]Pcsrc,FwdA,FwdB,E_FwdA,E_FwdB;
wire Stall,Condep,Z,Regrt,Se,Wreg,Aluqa,Aluqb,Wmem,Reg2reg,E_Wreg,E_Reg2reg,E_Wmem,E_Aluqa,E_Aluqb,M_Wreg,M_Reg2reg,
M_Wmem,W_Wreg,W_Reg2reg;

pipeline uut(.Clk(Clk),.Clrn(Clrn),.Iaddr(Iaddr),.Inst(Inst),.D_Iaddr(D_Iaddr),.D_Inst(D_Inst),.Q0_reg(Q0_reg),.Q1_reg(Q1_reg),.Q2_reg(Q2_reg),.Q3_reg(Q3_reg),.Q4_reg(Q4_reg),.Q5_reg(Q5_reg),.Q6_reg(Q6_reg),.Q7_reg(Q7_reg),.Q8_reg(Q8_reg),.Q9_reg(Q9_reg),.Q10_reg(Q10_reg),.Q11_reg(Q11_reg),.Q12_reg(Q12_reg),.Q13_reg(Q13_reg),.Q14_reg(Q14_reg),.Q15_reg(Q15_reg),.Q16_reg(Q16_reg),.Q17_reg(Q17_reg),.Q18_reg(Q18_reg),.Q19_reg(Q19_reg),.Q20_reg(Q20_reg),.Q21_reg(Q21_reg),.Q22_reg(Q22_reg),.Q23_reg(Q23_reg),.Q24_reg(Q24_reg),.Q25_reg(Q25_reg),.Q26_reg(Q26_reg),.Q27_reg(Q27_reg),.Q28_reg(Q28_reg),.Q29_reg(Q29_reg),.Q30_reg(Q30_reg),.Q31_reg(Q31_reg),.pcplus4(pcplus4),.pc_b(pc_b),.pc_j(pc_j),.pc(pc),.D(D),.Qa(Qa),.Qb(Qb),.im_ext(im_ext),.im_extsl(im_extsl),.E_Pc_b(E_Pc_b),.E_Sa(E_Sa),.M_R(M_R),.W_R(W_R),.E_Qa_fwd(E_Qa_fwd),.E_Qb_fwd(E_Qb_fwd),.X(X),.Y(Y),.E_Qa(E_Qa),.E_Qb(E_Qb),.E_Im_ext(E_Im_ext),.R(R),.M_Qb_fwd(M_Qb_fwd),.Dout(Dout),.addr(addr),.im(im),.op(op),.func(func),.E_Op(E_Op),.rs(rs),.rt(rt),.rd(rd),.sa(sa),.E_Rd(E_Rd),.M_Rd(M_Rd),.Wr(Wr),.Aluc(Aluc),.E_Aluc(E_Aluc),.Pcsrc(Pcsrc),.FwdA(FwdA),.FwdB(FwdB),.E_FwdA(E_FwdA),.E_FwdB(E_FwdB),.Stall(Stall),.Condep(Condep),.Z(Z),.Regrt(Regrt),.Se(Se),.Wreg(Wreg),.Aluqa(Aluqa),.Aluqb(Aluqb),.Wmem(Wmem),.Reg2reg(Reg2reg),.E_Wreg(E_Wreg),.E_Reg2reg(E_Reg2reg),.E_Wmem(E_Wmem),.E_Aluqa(E_Aluqa),.E_Aluqb(E_Aluqb),.M_Wreg(M_Wreg),.M_Reg2reg(M_Reg2reg),.M_Wmem(M_Wmem),.W_Wreg(W_Wreg),.W_Reg2reg(W_Reg2reg),.W_Rd(W_Rd),.W_Dout(W_Dout));
initial begin
Clk=0;Clrn=0;
#36
Clrn=1;
end
always begin
#18;
Clk=~Clk;
end
endmodule
