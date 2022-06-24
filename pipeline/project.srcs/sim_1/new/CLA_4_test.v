`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 20:03:59
// Design Name: 
// Module Name: CLA_4_test
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


module CLA_4_test;
reg [3:0]x,y;
reg cin;
wire [3:0]s;
wire cout;
CLA_4 uut(.x(x),.y(y),.cin(cin),.s(s),.cout(cout));
initial begin
cin=0;x=4'b0001;y=4'b0010;
#20
cin=1;
end
endmodule
