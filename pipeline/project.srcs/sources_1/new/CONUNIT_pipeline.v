`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 19:58:56
// Design Name: 
// Module Name: CONUNIT
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


module CONUNIT_pipeline(Op,Func,Z,Regrt,Se,Wreg,Aluqa,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg,E_Rd,M_Rd,E_Wreg,M_Wreg,Rs,Rt,FwdA,FwdB,
E_Reg2reg,Stall,Condep,E_Op);
input [5:0]Op,Func,E_Op;
input Z,E_Wreg,M_Wreg,E_Reg2reg;
input [4:0]E_Rd,M_Rd,Rs,Rt;
output Regrt,Se,Wreg,Aluqb,Wmem,Reg2reg,Aluqa,Stall,Condep;
output [1:0]Pcsrc;
output reg [1:0]FwdA,FwdB;
output [3:0]Aluc;
wire R_type=~|Op;
wire I_add=R_type&Func[5]&~Func[4]&~Func[3]&~Func[2]&~Func[1]&~Func[0];
wire I_sub=R_type&Func[5]&~Func[4]&~Func[3]&~Func[2]&Func[1]&~Func[0];
wire I_and=R_type&Func[5]&~Func[4]&~Func[3]&Func[2]&~Func[1]&~Func[0];
wire I_or=R_type&Func[5]&~Func[4]&~Func[3]&Func[2]&~Func[1]&Func[0];
wire I_xor=R_type&Func[5]&~Func[4]&~Func[3]&Func[2]&Func[1]&~Func[0];
wire I_sll=R_type&~Func[5]&~Func[4]&~Func[3]&~Func[2]&~Func[1]&~Func[0];
wire I_srl=R_type&~Func[5]&~Func[4]&~Func[3]&~Func[2]&Func[1]&~Func[0];
wire I_sra=R_type&~Func[5]&~Func[4]&~Func[3]&~Func[2]&Func[1]&Func[0];
wire I_jr=R_type&~Func[5]&~Func[4]&Func[3]&~Func[2]&~Func[1]&~Func[0];
wire I_addi=~Op[5]&~Op[4]&Op[3]&~Op[2]&~Op[1]&~Op[0];
wire I_andi=~Op[5]&~Op[4]&Op[3]&Op[2]&~Op[1]&~Op[0];
wire I_ori=~Op[5]&~Op[4]&Op[3]&Op[2]&~Op[1]&Op[0];
wire I_xori=~Op[5]&~Op[4]&Op[3]&Op[2]&Op[1]&~Op[0];
wire I_lw=Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];
wire I_sw=Op[5]&~Op[4]&Op[3]&~Op[2]&Op[1]&Op[0];
wire I_beq=~Op[5]&~Op[4]&~Op[3]&Op[2]&~Op[1]&~Op[0];
wire E_beq=~E_Op[5]&~E_Op[4]&~E_Op[3]&E_Op[2]&~E_Op[1]&~E_Op[0];
wire I_bne=~Op[5]&~Op[4]&~Op[3]&Op[2]&~Op[1]&Op[0];
wire E_bne=~E_Op[5]&~E_Op[4]&~E_Op[3]&E_Op[2]&~E_Op[1]&E_Op[0];
wire I_lui=~Op[5]&~Op[4]&Op[3]&Op[2]&Op[1]&Op[0];
wire I_j=~Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&~Op[0];
wire E_j=~E_Op[5]&~E_Op[4]&~E_Op[3]&~E_Op[2]&E_Op[1]&~E_Op[0];
assign Regrt=I_addi|I_andi|I_ori|I_xori|I_lw|I_sw|I_beq|I_bne|I_lui|I_j;
assign Se=I_addi|I_lw|I_sw|I_beq|I_bne;
assign Wreg=I_add|I_sub|I_and|I_or|I_xor|I_sll|I_srl|I_sra|I_addi|I_andi|I_ori|I_xori|I_lw|I_lui;
assign Aluqb=I_add|I_sub|I_and|I_or|I_xor||I_sll|I_srl|I_sra|I_beq|I_bne|I_j;
assign Aluc[3]=I_sra;
assign Aluc[2]=I_srl|I_sra|I_sub|I_or|I_ori|I_beq|I_bne|I_lui;
assign Aluc[1]=I_xor|I_sll|I_srl|I_sra|I_xori|I_lui;
assign Aluc[0]=I_or|I_and|I_ori|I_andi|I_sll|I_srl|I_sra;
assign Wmem=I_sw;
assign Pcsrc[1]=E_beq&Z|E_bne&~Z|I_j;
assign Pcsrc[0]=I_j&~(E_beq&Z|E_bne&~Z);
assign Reg2reg=I_add|I_sub|I_and|I_or|I_xor|I_sll|I_srl|I_sra|I_addi|I_andi|I_ori|I_xori|I_sw|I_beq|I_bne|I_lui|I_j;
assign Aluqa=I_sll|I_srl|I_sra;
wire Stall_n=((Rs==E_Rd)|(Rt==E_Rd))&(E_Reg2reg==0)&(E_Rd!=0)&(E_Wreg==1);
assign Stall=~Stall_n;
wire Condep_n=(E_beq&Z)|(E_bne&~Z)|I_j;
assign Condep=~Condep_n;

always @(E_Rd,M_Rd,E_Wreg,M_Wreg,Rs)begin
FwdA=2'b00;
if((Rs==E_Rd)&(E_Rd!=0)&(E_Wreg==1))begin //条件a
FwdA=2'b10;
end 
else begin
if((Rs==M_Rd)&(M_Rd!=0)&(M_Wreg==1))begin//条件b
FwdA=2'b01;
end
end
end

always @(E_Rd,M_Rd,E_Wreg,M_Wreg,Rt,I_add,I_sub,I_and,I_or,I_sw,I_beq,I_bne,I_xor,I_sll,I_srl,I_sra)begin
FwdB=2'b00;
if((Rt==E_Rd)&((I_add==1)|(I_sub==1)|(I_and==1)|(I_or==1)|(I_sw==1)|(I_beq==1)|(I_bne==1)|(I_xor==1)|(I_sll==1)|(I_srl==1)|(I_sra==1))&(E_Rd!=0)&(E_Wreg==1))begin//条件c
FwdB=2'b10;
end 
else begin
if((Rt==M_Rd)&((I_add==1)|(I_sub==1)|(I_and==1)|(I_or==1)|(I_sw==1)|(I_beq==1)|(I_bne==1)|(I_xor==1)|(I_sll==1)|(I_srl==1)|(I_sra==1))&(M_Rd!=0)&(M_Wreg==1))begin//条件d
FwdB=2'b01;
end
end
end
endmodule
