`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:49:15 09/04/2019 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 2
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(
    input [31:0] a_tmp_alu,
    input [31:0] b_tmp_alu,
    input [4:0] opcode_tmp_alu,
	 output reg[31:0] result_alu,
	 output reg carry_alu
    );
	 
always@(*)
begin
    case(opcode_tmp_alu)
	   5'b00000:{carry_alu,result_alu}=0;                                       // NO OPERATION
	   5'b00001:{carry_alu,result_alu}=a_tmp_alu+1'b1;                          // INCREMENT
	   5'b00010:{carry_alu,result_alu}=a_tmp_alu+b_tmp_alu;                     // ADD
	   5'b00011:{carry_alu,result_alu}=a_tmp_alu+b_tmp_alu+1'b1;                // ADD WITH CARRY
	   5'b00100:{carry_alu,result_alu}=a_tmp_alu-b_tmp_alu-1'b1;                // SUB WITH BORROW
	   5'b00101:{carry_alu,result_alu}=a_tmp_alu-b_tmp_alu;                     // SUB
	   5'b00110:{carry_alu,result_alu}=a_tmp_alu-1'b1;                          // DECRIMENT
	   5'b00111:{carry_alu,result_alu}=a_tmp_alu;                               // TRANSFER
	 
	   5'b01000:{carry_alu,result_alu}={1'b0,a_tmp_alu[0],a_tmp_alu[31:1]};     // ROTATE RIGHT 
	   5'b01001:{carry_alu,result_alu}={1'b0,1'b0,a_tmp_alu[31:1]};             // SHIFT RIGHT
	   5'b01010:{carry_alu,result_alu}={1'b0,a_tmp_alu[30:0],1'b0};             // SHIFT LEFT
	   5'b01011:{carry_alu,result_alu}={1'b0,a_tmp_alu[30:0],a_tmp_alu[31]};    // ROTATE LEFT
	 
	   5'b11000:{carry_alu,result_alu}={1'b0,a_tmp_alu|b_tmp_alu};              // LOGICAL OR
	   5'b11010:{carry_alu,result_alu}={1'b0,a_tmp_alu^b_tmp_alu};              // LOGICAL X-OR
	   5'b11100:{carry_alu,result_alu}={1'b0,a_tmp_alu&b_tmp_alu};              // LOGICAL AND
	   5'b11110:{carry_alu,result_alu}={1'b0,~a_tmp_alu};                       // LOGICAL NOT
	 
	   5'b11011:{carry_alu,result_alu}=a_tmp_alu;                               // STORE
	   default:{carry_alu,result_alu}=0;                                        // DEFAULT
	 	 
	 endcase
end

endmodule
