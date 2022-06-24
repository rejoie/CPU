`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 16:38:49
// Design Name: 
// Module Name: REG32_test
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

//测试可以得出，0转化到1就是上升沿，此时将上次存的D和En存入寄存器
module REG32_test;
reg [31:0]D,En;
reg Clk,Clrn;
wire [31:0]Q31,Q30,Q29,Q28,Q27,Q26,Q25,Q24,Q23,Q22,Q21,
Q20,Q19,Q18,Q17,Q16,Q15,Q14,Q13,Q12,Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0;
REG32 uut(.D(D),.En(En),.Clk(Clk),.Clrn(Clrn),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),
.Q7(Q7),.Q8(Q8),.Q9(Q9),.Q10(Q10),.Q11(Q11),.Q12(Q12),.Q13(Q13),.Q14(Q14),.Q15(Q15),.Q16(Q16),.Q17(Q17),
.Q18(Q18),.Q19(Q19),.Q20(Q20),.Q21(Q21),.Q22(Q22),.Q23(Q23),.Q24(Q24),.Q25(Q25),.Q26(Q26),.Q27(Q27),
.Q28(Q28),.Q29(Q29),.Q30(Q30),.Q31(Q31));
initial begin
Clk=0;Clrn=0;D=32'h00000000;En=32'hFFFFFFFF;
#20
Clk=1;Clrn=1;D=32'h0000FFFF;En=32'hF0F0F0F0;
#20
Clk=0;
#20
Clk=1;D=32'h00000000;En=32'hFFFFFFFF;
#20
Clk=0;
#20
Clk=1;
end
endmodule
