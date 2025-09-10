`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2025 09:13:50
// Design Name: 
// Module Name: Immediate_Extender
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Immediate_Extender(input [15:0] imm, output reg [31:0] imm32);
always @ (*)
  begin 
    if (imm[15] == 0) begin
      imm32 = {16'h0000, imm};
    end
    else 
    begin
      imm32 = {16'hffff, imm};
    end
  end
endmodule
