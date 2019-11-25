`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:31 09/05/2019 
// Design Name: 
// Module Name:    operand_forwarding_execute 
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
module operand_forwarding_execute(
    input [3:0] dest_in_e_opf,
    output reg [3:0] prv__inst_dest_out_opf
    );

always@(*)
begin
 prv__inst_dest_out_opf=dest_in_e_opf;                                         // STORE ADDRESS OF PREVIOUS INSTRUCTION
end
endmodule
