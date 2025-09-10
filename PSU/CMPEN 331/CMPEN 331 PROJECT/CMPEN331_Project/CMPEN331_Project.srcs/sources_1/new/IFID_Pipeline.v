`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2025 13:18:41
// Design Name: 
// Module Name: IFID_Pipeline
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


module IFID_Pipeline(input [31:0] instOut, input clock, output reg [31:0] dinstOut);
always @ (posedge clock)
  begin
    dinstOut = instOut;
  end
endmodule
