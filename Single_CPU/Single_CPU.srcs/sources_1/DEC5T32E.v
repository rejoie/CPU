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

/*说明：
输入端：En=1时才有有效输出
输出端：Y为译码输出
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
说明：
输入端：En使能信号，低电平有效；[4:0]I代表输入的五位二进制数，前三位输入第二级电路，后两级输入第一级电路；
输出端：[31:0] Y，低电平有效，代表译码后的数字。


wire [2:0] A1;  //1/2 DEC2T4E的输入[1:0] I
wire [1:0] A2;  //四片DEC3T8E的输入[2:0] I
wire [3:0] Y_;  //1/2 DEC2T4E的输出 同时也是四片74HC138的使能信号E1
wire E2_,E3;    //四片DEC3T8E的使能信号
wire [7:0] L0_; //以下为四片DEC3T8E各自的输出
wire [7:0] L1_;
wire [7:0] L2_;
wire [7:0] L3_;

assign E_  = 1'b0;
assign E2_ = 1'b0;
assign E3  = 1'b1;
//E_和E2_为低电平有效，赋值为0；E3为高电平有效，赋值为1；E1_为低电平有效，由第一级电路的输出Y_决定，其起选择哪一片芯片工作的作用。

genvar i;
for(i=2;i>=0;i=i-1) assign A1[i] = I[i];
for(i=4;i>=3;i=i-1) assign A2[i-3] = I[i];
//循环赋值，将[4:0] B的前三位赋值给[2:0] A1的前三位，后两位赋值给[1:0] A2的前两位。

DEC2T4E U(A2,E_,Y_);
DEC3T8E U0(A1,Y_[0],E2_,E3,L0_);
DEC3T8E U1(A1,Y_[1],E2_,E3,L1_);
DEC3T8E U2(A1,Y_[2],E2_,E3,L2_);
DEC3T8E U3(A1,Y_[3],E2_,E3,L3_);
//先后执行两级电路

//每次输入后，第二级电路只有一片芯片正常工作，非正常工作的输出均为8'b11111111，符合输出要求。
assign L_ = {L3_[7:0], L2_[7:0], L1_[7:0], L0_[7:0]};
*/
endmodule
