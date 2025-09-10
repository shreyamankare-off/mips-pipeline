`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2025 16:03:56
// Design Name: 
// Module Name: EXEMEM_Pipeline_Register
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


module EXEMEM_Pipeline_Register(
input ewreg, em2reg, ewmem,
input [4:0] edestReg,
input [31:0] r,
input [31:0] eqb,
input clock,
output reg mwreg, mm2reg, mwmem,
output reg [4:0] mdestReg,
output reg [31:0] mr,
output reg [31:0] mqb);

always @ (posedge clock)
  begin
    mwreg <= ewreg;
    mm2reg <= em2reg;
    mwmem <= ewmem;
    mdestReg <= edestReg;
    mr <= r;
    mqb <= eqb;
  end
endmodule
