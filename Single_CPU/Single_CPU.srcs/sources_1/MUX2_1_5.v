`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/04 23:54:28
// Design Name: 
// Module Name: MUX2_1_5
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


module MUX2_1_5(a , b , s , c) ;
    input[ 4:0] a , b ;
    input s;
    output [4:0] c;
    assign c = s ? b : a;
endmodule
