`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:17:05 09/04/2019 
// Design Name: 
// Module Name:    transmiter_execute 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 1
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module transmiter_execute(
    input [3:0] dest_tmp_t,
    input [4:0] opcode_tmp_t,
    input [31:0] a_tmp_t,
    input [31:0] b_tmp_t,	 
    input [31:0] result_t,
    input [31:0] idata_tmp_t,
	 input carry_t,
    output [31:0] data_result_out_e_t,
    output [2:0] flags_out_e_t,
	 output [3:0] dest_out_e_t
    );

reg [31:0] data_result_e;
wire sign;
wire zero;

assign data_result_out_e_t = data_result_e;
assign dest_out_e_t = dest_tmp_t;
assign sign = a_tmp_t < b_tmp_t;    // 0 for +ve & 1 for -ve
assign zero = a_tmp_t || b_tmp_t || idata_tmp_t;   // 0 if all inputs are zero
assign flags_out_e_t = {~zero,sign,carry_t};

always@(*)
begin
  case(opcode_tmp_t)
    5'b11001: data_result_e=idata_tmp_t;  //load
	 default: 
	 data_result_e=result_t;
  endcase
end


endmodule
