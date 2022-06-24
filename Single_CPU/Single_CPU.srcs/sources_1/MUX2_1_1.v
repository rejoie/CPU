`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/05 21:59:24
// Design Name: 
// Module Name: MUX2_1_1
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


module MUX2_1_1(a , b , s , c) ;
    input a,b,s;
    output c;
    assign c = s ? b:a;
//    not i0(S_n,s);
//    nand i1(A0_S,a,S_n);
//    nand i2(A1_S,b,s);
//    nand i3(c,A0_S,A1_S);
endmodule
