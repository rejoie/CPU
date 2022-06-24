`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 19:14:00
// Design Name: 
// Module Name: SHIFTER_32_test
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
//module SHIFTER_32(X,Sa,Arith,Right,Sh);

module SHIFTER_32_test;
reg [31:0]X,Sa;
reg Arith,Right;
wire [31:0]Sh;
SHIFTER_32 uut(.X(X),.Sa(Sa),.Arith(Arith),.Right(Right),.Sh(Sh));
initial begin
X=32'h1;
Sa=32'h0;
Arith=1;
Right=0;
#20;Sa=32'h1;
#20;Sa=32'h2;
#20;Sa=32'h3;
#20;Sa=32'h4;
#20;Sa=32'h5;
#20;Sa=32'h6;
#20;Sa=32'h7;
#20;Sa=32'h8;
#20;Sa=32'h9;
#20;Sa=32'ha;
#20;Sa=32'hb;
#20;Sa=32'hc;
#20;Sa=32'hd;
#20;Sa=32'he;
#20;Sa=32'hf;
#20;Sa=32'h10;
#20;Sa=32'h11;
#20;Sa=32'h12;
#20;Sa=32'h13;
#20;Sa=32'h14;
#20;Sa=32'h15;
#20;Sa=32'h16;
#20;Sa=32'h17;
#20;Sa=32'h18;
#20;Sa=32'h19;
#20;Sa=32'h1a;
#20;Sa=32'h1b;
#20;Sa=32'h1c;
#20;Sa=32'h1d;
#20;Sa=32'h1e;
#20;Sa=32'h1f;
end
endmodule
