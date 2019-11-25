`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:38:11 09/03/2019 
// Design Name: 
// Module Name:    execute 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: max lut got 518
//
// Dependencies: 
//
// Revision: 3
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module execute(
    input [4:0] opcode_in_e,
    input [3:0] dest_in_e,
    input [3:0] s1_in_e,
    input [3:0] s2_in_e,
    input [31:0] ime_data_in_e,
    input [31:0] data_s1_in_e,
    input [31:0] data_s2_in_e,
    output [31:0] data_result_out_e,
    output [2:0] flags_out_e,
//    output [4:0] jump_out_e,
    input clk,
	 output [3:0] dest_out_e,
    input reset_n
    );


wire [31:0] result;
//reg [4:0] jump_e;
wire carry;
wire sign;
wire zero;

wire[31:0] a_tmp;
wire[31:0] b_tmp;
wire[4:0] opcode_tmp;
wire[31:0] idata_tmp;
wire[3:0] dest_tmp;
wire[3:0] s1_tmp;
wire[3:0] s2_tmp;
wire[3:0] prv__inst_dest_tmp;
/*
assign data_result_out_e=data_result_e;
assign dest_out_e=dest_e;
assign sign=a_tmp<b_tmp;    // 0 for +ve & 1 for -ve
assign zero= a_tmp || b_tmp || idata_tmp;   // 0 if all inputs are zero
assign flags_out_e={2'b0,zero,sign,carry};
*/
reciever_execute u5a(
    .opcode_in_e_r(opcode_in_e),
    .dest_in_e_r(dest_in_e),
    .s1_in_e_r(s1_in_e),
    .s2_in_e_r(s2_in_e),
    .prv__inst_dest_r(prv__inst_dest_tmp),
    .ime_data_in_e_r(ime_data_in_e),
    .data_s1_in_e_r(data_s1_in_e),
    .data_s2_in_e_r(data_s2_in_e),
    .data_result_out_e_r(data_result_out_e),
	 .a_tmp_r(a_tmp),
    .b_tmp_r(b_tmp),
    .idata_tmp_r(idata_tmp),
    .opcode_tmp_r(opcode_tmp),
    .dest_tmp_r(dest_tmp),
	 .clk(clk),
    .reset_n(reset_n)
    );
	 
//assign jump_out_e=jump_e;
/*
always@(posedge clk or negedge reset_n)
begin
  if(~reset_n)
  begin
    a_tmp<=0;
    b_tmp<=0;
    idata_tmp<=0;
	 opcode_tmp<=0;
	 dest_tmp<=0;
  end
  else
  begin
    a_tmp<=data_s1_in_e;
    b_tmp<=data_s2_in_e;
	 idata_tmp<=ime_data_in_e;
	 opcode_tmp<=opcode_in_e;
	 dest_tmp<=dest_in_e;
  end
end
*/

alu u5b(
    .a_tmp_alu(a_tmp),
    .b_tmp_alu(b_tmp),
    .opcode_tmp_alu(opcode_tmp),
	 .result_alu(result),
	 .carry_alu(carry)
    );

/*
always@(*)
begin
    case(opcode_tmp)
	   5'b00000:{carry,result}<=0;
	   5'b00001:{carry,result}<=a_tmp+1'b1;
	   5'b00010:{carry,result}<=a_tmp+b_tmp;
	   5'b00011:{carry,result}<=a_tmp+b_tmp+1'b1;
	   5'b00100:{carry,result}<=a_tmp-b_tmp-1'b1;
	   5'b00101:{carry,result}<=a_tmp-b_tmp;
	   5'b00110:{carry,result}<=a_tmp-1'b1;
	   5'b00111:{carry,result}<=a_tmp;
	 
	   5'b01000:{carry,result}<={1'b0,a_tmp[0],a_tmp[31:1]};
	   5'b01001:{carry,result}<={1'b0,1'b0,a_tmp[31:1]};
	   5'b01010:{carry,result}<={1'b0,a_tmp[30:0],1'b0};
	   5'b01011:{carry,result}<={1'b0,a_tmp[30:0],a_tmp[0]};
	 
	   5'b11000:{carry,result}<={1'b0,a_tmp|b_tmp};
	   5'b11010:{carry,result}<={1'b0,a_tmp^b_tmp};
	   5'b11100:{carry,result}<={1'b0,a_tmp&b_tmp};
	   5'b11110:{carry,result}<={1'b0,~a_tmp};
	 
	   //5'b11111:{data_result_e}<=ime_data_in_e;
	   5'b11011:{carry,result}<=a_tmp;  //store
	   //5'b11111:{data_result_e}<=~data_s1_in_e;  //jump
	   default:{carry,result}<=0;
	 	 
	 endcase
end
*/
transmiter_execute u5c(
    .dest_tmp_t(dest_tmp),
    .opcode_tmp_t(opcode_tmp),
    .a_tmp_t(a_tmp),
    .b_tmp_t(b_tmp),	 
    .result_t(result),
    .idata_tmp_t(idata_tmp),
	 .carry_t(carry),
    .data_result_out_e_t(data_result_out_e),
    .flags_out_e_t(flags_out_e),
	 .dest_out_e_t(dest_out_e)
    );

operand_forwarding_execute u5d(
    .dest_in_e_opf(dest_out_e),
    .prv__inst_dest_out_opf(prv__inst_dest_tmp)
	 
    );


endmodule
