`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 11:02:31
// Design Name: 
// Module Name: COMPLETE_test
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
//COMPLETE(Clk,Clrn,Inst,Dread,Iaddr,Daddr);

module COMPLETE_test;
reg Clk,Clrn;
wire [31:0]Inst,Dread,Iaddr,Daddr,Q31_reg32,Q30_reg32,Q29_reg32,Q28_reg32,Q27_reg32,Q26_reg32,Q25_reg32,Q24_reg32,
Q23_reg32,Q22_reg32,Q21_reg32,Q20_reg32,Q19_reg32,Q18_reg32,Q17_reg32,Q16_reg32,Q15_reg32,Q14_reg32,
Q13_reg32,Q12_reg32,Q11_reg32,Q10_reg32,Q9_reg32,Q8_reg32,Q7_reg32,Q6_reg32,Q5_reg32,Q4_reg32,
Q3_reg32,Q2_reg32,Q1_reg32,Q0_reg32;
COMPLETE uut(.Clk(Clk),.Clrn(Clrn),.Inst(Inst),.Dread(Dread),.Iaddr(Iaddr),.Daddr(Daddr),.Q0_reg32(Q0_reg32),.Q1_reg32(Q1_reg32),.Q2_reg32(Q2_reg32),.Q3_reg32(Q3_reg32),.Q4_reg32(Q4_reg32),.Q5_reg32(Q5_reg32),.Q6_reg32(Q6_reg32),.Q7_reg32(Q7_reg32),.Q8_reg32(Q8_reg32),.Q9_reg32(Q9_reg32),.Q10_reg32(Q10_reg32),.Q11_reg32(Q11_reg32),.Q12_reg32(Q12_reg32),.Q13_reg32(Q13_reg32),.Q14_reg32(Q14_reg32),.Q15_reg32(Q15_reg32),.Q16_reg32(Q16_reg32),.Q17_reg32(Q17_reg32),.Q18_reg32(Q18_reg32),.Q19_reg32(Q19_reg32),.Q20_reg32(Q20_reg32),.Q21_reg32(Q21_reg32),.Q22_reg32(Q22_reg32),.Q23_reg32(Q23_reg32),.Q24_reg32(Q24_reg32),.Q25_reg32(Q25_reg32),.Q26_reg32(Q26_reg32),.Q27_reg32(Q27_reg32),.Q28_reg32(Q28_reg32),.Q29_reg32(Q29_reg32),.Q30_reg32(Q30_reg32),.Q31_reg32(Q31_reg32));
initial begin
Clk=0;Clrn=0;
#100;
Clrn=1;
end
always begin
#20;
Clk=~Clk;
end
endmodule
