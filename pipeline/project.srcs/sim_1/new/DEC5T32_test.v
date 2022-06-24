`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 17:12:11
// Design Name: 
// Module Name: DEC5T32_test
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


module DEC5T32E_test;
reg [4:0]I;
reg En;
wire [31:0]Y;
DEC5T32E uut(.I(I),.En(En),.Y(Y));
initial begin
I=5'b00000;
En=1;
#20
I=5'b01100;
#20
I=5'b10001;
#20
I=5'b11111;
end
endmodule
