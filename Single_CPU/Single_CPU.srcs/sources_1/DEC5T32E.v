`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/01 12:43:39
// Design Name: 
// Module Name: DEC5T32E
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


module DEC5T32E(I,En,Y);
input [4:0] I;
input En;
output reg [31:0] Y;

/*˵����
����ˣ�En=1ʱ������Ч���
����ˣ�YΪ�������
*/

always @(*)
    if (En==1) begin
        case(I[4:0])
            5'b00000: Y[31:0]=32'b00_00000_00000_00000_00000_00000_00001;
            5'b00001: Y[31:0]=32'b00_00000_00000_00000_00000_00000_00010;
            5'b00010: Y[31:0]=32'b00_00000_00000_00000_00000_00000_00100;
            5'b00011: Y[31:0]=32'b00_00000_00000_00000_00000_00000_01000;
            5'b00100: Y[31:0]=32'b00_00000_00000_00000_00000_00000_10000;
            5'b00101: Y[31:0]=32'b00_00000_00000_00000_00000_00001_00000;
            5'b00110: Y[31:0]=32'b00_00000_00000_00000_00000_00010_00000;
            5'b00111: Y[31:0]=32'b00_00000_00000_00000_00000_00100_00000;
            5'b01000: Y[31:0]=32'b00_00000_00000_00000_00000_01000_00000;
            5'b01001: Y[31:0]=32'b00_00000_00000_00000_00000_10000_00000;
            5'b01010: Y[31:0]=32'b00_00000_00000_00000_00001_00000_00000;
            5'b01011: Y[31:0]=32'b00_00000_00000_00000_00010_00000_00000;
            5'b01100: Y[31:0]=32'b00_00000_00000_00000_00100_00000_00000;
            5'b01101: Y[31:0]=32'b00_00000_00000_00000_01000_00000_00000;
            5'b01110: Y[31:0]=32'b00_00000_00000_00000_10000_00000_00000;
            5'b01111: Y[31:0]=32'b00_00000_00000_00001_00000_00000_00000;
            5'b10000: Y[31:0]=32'b00_00000_00000_00010_00000_00000_00000;
            5'b10001: Y[31:0]=32'b00_00000_00000_00100_00000_00000_00000;
            5'b10010: Y[31:0]=32'b00_00000_00000_01000_00000_00000_00000;
            5'b10011: Y[31:0]=32'b00_00000_00000_10000_00000_00000_00000;
            5'b10100: Y[31:0]=32'b00_00000_00001_00000_00000_00000_00000;
            5'b10101: Y[31:0]=32'b00_00000_00010_00000_00000_00000_00000;
            5'b10110: Y[31:0]=32'b00_00000_00100_00000_00000_00000_00000;
            5'b10111: Y[31:0]=32'b00_00000_01000_00000_00000_00000_00000;
            5'b11000: Y[31:0]=32'b00_00000_10000_00000_00000_00000_00000;
            5'b11001: Y[31:0]=32'b00_00001_00000_00000_00000_00000_00000;
            5'b11010: Y[31:0]=32'b00_00010_00000_00000_00000_00000_00000;
            5'b11011: Y[31:0]=32'b00_00100_00000_00000_00000_00000_00000;
            5'b11100: Y[31:0]=32'b00_01000_00000_00000_00000_00000_00000;
            5'b11101: Y[31:0]=32'b00_10000_00000_00000_00000_00000_00000;
            5'b11110: Y[31:0]=32'b01_00000_00000_00000_00000_00000_00000;
            5'b11111: Y[31:0]=32'b10_00000_00000_00000_00000_00000_00000;
	endcase
    end

    else begin
        Y[31:0]=32'b00_00000_00000_00000_00000_00000_00000;
    end

/*
˵����
����ˣ�Enʹ���źţ��͵�ƽ��Ч��[4:0]I�����������λ����������ǰ��λ����ڶ�����·�������������һ����·��
����ˣ�[31:0] Y���͵�ƽ��Ч���������������֡�


wire [2:0] A1;  //1/2 DEC2T4E������[1:0] I
wire [1:0] A2;  //��ƬDEC3T8E������[2:0] I
wire [3:0] Y_;  //1/2 DEC2T4E����� ͬʱҲ����Ƭ74HC138��ʹ���ź�E1
wire E2_,E3;    //��ƬDEC3T8E��ʹ���ź�
wire [7:0] L0_; //����Ϊ��ƬDEC3T8E���Ե����
wire [7:0] L1_;
wire [7:0] L2_;
wire [7:0] L3_;

assign E_  = 1'b0;
assign E2_ = 1'b0;
assign E3  = 1'b1;
//E_��E2_Ϊ�͵�ƽ��Ч����ֵΪ0��E3Ϊ�ߵ�ƽ��Ч����ֵΪ1��E1_Ϊ�͵�ƽ��Ч���ɵ�һ����·�����Y_����������ѡ����һƬоƬ���������á�

genvar i;
for(i=2;i>=0;i=i-1) assign A1[i] = I[i];
for(i=4;i>=3;i=i-1) assign A2[i-3] = I[i];
//ѭ����ֵ����[4:0] B��ǰ��λ��ֵ��[2:0] A1��ǰ��λ������λ��ֵ��[1:0] A2��ǰ��λ��

DEC2T4E U(A2,E_,Y_);
DEC3T8E U0(A1,Y_[0],E2_,E3,L0_);
DEC3T8E U1(A1,Y_[1],E2_,E3,L1_);
DEC3T8E U2(A1,Y_[2],E2_,E3,L2_);
DEC3T8E U3(A1,Y_[3],E2_,E3,L3_);
//�Ⱥ�ִ��������·

//ÿ������󣬵ڶ�����·ֻ��һƬоƬ���������������������������Ϊ8'b11111111���������Ҫ��
assign L_ = {L3_[7:0], L2_[7:0], L1_[7:0], L0_[7:0]};
*/
endmodule