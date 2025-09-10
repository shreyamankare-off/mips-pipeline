`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2025 17:21:16
// Design Name: 
// Module Name: testbench
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


module testbench();
reg clk;
wire [31:0] pc;
wire [31:0] dinstOut;
wire [31:0] eqa;
wire [31:0] eqb;
wire [31:0] eimm32;
wire [31:0] mr;
wire [31:0] mqb;
wire [31:0] wr;
wire [31:0] wdo;
wire [31:0] wbData;
wire ewreg, em2reg, ewmem;
wire ealuimm;
wire mwreg, mm2reg, mwmem;
wire wwreg, wm2reg;
wire [3:0] ealuc;
wire [4:0] edestReg;
wire [4:0] mdestReg;
wire [4:0] wdestReg;
wire [1:0] fwda;
wire [1:0] fwdb;
wire [31:0] qa;
wire [31:0] qb;
wire [31:0] fwva;
wire [31:0] fwvb; 

initial begin
clk = 0;
end

Datapath Datapath(clk, pc, dinstOut, ewreg, em2reg, ewmem, ealuimm, ealuc, edestReg, eqa, eqb, eimm32, mwreg, mm2reg, mwmem, mdestReg, mr, mqb, wwreg, wm2reg, wdestReg, wr, wdo, wbData, fwda, fwdb, qa, qb, fwva, fwvb);


always begin
  #1;
  clk = ~clk;
end 

endmodule
