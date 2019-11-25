`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:45:41 09/04/2019 
// Design Name: 
// Module Name:    pipeline_controler_32_bit_version_2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 3
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module pipeline_controler_32_bit_version_3(
    input [4:0] opcode_in,
    input [3:0] s1_in,
    input [3:0] s2_in,
    input [3:0] dest_in,
    input [31:0] ime_data_in,
    output [31:0] result_out,
    output [2:0] flags_out,
    input sys_clk,
    input reset_n
    );
wire [4:0] opcode_f_d;
wire [4:0] opcode_d_e;
wire [3:0] s1_f_d_ir;
wire [3:0] s2_f_d_ir;
wire [3:0] s1_d_e;
wire [3:0] s2_d_e;
wire [3:0] dest_f_d;
wire [3:0] dest_d_e;
wire [3:0] dest_e_ir;
wire [31:0] ime_data_f_d;
wire [31:0] ime_data_d_e;
wire [31:0] data_s1_ir_e;
wire [31:0] data_s2_ir_e;
wire cntl_clk;

control_unit u1(
    .sys_clk(sys_clk),
	 .reset_n(reset_n),
	 .cntl_clk(cntl_clk)
	 );
	 
fetch u2(
    .opcode_in(opcode_in),
    .s1_in(s1_in),
    .s2_in(s2_in),
    .dest_in(dest_in),
    .ime_data_in(ime_data_in),
    .opcode_out_f(opcode_f_d),
    .s1_out_f(s1_f_d_ir),
    .s2_out_f(s2_f_d_ir),
    .dest_out_f(dest_f_d),
    .ime_data_out_f(ime_data_f_d),
    .clk(cntl_clk),
    .reset_n(reset_n)
    );

decode u3(
    .opcode_in_d(opcode_f_d),
    .dest_in_d(dest_f_d),
    .s1_in_d(s1_f_d_ir),
    .s2_in_d(s2_f_d_ir),
    .ime_data_in_d(ime_data_f_d),
    .opcode_out_d(opcode_d_e),
    .dest_out_d(dest_d_e),
    .s1_out_d(s1_d_e),
    .s2_out_d(s2_d_e),
    .ime_data_out_d(ime_data_d_e),
    .clk(cntl_clk),
    .reset_n(reset_n)
    );
internal_register u4(
    .s1_in_ir(s1_f_d_ir),
    .s2_in_ir(s2_f_d_ir),
    .dest_in_ir(dest_e_ir),
    .data_in_ir(result_out),
    .flags_in_ir(flags_out),
    .data_s1_out_ir(data_s1_ir_e),
    .data_s2_out_ir(data_s2_ir_e),
    .clk(cntl_clk),
    .reset_n(reset_n)
    );
execute u5(
    .opcode_in_e(opcode_d_e),
    .dest_in_e(dest_d_e),
    .s1_in_e(s1_d_e),
    .s2_in_e(s2_d_e),
    .ime_data_in_e(ime_data_d_e),
    .data_s1_in_e(data_s1_ir_e),
    .data_s2_in_e(data_s2_ir_e),
    .data_result_out_e(result_out),
    .flags_out_e(flags_out),
//    output [4:0] jump_out_e,
    .clk(cntl_clk),
	 .dest_out_e(dest_e_ir),
    .reset_n(reset_n)
    );

endmodule
