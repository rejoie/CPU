`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/01 12:19:33
// Design Name: 
// Module Name: REGFILE
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


module REGFILE(Ra,Rb,D,Wr,We,Clk,Clrn,Qa,Qb);
input [4:0] Ra,Rb,Wr;
input [31:0] D;
input We,Clk,Clrn;
output [31:0] Qa,Qb;
//wire [31:0] Y,Q31,Q30,Q29,Q28,Q27,Q26,Q25,Q24,Q23,Q22,Q21,Q20,Q19,Q18,Q17,Q16,Q15,Q14,Q13,Q12,Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0;

//DEC5T32E dec(Wr,We,Y);
//    input CLK,                 // 时钟
//    input RegWre,              // 写使能信号，为1时，在时钟上升沿写入
//    input [4:0] rs,            // rs寄存器地址输入端口
//    input [4:0] rt,            // rt寄存器地址输入端口
//    input [4:0] WriteReg,       // 将数据写入的寄存器端口，其地址来源rt或rd字段
//    input [31:0] WriteData,    // 写入寄存器的数据输入端口
//    output [31:0] ReadData1,   // rs寄存器数据输出端口
//    output [31:0] ReadData2    // rt寄存器数据输出端口

    reg [31:0] register[0:31];  // 新建16个寄存器，用于操作
    // 初始时，将32个寄存器全部赋值为0
    integer i;
    initial 
    begin
       for(i = 0; i < 31; i = i + 1)  register[i] <= 0;
    end
    // 读寄存器
    assign Qa = register[Ra];
    assign Qb = register[Rb];
    // 写寄存器,下降沿
    always@(negedge Clk)
    if(Clrn)
    begin
        for(i = 0; i < 31; i = i + 1)  register[i] = 0;
    end
    else
    begin
       // 如果寄存器不为0，并且RegWr(We)为真，写入数据
       if ((We == 1) && (Wr != 5'b00000))  register[Wr] = D;
    end 

//REG32 reg32(D,Y,Clk,Clrn,Q31,Q30,Q29,Q28,Q27,Q26,Q25,Q24,Q23,Q22,Q21,Q20,Q19,Q18,Q17,Q16,Q15,Q14,Q13,Q12,Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0);
//MUX32X32 select1(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31,Ra,Qa);
//MUX32X32 select2(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31,Rb,Qb);
endmodule
