`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2025 17:58:32
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
input [31:0] mr,
input [31:0] mqb,
input mwmem, clk,
output reg [31:0] mdo);
reg [31:0] data_memory [0:63];
initial begin
  data_memory[0] = 32'b10100000000000000000000010101010;
  data_memory[1] = 32'b00010000000000000000000000010001;
  data_memory[2] = 32'b00100000000000000000000000100010;
  data_memory[3] = 32'b00110000000000000000000000110011;
  data_memory[4] = 32'b01000000000000000000000001000100;
  data_memory[5] = 32'b01010000000000000000000001010101;
  data_memory[6] = 32'b01100000000000000000000001100110;
  data_memory[7] = 32'b01110000000000000000000001110111;
  data_memory[8] = 32'b10000000000000000000000010001000;
  data_memory[9] = 32'b10010000000000000000000010011001;
end
always @ (*)
  begin
    mdo = data_memory[mr[7:2]];
  end
always @ (negedge clk)
  begin 
    if (mwmem == 1) begin
      data_memory[mr[7:2]] <= mqb;
    end
  end
endmodule
