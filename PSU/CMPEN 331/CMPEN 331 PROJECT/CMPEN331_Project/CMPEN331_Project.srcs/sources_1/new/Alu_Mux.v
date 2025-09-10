`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2025 14:59:34
// Design Name: 
// Module Name: Alu_Mux
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


module Alu_Mux(input [31:0] eqb, input [31:0] eimm32, input ealuimm, output reg [31:0] b);
always @ (*)
  begin
    case (ealuimm)
    0: 
      begin
        b = eqb;
      end
    1:
      begin
        b = eimm32;
      end
    endcase
  end
endmodule
