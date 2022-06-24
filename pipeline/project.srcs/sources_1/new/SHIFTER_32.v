`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 18:45:58
// Design Name: 
// Module Name: SHIFTER_32
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


module SHIFTER_32(X,Sa,Arith,Right,Sh);
input [31:0]X;
input [31:0]Sa;
input Arith,Right;
output [31:0]Sh;
wire [31:0]T4,S4,T3,S3,T2,S2,T1,S1,T0;
wire a;
and i(a,X[31],Arith);
wire [15:0]e={16{a}};
parameter z=16'b0;
wire [31:0]L1u,L1d,L2u,L2d,L3u,L3d,L4u,L4d,L5u,L5d;
assign L1u={X[15:0],z};
assign L1d={e,X[31:16]};
MUX2X32 M1l(L1u,L1d,Right,T4);
MUX2X32 Mlr(X,T4,Sa[4],S4);
//��һ����·ѡ��
assign L2u={S4[23:0],z[7:0]};
assign L2d={e[7:0],S4[31:8]};
MUX2X32 M2l(L2u,L2d,Right,T3);
MUX2X32 M2r(S4,T3,Sa[3],S3);
//�ڶ�����·ѡ��
assign L3u={S3[27:0],z[3:0]};
assign L3d={e[3:0],S3[31:4]};
MUX2X32 M3l(L3u,L3d,Right,T2);
MUX2X32 M3r(S3,T2,Sa[2],S2);
//��������·ѡ��
assign L4u={S2[29:0],z[1:0]};
assign L4d={e[1:0],S2[31:2]};
MUX2X32 M4l(L4u,L4d,Right,T1);
MUX2X32 M4r(S2,T1,Sa[1],S1);
//���ļ���·ѡ��
assign L5u={S1[30:0],z[0]};
assign L5d={e[0],S1[31:1]};
MUX2X32 M5l(L5u,L5d,Right,T0);
MUX2X32 M5r(S1,T0,Sa[0],Sh);
//���弶��·ѡ��
endmodule
