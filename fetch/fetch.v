`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:40:32 09/01/2019 
// Design Name: 
// Module Name:    fetch 
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
module fetch(
    input [4:0] opcode_in,
    input [3:0] s1_in,
    input [3:0] s2_in,
    input [3:0] dest_in,
    input [31:0] ime_data_in,
    output [4:0] opcode_out_f,
    output [3:0] s1_out_f,
    output [3:0] s2_out_f,
    output [3:0] dest_out_f,
    output [31:0] ime_data_out_f,
    input clk,
    input reset_n
    );
wire [4:0] opcode_f_tmp;
wire [3:0] s1_f_tmp;
wire [3:0] s2_f_tmp;
wire [3:0] dest_f_tmp;
wire [31:0] ime_data_f_tmp;


	 
reciever_fetch u2a(
    .opcode_in_f_r(opcode_in),
    .s1_in_f_r(s1_in),
    .s2_in_f_r(s2_in),
    .dest_in_f_r(dest_in),
    .ime_data_in_f_r(ime_data_in),
    .opcode_out_f_r(opcode_f_tmp),
    .s1_out_f_r(s1_f_tmp),
    .s2_out_f_r(s2_f_tmp),
    .dest_out_f_r(dest_f_tmp),
    .ime_data_out_f_r(ime_data_f_tmp),
    .clk_r(clk),
    .reset_n_r(reset_n)
    );
	 
transmiter_fetch df(
    .opcode_in_f_t(opcode_f_tmp),
    .s1_in_f_t(s1_f_tmp),
    .s2_in_f_t(s2_f_tmp),
    .dest_in_f_t(dest_f_tmp),
    .ime_data_in_f_t(ime_data_f_tmp),
    .opcode_out_f_t(opcode_out_f),
    .s1_out_f_t(s1_out_f),
    .s2_out_f_t(s2_out_f),
    .dest_out_f_t(dest_out_f),
    .ime_data_out_f_t(ime_data_out_f)
    );

endmodule
