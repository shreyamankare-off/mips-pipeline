`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2025 14:30:25
// Design Name: 
// Module Name: WbMux
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


module WbMux(input [31:0] wr, input [31:0] wdo, input wm2reg, output reg [31:0] wbData);
always @ (*)
  begin
    if (wm2reg == 0) begin
      wbData = wr;
      end 
    else begin
      wbData = wdo;
    end
  end
endmodule
