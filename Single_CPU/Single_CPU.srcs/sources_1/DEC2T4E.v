`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/02 14:36:20
// Design Name: 
// Module Name: DEC2T4E
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


module DEC2T4E(I,En,Y);
input En;
input [1:0] I;
output reg [3:0] Y;
/*说明：
输入端：En=0时才有有效输出
输出端：Y_为译码输出
*/

always @(*)
    if (En==1) begin
        case(I[1:0])
            2'b00: Y[3:0]=4'b0001;
            2'b01: Y[3:0]=4'b0010;
            2'b10: Y[3:0]=4'b0100;
            2'b11: Y[3:0]=4'b1000;
	    endcase
    end

    else begin
        Y[3:0]=4'b0000;
    end
endmodule
