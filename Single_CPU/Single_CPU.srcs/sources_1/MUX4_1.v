`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 16:52:57
// Design Name: 
// Module Name: MUX4_1
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


module MUX4_1(a0,a1,a2,a3, s, c);
    input [ 31:0]a0,a1,a2,a3;
    input [1:0]s;
    output [31:0] c;
    assign c = ( s == 2'b00 ) ? a0 :
                ( s == 2'b01 ) ? a1 :
                ( s == 2'b10 ) ? a2 : a3;
endmodule
