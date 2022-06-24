`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/04 22:49:45
// Design Name: 
// Module Name: Single_CPU
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


module Single_CPU(Clk,Reset,instruction,Qa,Qb,R,D);
    input Clk,Reset;
    output [31:0] instruction,Qa,Qb,R,D;
    wire [31:0] EXT_imm16,Y,dataout;
    wire [4:0] Wr;
    wire [2:0] Aluc;
    wire [1:0] Pcsrc;
    wire Se,Regrt,Wreg,Aluqb,Wmem,Reg2reg,Z;
    
    Fecth_Circuit w0(Clk,Reset,Pcsrc,instruction);
    CONUNIT w1(instruction[31:26],instruction[5:0],Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg);
    MUX2_1_5 w2(instruction[15:11],instruction[20:16],Regrt,Wr);//Ϊ1ѡrt
    EXT16T32 w3(instruction[15:0],Se,EXT_imm16);
    REGFILE w4(instruction[25:21],instruction[20:16],D,Wr,Wreg,Clk,Reset,Qa,Qb);
    MUX2_1 w5(EXT_imm16,Qb,Aluqb,Y);
    ALU w6(Qa,Y,Aluc,R,Z);
    Data_mem w7(Clk,R,Qb,Wmem,dataout);
    MUX2_1 w8(dataout,R,Reg2reg,D);
endmodule
