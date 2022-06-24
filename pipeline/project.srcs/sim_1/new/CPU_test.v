`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/27 16:14:23
// Design Name: 
// Module Name: CPU_test
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

//CPU(Clk,Clrn,Inst[31:0],Dread[31:0],Iaddr[31:0],Daddr[31:0],Dwrite[31:0],Wmem);
module CPU_test;
reg Clk,Clrn;
reg [31:0]Inst,Dread;
wire [31:0]Iaddr,Daddr,Dwrite;
wire Wmem;
CPU uut(.Clk(Clk),.Clrn(Clrn),.Inst(Inst),
.Dread(Dread),.Iaddr(Iaddr),.Daddr(Daddr),.Dwrite(Dwrite),.Wmem(Wmem));
initial begin
Clk=0;
Clrn=0;
#10
Clk=1;
Clrn=1;
#10
Clk=0;
#10
Clk=1;
#10
Clk=0;
#10
Clk=1;
end
endmodule
