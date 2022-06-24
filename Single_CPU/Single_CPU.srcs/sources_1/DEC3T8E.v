`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/02 14:40:02
// Design Name: 
// Module Name: DEC3T8E
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


module DEC3T8E(I,En,Y);
input En;
input [2:0] I;
output reg [7:0] Y;
/*说明：
输入端：En=1时才有有效输出
输出端：Y为译码输出
*/

always @(*)
    if (En==1) begin
        case(I[2:0])
            3'b000: Y[7:0]=8'b00000001;
            3'b001: Y[7:0]=8'b00000010;
            3'b010: Y[7:0]=8'b00000100;
            3'b011: Y[7:0]=8'b00001000;
            3'b100: Y[7:0]=8'b00010000;
            3'b101: Y[7:0]=8'b00100000;
            3'b110: Y[7:0]=8'b01000000;
            3'b111: Y[7:0]=8'b10000000;
	endcase
    end

    else begin
        Y[7:0]=8'b00000000;
    end
endmodule
