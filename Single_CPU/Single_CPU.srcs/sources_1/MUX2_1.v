`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/28 17:01:17
// Design Name: 
// Module Name: MUX2_1
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


module MUX2_1(a , b , s , c) ;
    input[ 31:0] a , b ;
    input s;
    output [31:0] c;
    assign c = s ? b : a;
endmodule
