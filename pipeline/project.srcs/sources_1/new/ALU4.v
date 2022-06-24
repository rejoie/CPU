`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 15:26:43
// Design Name: 
// Module Name: ALU4
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


module ALU4(X,Y,Aluc,R,Z);
input [31:0]X,Y;
input[3:0]Aluc;
output [31:0]R;
output Z;
wire [31:0]d_addsub,d_or,d_and,d_oa,d_xor,d_lui,d_xl,d_sl,d_srl,d_sra,d_sr,d_s,d_up,d_down;
wire Cout;
ADDSUB_32 as(X,Y,Aluc[2],d_addsub,Cout);
assign d_or=X|Y;assign d_and=X&Y;
MUX2X32 mux1(d_and,d_or,Aluc[2],d_oa);
MUX2X32 mux2(d_addsub,d_oa,Aluc[0],d_up);
assign d_xor=X^Y;
SHIFTER_32 shift1(Y,5'b10000,,0,d_lui);
MUX2X32 mux3(d_xor,d_lui,Aluc[2],d_xl);
SHIFTER_32 shift2(Y,X,,0,d_sl);
SHIFTER_32 shift3(Y,X,0,1,d_srl);
SHIFTER_32 shift4(Y,X,1,1,d_sra);
MUX2X32 mux4(d_srl,d_sra,Aluc[3],d_sr);
MUX2X32 mux5(d_sl,d_sr,Aluc[2],d_s);
MUX2X32 mux6(d_xl,d_s,Aluc[0],d_down);
MUX2X32 mux7(d_up,d_down,Aluc[1],R);
assign Z=~|R;
endmodule
