`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2025 05:29:03
// Design Name: 
// Module Name: FwdA_Mux
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


module FwdA_Mux(
input [1:0] fwda, input [31:0] qa, input [31:0] r, input [31:0] mr, input [31:0] do, output reg [31:0] da);
always @(*) begin
  case (fwda)
    2'b00: begin da = qa; end
    2'b01: begin da = r; end
    2'b10: begin da = mr; end
    2'b11: begin da = do; end
  endcase
end
endmodule
