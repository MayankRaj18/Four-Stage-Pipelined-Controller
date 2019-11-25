`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:16:08 09/01/2019 
// Design Name: 
// Module Name:    control_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module control_unit(
    input sys_clk,
    input reset_n,
    output cntl_clk);
reg tmp_clk;

assign cntl_clk=tmp_clk;
always@(posedge sys_clk or negedge reset_n)
begin
  if(~reset_n)
   tmp_clk<=0;
  else
  tmp_clk<=~tmp_clk;
end

endmodule
