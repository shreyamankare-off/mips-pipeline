`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2025 05:48:02
// Design Name: 
// Module Name: FwdB_Mux
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


module FwdB_Mux(input [1:0] fwdb, input [31:0] qb, input [31:0] r, input [31:0] mr, input [31:0] do, output reg [31:0] db);
always @(*) begin
  case (fwdb)
    2'b00: begin db = qb; end
    2'b01: begin db = r; end
    2'b10: begin db = mr; end
    2'b11: begin db = do; end
  endcase
end
endmodule
