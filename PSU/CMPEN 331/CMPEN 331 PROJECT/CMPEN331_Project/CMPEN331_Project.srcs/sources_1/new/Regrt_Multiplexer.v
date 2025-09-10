`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2025 08:57:59
// Design Name: 
// Module Name: Regrt_Multiplexer
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


module Regrt_Multiplexer(input [4:0] rt, input [4:0] rd, input regrt, output reg [4:0] destReg);
always @ (*)
  begin
    case (regrt)
      0:
      begin
      destReg = rd;
      end
      
      1:
      begin
      destReg = rt;
      end
    endcase
  end
endmodule
