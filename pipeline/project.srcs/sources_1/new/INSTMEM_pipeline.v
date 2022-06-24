`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 20:28:35
// Design Name: 
// Module Name: INSTMEM_pipeline
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


module INSTMEM_pipeline(Addr,Inst);
input [31:0]Addr;
output [31:0]Inst;

wire [31:0]ram[31:0];

assign ram[5'b00000]=32'h20220004;//addi $2,$1,0x4 ->$2=0x4
assign ram[5'b00001]=32'h34a1000f;//ori $1,$3,0xF ->$1=0xF
assign ram[5'b00010]=32'h00221822;//sub $3,$1,$2 ->$3=0xB          与前两条指令有数据冒险
assign ram[5'b00011]=32'h30240007;//andi $4,$1,0x7 ->$4=0x7
assign ram[5'b00100]=32'h00232820;//add $5,$1,$3 ->$5=0x1a
assign ram[5'b00101]=32'h00853024;//and $6,$4,$5 ->$6=0x2          与前两条指令有数据冒险
assign ram[5'b00110]=32'h00C83825;//or $7,$6,$8 ->$7=0x2           与前面一条指令有数据冒险
assign ram[5'b00111]=32'h10C70001;//beq $6,$7，0x1                 与前两条指令有数据冒险，有控制冒险，跳过下一条指令(暂停五个时钟周期）
assign ram[5'b01000]=32'h3C015678;//lui $1,0x5678  $1=0x56780000   如果没错，这条会被跳过
assign ram[5'b01001]=32'hAD210000;//sw $1,$9,0x0  memory[0]=$1=0xf 如果上面一条没被清除，那么会有数据冒险
assign ram[5'b01010]=32'h8D280000;//lw $8,$9,0x0 $8=memory[0]=0xf
assign ram[5'b01011]=32'h00086100;//xori $9,$8,0x2c $9=0x23        lw的数据冒险，会stall
assign ram[5'b01100]=32'h0800000f;//j 0xf                          跳到1111,控制冒险
assign ram[5'b01101]=32'h3C015678;//lui $1,0x5678  $1=0x5678  被跳过
assign ram[5'b01110]=32'h3C015678;//lui $1,0x5678  $1=0x5678  被跳过
assign ram[5'b01111]=32'h3C0Afbcd;//lui $10,0xfbcd $10=0xfbcd0000  跳到这里，这里正常
assign ram[5'b10000]=32'h01485826;//xor $11,$10,$8 $11=0xfbcdf000  数据冒险
assign ram[5'b10001]=32'h000566C0;//sll $12,$5,0b11011 $12=0xd0000000          
assign ram[5'b10010]=32'h000C6A03;//sra $13,$12,0b01000 $13=0xffd00000 数据冒险
assign ram[5'b10011]=32'h000D7202;//srl $14,$13,0b01000 $14=0x00ffd000 数据冒险
assign ram[5'b10100]=32'b00000000000000000000000000000000;
assign ram[5'b10101]=32'b00000000000000000000000000000000;
assign ram[5'b10110]=32'b00000000000000000000000000000000;
assign ram[5'b10111]=32'b00000000000000000000000000000000;
assign ram[5'b11000]=32'b00000000000000000000000000000000;
assign ram[5'b11001]=32'b00000000000000000000000000000000;
assign ram[5'b11010]=32'b00000000000000000000000000000000;
assign ram[5'b11011]=32'b00000000000000000000000000000000;
assign ram[5'b11100]=32'b00000000000000000000000000000000;
assign ram[5'b11101]=32'b00000000000000000000000000000000;
assign ram[5'b11110]=32'b00000000000000000000000000000000;
assign ram[5'b11111]=32'b00000000000000000000000000000000;
//存32条指令
assign Inst=ram[Addr[6:2]];
endmodule