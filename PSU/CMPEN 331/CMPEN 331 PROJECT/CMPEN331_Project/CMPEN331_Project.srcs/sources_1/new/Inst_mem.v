`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2025 17:44:50
// Design Name: 
// Module Name: Inst_mem
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


module Inst_mem(input [31:0] pc, output reg [31:0] instOut);
reg [31:0] memory [0:63];
initial begin
  memory[25] = 32'b00000000001000100001100000100000;
  memory[26] = 32'b00000001001000110010000000100010;
  memory[27] = 32'b00000000011010010010100000100101;
  memory[28] = 32'b00000000011010010011000000100110;
  memory[29] = 32'b00000000011010010011100000100100;
end
always @ (*)
  begin
    instOut = memory[pc[7:2]];
  end
endmodule
