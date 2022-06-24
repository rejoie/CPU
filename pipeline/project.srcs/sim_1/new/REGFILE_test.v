`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 16:15:46
// Design Name: 
// Module Name: REGFILE_test
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


module REGFILE_test;
reg [4:0]Ra,Rb,Wr;
reg [31:0]D;
reg We,Clk,Clrn;
wire [31:0]Qa,Qb;
REGFILE_down uut(.Ra(Ra),.Rb(Rb),.Wr(Wr),.D(D),.We(We),.Clk(Clk),.Clrn(Clrn),.Qa(Qa),.Qb(Qb));
initial begin
Clk=0;Clrn=0;Ra=5'b00001;Rb=5'b00010;Wr=5'b00000;D=32'h00000000;We=0;
#20
Ra=5'b00001;Rb=5'b00010;Wr=5'b00001;D=32'h12345678;We=1;Clk=1;
#20
Clk=0;
#20
Clk=1;Clrn=1;
end
always begin
#20;
Clk=~Clk;
end
endmodule
