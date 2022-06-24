`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 19:58:56
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


module CONUNIT(Op,Func,Z,Regrt,Se,Wreg,Aluqa,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg);
input [5:0]Op,Func;
input Z;
output Regrt,Se,Wreg,Aluqb,Wmem,Reg2reg,Aluqa;
output [1:0]Pcsrc;
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
wire I_bne=~Op[5]&~Op[4]&~Op[3]&Op[2]&~Op[1]&Op[0];
wire I_lui=~Op[5]&~Op[4]&Op[3]&Op[2]&Op[1]&Op[0];
wire I_j=~Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&~Op[0];
assign Regrt=I_addi|I_andi|I_ori|I_xori|I_lw|I_sw|I_beq|I_bne|I_lui|I_j;
assign Se=I_addi|I_lw|I_sw|I_beq|I_bne;
assign Wreg=I_add|I_sub|I_and|I_or|I_xor|I_sll|I_srl|I_sra|I_addi|I_andi|I_ori|I_xori|I_lw|I_lui;
assign Aluqb=I_add|I_sub|I_and|I_or|I_xor||I_sll|I_srl|I_sra|I_beq|I_bne|I_j;
assign Aluc[3]=I_sra;
assign Aluc[2]=I_srl|I_sra|I_sub|I_or|I_ori|I_beq|I_bne|I_lui;
assign Aluc[1]=I_xor|I_sll|I_srl|I_sra|I_xori|I_lui;
assign Aluc[0]=I_or|I_and|I_ori|I_andi|I_sll|I_srl|I_sra;
assign Wmem=I_sw;
assign Pcsrc[1]=I_beq&Z|I_bne&~Z|I_j;
assign Pcsrc[0]=I_j;
assign Reg2reg=I_add|I_sub|I_and|I_or|I_xor|I_sll|I_srl|I_sra|I_addi|I_andi|I_ori|I_xori|I_sw|I_beq|I_bne|I_lui|I_j;
assign Aluqa=I_sll|I_srl|I_sra;
endmodule
