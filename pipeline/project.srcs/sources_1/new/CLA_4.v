`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 12:52:25
// Design Name: 
// Module Name: CLA_4
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


module CLA_4(x,y,cin,s,cout);
input [3:0]x,y;
input cin;
output [3:0]s;
output cout;
and i0(g0,x[0],y[0]);
and i1(g1,x[1],y[1]);
and i3(g2,x[2],y[2]);
and i4(g3,x[3],y[3]);
or i5(p0,x[0],y[0]);
or i6(p1,x[1],y[1]);
or i7(p2,x[2],y[2]);
or i8(p3,x[3],y[3]);
and i9(f0,p0,cin);    //f±Ì æp*cin
or i10(cout0,g0,f0);
and i11(f1,p1,cout0);
or i12(cout1,g1,f1);
and i13(f2,p2,cout1);
or i14(cout2,g2,f2);
and i15(f3,p3,cout2);
or i16(cout,g3,f3);
xor i21(s[0],x[0],y[0],cin);
xor i22(s[1],x[1],y[1],cout0);
xor i23(s[2],x[2],y[2],cout1);
xor i24(s[3],x[3],y[3],cout2);
endmodule

