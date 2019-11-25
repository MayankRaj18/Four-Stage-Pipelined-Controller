`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:06:23 09/02/2019 
// Design Name: 
// Module Name:    internal_register 
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

module internal_register(
    input [3:0] s1_in_ir,
    input [3:0] s2_in_ir,
    input [3:0] dest_in_ir,
    input [31:0] data_in_ir,
    input [2:0] flags_in_ir,
    output [31:0] data_s1_out_ir,
    output [31:0] data_s2_out_ir,
    input clk,
    input reset_n
    );

reg [34:0] loc[15:0];
reg [31:0] data_s1_ir;
reg [31:0] data_s2_ir;

assign data_s1_out_ir=data_s1_ir;
assign data_s2_out_ir=data_s2_ir;


always@(posedge clk or negedge reset_n)
begin
  if(~reset_n)
  begin
	 	   data_s1_ir<=0;
		   data_s2_ir<=0;
  end
  else
  begin
	 if(dest_in_ir==s1_in_ir) //operand forwarding
	   data_s1_ir<=data_in_ir;
	 else
	   data_s1_ir<=loc[s1_in_ir][31:0];
		
	 if(dest_in_ir==s2_in_ir) //operand forwarding
	   data_s2_ir<=data_in_ir;
	 else
	   data_s2_ir<=loc[s2_in_ir][31:0];
  end
end

always@(posedge clk)
begin
  loc[dest_in_ir]<={flags_in_ir,data_in_ir};
end

endmodule
