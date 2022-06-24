`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:37 12/01/2013 
// Design Name: 
// Module Name:    Data_mem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Data_mem(Clock,addr,datain,we,dataout);
    input        Clock;
    input [31:0] addr;
    input [31:0] datain;
    input        we;
    output[31:0] dataout;
    
	reg [31:0] ram [0:31];
	
	assign dataout = ram[addr[6:2]];
	
	always @ (posedge Clock) begin
			if (we) ram[addr[6:2]] = datain;
	end

	integer i;
	
	initial begin
			for ( i = 0 ; i <= 31 ; i = i + 1) ram [i] = 0;//i*i
	end		
	
endmodule
