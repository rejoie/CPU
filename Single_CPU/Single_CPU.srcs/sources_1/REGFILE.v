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
//    input CLK,                 // ʱ��
//    input RegWre,              // дʹ���źţ�Ϊ1ʱ����ʱ��������д��
//    input [4:0] rs,            // rs�Ĵ�����ַ����˿�
//    input [4:0] rt,            // rt�Ĵ�����ַ����˿�
//    input [4:0] WriteReg,       // ������д��ļĴ����˿ڣ����ַ��Դrt��rd�ֶ�
//    input [31:0] WriteData,    // д��Ĵ�������������˿�
//    output [31:0] ReadData1,   // rs�Ĵ�����������˿�
//    output [31:0] ReadData2    // rt�Ĵ�����������˿�

    reg [31:0] register[0:31];  // �½�16���Ĵ��������ڲ���
    // ��ʼʱ����32���Ĵ���ȫ����ֵΪ0
    integer i;
    initial 
    begin
       for(i = 0; i < 31; i = i + 1)  register[i] <= 0;
    end
    // ���Ĵ���
    assign Qa = register[Ra];
    assign Qb = register[Rb];
    // д�Ĵ���,�½���
    always@(negedge Clk)
    if(Clrn)
    begin
        for(i = 0; i < 31; i = i + 1)  register[i] = 0;
    end
    else
    begin
       // ����Ĵ�����Ϊ0������RegWr(We)Ϊ�棬д������
       if ((We == 1) && (Wr != 5'b00000))  register[Wr] = D;
    end 

//REG32 reg32(D,Y,Clk,Clrn,Q31,Q30,Q29,Q28,Q27,Q26,Q25,Q24,Q23,Q22,Q21,Q20,Q19,Q18,Q17,Q16,Q15,Q14,Q13,Q12,Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0);
//MUX32X32 select1(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31,Ra,Qa);
//MUX32X32 select2(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31,Rb,Qb);
endmodule
