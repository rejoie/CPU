`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 13:07:54
// Design Name: 
// Module Name: ALU
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


module ALU(X,Y,Aluc,R,Z);
input [31:0]X,Y;
input [1:0]Aluc;
output [31:0]R;
output Z;
wire [31:0]d_as,d_and,d_or,d_and_or,cout;
ADDSUB_32 as32(X,Y,Aluc[0],d_as,cout);
assign d_and=X&Y;
assign d_or=X|Y;
MUX2X32 select1(d_and,d_or,Aluc[0],d_and_or);
MUX2X32 select2(d_as,d_and_or,Aluc[1],R);
assign Z=~|R;
endmodule
