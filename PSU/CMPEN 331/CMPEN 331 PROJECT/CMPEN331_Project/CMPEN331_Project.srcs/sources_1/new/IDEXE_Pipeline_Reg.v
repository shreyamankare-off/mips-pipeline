`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2025 16:27:31
// Design Name: 
// Module Name: IDEXE_Pipeline_Reg
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


module IDEXE_Pipeline_Reg(
input wreg, m2reg, wmem, aluimm, clock,
input [3:0] aluc,
input [4:0] destReg,
input [31:0] qa,
input [31:0] qb,
input [31:0] imm32,
output reg ewreg, em2reg, ewmem, ealuimm,
output reg [3:0] ealuc,
output reg [4:0] edestReg,
output reg [31:0] eqa,
output reg [31:0] eqb,
output reg [31:0] eimm32
);

always @ (posedge clock)
  begin
    ewreg <= wreg;
    em2reg <= m2reg;
    ewmem <= wmem;
    ealuc <= aluc;
    ealuimm <= aluimm;
    edestReg <= destReg;
    eqa <= qa;
    eqb <= qb;
    eimm32 <= imm32;
  end
endmodule
