`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/02 15:42:07
// Design Name: 
// Module Name: MUX32X32
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


module MUX32X32(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31,s,c);
input [31:0] Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31;
input [4:0] s;
output [31:0] c;

assign c=(s==5'b00000)?Q0:
            (s==5'b00001)?Q1:
            (s==5'b00010)?Q2:
            (s==5'b00011)?Q3:
            (s==5'b00100)?Q4:
            (s==5'b00101)?Q5:
            (s==5'b00110)?Q6:
            (s==5'b00111)?Q7:
            (s==5'b01000)?Q8:
            (s==5'b01001)?Q9:
            (s==5'b01010)?Q10:
            (s==5'b01011)?Q11:
            (s==5'b01100)?Q12:
            (s==5'b01101)?Q13:
            (s==5'b01110)?Q14:
            (s==5'b01111)?Q15:
            (s==5'b10000)?Q16:
            (s==5'b10001)?Q17:
            (s==5'b10010)?Q18:
            (s==5'b10011)?Q19:
            (s==5'b10100)?Q20:
            (s==5'b10101)?Q21:
            (s==5'b10110)?Q22:
            (s==5'b10111)?Q23:
            (s==5'b11000)?Q24:
            (s==5'b11001)?Q25:
            (s==5'b11010)?Q26:
            (s==5'b11011)?Q27:
            (s==5'b11100)?Q28:
            (s==5'b11101)?Q29:
            (s==5'b11110)?Q30:Q31;
          

endmodule
