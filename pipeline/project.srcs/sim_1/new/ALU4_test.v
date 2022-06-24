`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 16:01:30
// Design Name: 
// Module Name: ALU4_test
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
//ALU4(X,Y,Aluc,R,Z);

module ALU4_test;
reg [31:0]X,Y;
reg [3:0]Aluc;
wire [31:0]R;
wire Z;
ALU4 uut(.X(X),.Y(Y),.Aluc(Aluc),.R(R),.Z(Z));
initial begin
X=32'h0000001a;Y=32'habf03872;Aluc=4'bX000;
#20;
Aluc=4'bX100;
#20;Aluc=4'bX001;#20;Aluc=4'bX101;#20;Aluc=4'bX010;#20;Aluc=4'bX110;
#20;Aluc=4'b0011;#20;Aluc=4'b0111;#20;Aluc=4'b1111;
end
endmodule
