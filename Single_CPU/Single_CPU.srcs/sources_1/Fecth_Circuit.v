`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/04 12:16:30
// Design Name: 
// Module Name: Fecth_Circuit
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


module Fecth_Circuit(
    input Clk,
    input Reset,
    input [1:0] PCsrc,
    output[31:0] instruction
    );
    wire Cout;
    wire [31:0] newAdress,S,Br_addr,jump,currentAddress;
    
    always@(posedge Clk);
    begin
    PC pc(Clk,Reset,newAdress,currentAddress);
    CLA_32 add(32'h00000004,currentAddress,1'b0,S,Cout);
    MUX4_1 select(S,32'h00000000,Br_addr,jump,PCsrc,newAdress);
    Br_Jump_addr brAndJump(instruction,S,Br_addr,jump);
    Inst_mem addr(currentAddress,instruction);
    end
endmodule
