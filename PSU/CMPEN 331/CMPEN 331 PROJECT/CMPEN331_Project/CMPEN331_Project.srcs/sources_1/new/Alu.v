`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2025 15:05:29
// Design Name: 
// Module Name: Alu
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


module Alu(input [31:0] eqa, input [31:0] b, input [3:0] ealuc, output reg [31:0] r);
always @ (*)
  begin
    case (ealuc)
    4'b0000: begin r = eqa & b; end
    4'b0001: begin r = eqa | b; end
    4'b0010: begin r = eqa + b; end
    4'b0110: begin r = eqa - b; end
    4'b0111: begin r = eqa < b ? 1 : 0; end
    4'b1100: begin r = ~(eqa | b); end
    endcase
  end
endmodule
