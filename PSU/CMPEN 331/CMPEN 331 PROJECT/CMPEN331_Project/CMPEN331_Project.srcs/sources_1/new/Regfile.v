`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 07:41:26
// Design Name: 
// Module Name: Regfile
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


module Regfile(input [4:0] rs, input [4:0] rt, input [4:0] wdestReg, input [31:0] wbData, input wwreg, input clk, output reg [31:0] qa, output reg [31:0] qb);
reg [31:0] registers [0:31];
integer i;

initial begin
  registers[0] = 32'b00000000000000000000000000000000;
  registers[1] = 32'b10100000000000000000000010101010;
  registers[2] = 32'b00010000000000000000000000010001;
  registers[3] = 32'b00100000000000000000000000100010;
  registers[4] = 32'b00110000000000000000000000110011;
  registers[5] = 32'b01000000000000000000000001000100;
  registers[6] = 32'b01010000000000000000000001010101;
  registers[7] = 32'b01100000000000000000000001100110;
  registers[8] = 32'b01110000000000000000000001110111;
  registers[9] = 32'b10000000000000000000000010001000;
  registers[10] = 32'b10010000000000000000000010011001;
end

always @ (*)
  begin
    qa = registers[rs];
    qb = registers[rt];
  end
  
always @ (negedge clk)
  begin
    if (wwreg == 1) begin
      registers[wdestReg] <= wbData;
    end
  end
endmodule
