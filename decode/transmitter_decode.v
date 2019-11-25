`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:12 09/04/2019 
// Design Name: 
// Module Name:    transmitter_decode 
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
module transmitter_decode(
    input [4:0] opcode_in_d_t,
    input [3:0] dest_in_d_t,
    input [3:0] s1_in_d_t,
    input [3:0] s2_in_d_t,
    input [31:0] ime_data_in_d_t,
    output reg [4:0] opcode_out_d_t,
    output reg [3:0] dest_out_d_t,
    output reg [3:0] s1_out_d_t,
    output reg [3:0] s2_out_d_t,
    output reg [31:0] ime_data_out_d_t
    );

always@(*)
begin
  if(opcode_in_d_t==5'b11001)
    ime_data_out_d_t=ime_data_in_d_t;
  else
    ime_data_out_d_t=0;
	 
  case(opcode_in_d_t)
	   5'b00001:dest_out_d_t=dest_in_d_t;
	   5'b00010:dest_out_d_t=dest_in_d_t;
	   5'b00011:dest_out_d_t=dest_in_d_t;
	   5'b00100:dest_out_d_t=dest_in_d_t;
	   5'b00101:dest_out_d_t=dest_in_d_t;
	   5'b00110:dest_out_d_t=dest_in_d_t;
	 
	   5'b01000:dest_out_d_t=dest_in_d_t;
	   5'b01001:dest_out_d_t=dest_in_d_t;
	   5'b01010:dest_out_d_t=dest_in_d_t;
	   5'b01011:dest_out_d_t=dest_in_d_t;
	 
	   5'b11000:dest_out_d_t=dest_in_d_t;
	   5'b11010:dest_out_d_t=dest_in_d_t;
	   5'b11100:dest_out_d_t=dest_in_d_t;
	   5'b11110:dest_out_d_t=dest_in_d_t;
		
	   5'b11001:dest_out_d_t=dest_in_d_t;
	   5'b11011:dest_out_d_t=dest_in_d_t; //store
		
	   default:dest_out_d_t=0;
	 	 
  endcase
  s1_out_d_t=s1_in_d_t;  
  s2_out_d_t=s2_in_d_t;  
  opcode_out_d_t=opcode_in_d_t;
end

endmodule
