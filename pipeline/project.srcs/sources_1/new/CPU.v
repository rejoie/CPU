`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 12:53:23
// Design Name: 
// Module Name: CPU
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


module CPU(Clk,Clrn,Inst,Dread,Iaddr,Daddr,Dwrite,Wmem,Q31_reg32,Q30_reg32,Q29_reg32,Q28_reg32,Q27_reg32,Q26_reg32,Q25_reg32,Q24_reg32,
Q23_reg32,Q22_reg32,Q21_reg32,Q20_reg32,Q19_reg32,Q18_reg32,Q17_reg32,Q16_reg32,Q15_reg32,Q14_reg32,
Q13_reg32,Q12_reg32,Q11_reg32,Q10_reg32,Q9_reg32,Q8_reg32,Q7_reg32,Q6_reg32,Q5_reg32,Q4_reg32,
Q3_reg32,Q2_reg32,Q1_reg32,Q0_reg32);
input Clk,Clrn;
input [31:0]Inst,Dread;
output Wmem;
output [31:0]Iaddr,Daddr,Dwrite,Q31_reg32,Q30_reg32,Q29_reg32,Q28_reg32,Q27_reg32,Q26_reg32,Q25_reg32,Q24_reg32,
Q23_reg32,Q22_reg32,Q21_reg32,Q20_reg32,Q19_reg32,Q18_reg32,Q17_reg32,Q16_reg32,Q15_reg32,Q14_reg32,
Q13_reg32,Q12_reg32,Q11_reg32,Q10_reg32,Q9_reg32,Q8_reg32,Q7_reg32,Q6_reg32,Q5_reg32,Q4_reg32,
Q3_reg32,Q2_reg32,Q1_reg32,Q0_reg32;
wire [31:0]pc,D,Qa,im_ext,X,Y,im_extsl,pc4,pcim,pcaddr,pc_n;
wire [25:0]addr;
wire [15:0]im;
wire [5:0]op,func;
wire [4:0]rs,rt,rd,sa,Wr;
wire [3:0]Aluc,Pcsrc;
wire Z,Regrt,Se,Wreg,Aluqb,Wmem,Reg2reg,Cout,Aluqa;
assign op=Inst[31:26];assign func=Inst[5:0];
assign rs=Inst[25:21];assign rt=Inst[20:16];
assign rd=Inst[15:11];assign sa={27'b0,Inst[10:6]};
assign im=Inst[15:0];assign addr=Inst[25:0];
D_FFEC32 PC(pc,Clk,1'b1,Clrn,Iaddr,pc_n);
//CONUNIT(Op,Func,Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg);
CONUNIT conunit(op,func,Z,Regrt,Se,Wreg,Aluqa,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg);//会自己连回来
MUX2X5 mux2x5(rd,rt,Regrt,Wr);
//REGFILE(Ra,Rb,D,Wr,We,Clk,Clrn,Qa,Qb);
REGFILE regfile(rs,rt,D,Wr,Clrn&Wreg,Clk,Clrn,Qa,Dwrite,,Q31_reg32,Q30_reg32,Q29_reg32,Q28_reg32,Q27_reg32,Q26_reg32,Q25_reg32,Q24_reg32,
Q23_reg32,Q22_reg32,Q21_reg32,Q20_reg32,Q19_reg32,Q18_reg32,Q17_reg32,Q16_reg32,Q15_reg32,Q14_reg32,
Q13_reg32,Q12_reg32,Q11_reg32,Q10_reg32,Q9_reg32,Q8_reg32,Q7_reg32,Q6_reg32,Q5_reg32,Q4_reg32,
Q3_reg32,Q2_reg32,Q1_reg32,Q0_reg32);
EXT16T32 ext16t32(im,Se,im_ext);
MUX2X32 mux2x32sft(Qa,sa,Aluqa,X);
MUX2X32 mux2x32im(im_ext,Dwrite,Aluqb,Y);
ALU4 alu(X,Y,Aluc,Daddr,Z);
SHIFTER32_L2 shifter32_l2(im_ext,im_extsl);
ADDSUB_32 addsub1(Iaddr,32'h4,0,pc4,Cout);
ADDSUB_32 addsub2(pc4,im_extsl,0,pcim,Cout);
CONNECT connect(pc4,addr,pcaddr);
MUX2X32 mux2x32(Dread,Daddr,Reg2reg,D);
MUX4X32 mux4x32(pc4,,pcim,pcaddr,Pcsrc,pc);
endmodule
