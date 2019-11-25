`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:37 09/02/2019 
// Design Name: 
// Module Name:    decode 
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

module decode(
    input [4:0] opcode_in_d,
    input [3:0] dest_in_d,
    input [3:0] s1_in_d,
    input [3:0] s2_in_d,
    input [31:0] ime_data_in_d,
    output [4:0] opcode_out_d,
    output [3:0] dest_out_d,
    output [3:0] s1_out_d,
    output [3:0] s2_out_d,
    output [31:0] ime_data_out_d,
    input clk,
    input reset_n
    );
wire [4:0] opcode_tmp_d;
wire [3:0] dest_tmp_d;
wire [3:0] s1_tmp_d;
wire [3:0] s2_tmp_d;
wire [31:0] ime_data_tmp_d;



reciever_decode u3a(
    .opcode_in_d_r(opcode_in_d),
    .dest_in_d_r(dest_in_d),
    .s1_in_d_r(s1_in_d),
    .s2_in_d_r(s2_in_d),
    .ime_data_in_d_r(ime_data_in_d),
    .opcode_out_d_r(opcode_tmp_d),
    .dest_out_d_r(dest_tmp_d),
    .s1_out_d_r(s1_tmp_d),
    .s2_out_d_r(s2_tmp_d),
    .ime_data_out_d_r(ime_data_tmp_d),
    .clk_r(clk),
    .reset_n_r(reset_n)
    );
transmitter_decode u3b(
    .opcode_in_d_t(opcode_tmp_d),
    .dest_in_d_t(dest_tmp_d),
    .s1_in_d_t(s1_tmp_d),
    .s2_in_d_t(s2_tmp_d),
    .ime_data_in_d_t(ime_data_tmp_d),
    .opcode_out_d_t(opcode_out_d),
    .dest_out_d_t(dest_out_d),
    .s1_out_d_t(s1_out_d),
    .s2_out_d_t(s2_out_d),
    .ime_data_out_d_t(ime_data_out_d)
    );	 
	 
endmodule

/*
module decode(
    input [4:0] opcode_in_d,
    input [3:0] dest_in_d,
    input [31:0] ime_data_in_d,
    output [4:0] opcode_out_d,
    output [3:0] dest_out_d,
    output [31:0] ime_data_out_d,
    input clk,
    input reset_n
    );
reg [4:0] opcode_d;
reg [3:0] dest_d;
reg [31:0] ime_data_d;

assign opcode_out_d=opcode_d;
assign dest_out_d=dest_d;
assign ime_data_out_d=ime_data_d;

always@(posedge clk or negedge reset_n)
begin
  if(~reset_n)
  begin
    opcode_d<=0;
	 dest_d<=0;
	 ime_data_d<=0;
  end
  else
  begin
    opcode_d<=opcode_in_d;
	 dest_d<=dest_in_d;
	 ime_data_d<=ime_data_in_d;
  end
end

endmodule
*/