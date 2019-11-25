`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:00 09/05/2019 
// Design Name: 
// Module Name:    transmiter_fetch 
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
module transmiter_fetch(
    input [4:0] opcode_in_f_t,
    input [3:0] s1_in_f_t,
    input [3:0] s2_in_f_t,
    input [3:0] dest_in_f_t,
    input [31:0] ime_data_in_f_t,
    output reg [4:0] opcode_out_f_t,
    output reg [3:0] s1_out_f_t,
    output reg [3:0] s2_out_f_t,
    output reg [3:0] dest_out_f_t,
    output reg [31:0] ime_data_out_f_t
    );

always@(*)
begin
  opcode_out_f_t=opcode_in_f_t;
  ime_data_out_f_t=ime_data_in_f_t;
  dest_out_f_t=dest_in_f_t;
  case(opcode_in_f_t)
	   5'b00001: begin s1_out_f_t=s1_in_f_t; s2_out_f_t=0; end
	   5'b00010:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=s2_in_f_t; end
	   5'b00011:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=s2_in_f_t; end
	   5'b00100:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=s2_in_f_t; end
	   5'b00101:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=s2_in_f_t; end
	   5'b00110:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=0; end
	   5'b00111:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=0; end
	 
	   5'b01000:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=0; end
	   5'b01001:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=0; end
	   5'b01010:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=0; end
	   5'b01011:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=0; end
	 
	   5'b11000:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=s2_in_f_t; end
	   5'b11010:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=s2_in_f_t; end
	   5'b11100:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=s2_in_f_t; end
	   5'b11110:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=s2_in_f_t; end

	   5'b11011:begin s1_out_f_t=s1_in_f_t; s2_out_f_t=0; end  //store
	   default:begin s1_out_f_t=0; s2_out_f_t=0; end
  endcase
end

endmodule
