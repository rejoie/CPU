`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/08 22:37:54
// Design Name: 
// Module Name: test_CPU
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


module test_CPU();
    reg Clk,Reset;
    wire [31:0] instruction,R,Qb,Qa,D;
    
    Single_CPU u(Clk,Reset,instruction,Qa,Qb,R,D);
    
    initial begin        
    Clk=0;
    Reset=1;
         #50
        Reset<=0;
    end
    always begin
       #50;
        Clk = ~Clk; 
    end
endmodule
