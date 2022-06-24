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
module ALU_test;
reg [31:0]X,Y;
reg [1:0]Aluc;
wire [31:0]R;
wire Z;
ALU uut(.X(X),.Y(Y),.Aluc(Aluc),.R(R),.Z(Z));
initial begin
X=32'b10000000000001100000000000000000;
Y=32'b00000000000001000000000000000001;
Aluc=2'b00;
#20;
Aluc=2'b01;
#20;
Aluc=2'b10;
#20;
Aluc=2'b11;
end
endmodule
