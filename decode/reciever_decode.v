`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:25 09/04/2019 
// Design Name: 
// Module Name:    reciever_decode 
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
module reciever_decode(
    input [4:0] opcode_in_d_r,
    input [3:0] dest_in_d_r,
    input [3:0] s1_in_d_r,
    input [3:0] s2_in_d_r,
    input [31:0] ime_data_in_d_r,
    output reg [4:0] opcode_out_d_r,
    output reg [3:0] dest_out_d_r,
    output reg [3:0] s1_out_d_r,
    output reg [3:0] s2_out_d_r,
    output reg [31:0] ime_data_out_d_r,
    input clk_r,
    input reset_n_r
    );

always@(posedge clk_r or negedge reset_n_r)
begin
  if(~reset_n_r)
  begin
    opcode_out_d_r<=0;
	 dest_out_d_r<=0;
	 s1_out_d_r<=0;
	 s2_out_d_r<=0;
	 ime_data_out_d_r<=0;
  end
  else
  begin
    opcode_out_d_r <= opcode_in_d_r;
	 dest_out_d_r <= dest_in_d_r;
	 s1_out_d_r <= s1_in_d_r;
	 s2_out_d_r <= s2_in_d_r;
	 ime_data_out_d_r <= ime_data_in_d_r;
  end
end

endmodule
