`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:28:56 09/04/2019 
// Design Name: 
// Module Name:    reciever_execute 
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
module reciever_execute(
    input [4:0] opcode_in_e_r,
    input [3:0] dest_in_e_r,
    input [3:0] s1_in_e_r,
    input [3:0] s2_in_e_r,
    input [3:0] prv__inst_dest_r,
    input [31:0] ime_data_in_e_r,
    input [31:0] data_s1_in_e_r,
    input [31:0] data_s2_in_e_r,
    input [31:0] data_result_out_e_r,
	 output reg[31:0] a_tmp_r,
    output reg[31:0] b_tmp_r,
    output reg[31:0] idata_tmp_r,
    output reg[4:0] opcode_tmp_r,
    output reg[3:0] dest_tmp_r,
	 input clk,
    input reset_n
    );

always@(posedge clk or negedge reset_n)
begin
  if(~reset_n)
  begin
    a_tmp_r<=0;
    b_tmp_r<=0;
    idata_tmp_r<=0;
	 opcode_tmp_r<=0;
	 dest_tmp_r<=0;
  end
  else
  begin
    if(s1_in_e_r==prv__inst_dest_r)
	   a_tmp_r<=data_result_out_e_r;
	 else
      a_tmp_r<=data_s1_in_e_r;
	 if(s2_in_e_r==prv__inst_dest_r)
	   b_tmp_r<=data_result_out_e_r;
	 else
      b_tmp_r<=data_s2_in_e_r;
	 idata_tmp_r<=ime_data_in_e_r;
	 opcode_tmp_r<=opcode_in_e_r;
	 dest_tmp_r<=dest_in_e_r;
  end
end

endmodule
